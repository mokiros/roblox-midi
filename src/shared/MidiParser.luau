--!native

-- midi parser by mokiros
-- Docs used:
-- [1] https://midimusic.github.io/tech/midispec.html
-- [2] https://ccrma.stanford.edu/~craig/14q/midifile/MidiFileFormat.html
-- [3] https://en.wikipedia.org/wiki/Variable-length_quantity
-- [4] https://www.recordingblogs.com/wiki/time-division-of-a-midi-file

-- notes: luau buffers use little endian, midi files use big endian
-- doesn't matter when reading 1 byte chunks, but for 16 and 32 bit integers we need
-- to do additional operations (like bit32.byteswap)

local Midi = {}

Midi.EventTypes = {
	midi = 0,
	meta = 1,
	sysex = 2,
}

local MThd = 1684558925 -- "MThd" as unsigned 32 bit integer (little endian)
local MTrk = 1802654797 -- "MTrk" as unsigned 32 bit integer (little endian)

function read_variable_length(buf: buffer, offset: number)
	local n = 0
	repeat
		local byte = buffer.readu8(buf, offset)
		offset += 1
		n = bit32.lshift(n, 7) + bit32.band(byte, 0b01111111)
	until byte < 0b10000000
	return n, offset
end

function read_length_string(buf: buffer, offset: number)
	local length = 0
	length, offset = read_variable_length(buf, offset)
	return buffer.readstring(buf, offset, length), offset + length
end

local MidiCommandArguments = {
	[0b1000] = 2,
	[0b1001] = 2,
	[0b1010] = 2,
	[0b1011] = 2,
	[0b1100] = 1,
	[0b1101] = 1,
	[0b1110] = 2,
}

-- offset starts after first 2 bytes (FF and type)
-- third byte is variable length, but we ignore it in some cases
local MetaCommands = {
	-- FF 00 02 Sequence Number
	-- treat it as random data, probably not used
	[0x00] = read_length_string,
	-- FF 01 len text Text Event
	[0x01] = read_length_string,
	-- FF 02 len text Copyright Notice
	[0x02] = read_length_string,
	-- FF 03 len text Sequence/Track Name
	[0x03] = read_length_string,
	-- FF 04 len text Instrument Name
	[0x04] = read_length_string,
	-- FF 05 len text Lyric
	[0x05] = read_length_string,
	-- FF 06 len text Marker
	[0x06] = read_length_string,
	-- FF 07 len text Cue Point
	[0x07] = read_length_string,
	-- FF 20 01 cc MIDI Channel Prefix
	[0x20] = function(buf: buffer, offset: number)
		return buffer.readu8(buf, offset + 1), offset + 2
	end,
	-- FF 21 01 vv MIDI Prefix Port
	[0x21] = function(buf: buffer, offset: number)
		return buffer.readu8(buf, offset + 1), offset + 2
	end,
	-- FF 2F 00 End of Track
	[0x2F] = function(buf: buffer, offset: number)
		return 0, offset + 1
	end,
	-- FF 51 03 tttttt Set Tempo (in microseconds per MIDI quarter-note)
	[0x51] = function(buf: buffer, offset: number)
		return bit32.byteswap(buffer.readu32(buf, offset)) - 0x03_00_00_00, offset + 4
	end,
	-- FF 54 05 hr mn se fr ff SMPTE Offset
	[0x54] = function(buf: buffer, offset: number)
		return {
			buffer.readu8(buf, offset + 1),
			buffer.readu8(buf, offset + 2),
			buffer.readu8(buf, offset + 3),
			buffer.readu8(buf, offset + 4),
			buffer.readu8(buf, offset + 5),
		},
			offset + 6
	end,
	-- FF 58 04 nn dd cc bb Time Signature
	[0x58] = function(buf: buffer, offset: number)
		return {
			buffer.readu8(buf, offset + 1),
			buffer.readu8(buf, offset + 2),
			buffer.readu8(buf, offset + 3),
			buffer.readu8(buf, offset + 4),
		},
			offset + 5
	end,
	[0x59] = function(buf: buffer, offset: number)
		return {
			buffer.readu8(buf, offset + 1),
			buffer.readu8(buf, offset + 2),
		}, offset + 3
	end,
	[0x7F] = read_length_string,
}

function read_header(buf: buffer, offset: number)
	if buffer.readu32(buf, offset) ~= MThd then
		error(`Invalid header at offset {offset}`)
	end
	local length = bit32.byteswap(buffer.readu32(buf, offset + 4))
	if length ~= 6 then
		error(`Invalid header length {length} at offset {offset}`)
	end
	local trackCount = bit32.rshift(bit32.byteswap(buffer.readu16(buf, offset + 10)), 16)
	local division = bit32.rshift(bit32.byteswap(buffer.readu16(buf, offset + 12)), 16)
	
	if division >= 0x1000 then 
		-- First bit is 1, meaning the division is represented by frames per second [4]
		local fps = bit32.band(bit32.rshift(division, 8), 0x7F) -- first 7 bits is frames per second
		if fps == 29 then
			fps = 29.97
		end
		local ticksPerFrame = bit32.band(division, 0xFF) -- last 8 bits, ticks per frame
		division = 1_000_000 / (fps * ticksPerFrame)
	end
	return {
		format = bit32.rshift(bit32.byteswap(buffer.readu16(buf, offset + 8)), 16),
		trackCount = trackCount,
		division = division,
		tracks = table.create(trackCount),
	},
		offset + 14
end

function read_track(buf: buffer, offset: number)
	if buffer.readu32(buf, offset) ~= MTrk then
		error(`Invalid track at offset {offset}`)
	end
	local length = bit32.byteswap(buffer.readu32(buf, offset + 4))
	offset += 8
	local limit = offset + length
	local eventBuffer: number = 0
	local events = {}
	while offset < limit do
		local v_time = 0
		v_time, offset = read_variable_length(buf, offset)
		local byte = buffer.readu8(buf, offset)
		offset += 1
		if byte >= 0xF8 then -- meta event, aka RealTime Category
			local metaType = buffer.readu8(buf, offset)
			offset += 1
			local f = MetaCommands[metaType]
			local metaLength, newOffset = read_variable_length(buf, offset)
			if not f then
				warn(`Unrecognized meta command: {metaType} at offset {offset}`)
				offset = newOffset + metaLength
				continue
			end
			local data
			data, offset = MetaCommands[metaType](buf, offset)
			table.insert(events, {
				v_time,
				Midi.EventTypes.meta,
				metaType,
				data,
			})
			offset = newOffset + metaLength
		elseif byte >= 0xF0 then -- system exclusive event, aka System Common Category
			eventBuffer = 0
			length, offset = read_variable_length(buf, offset)
			table.insert(events, {
				v_time,
				Midi.EventTypes.sysex,
				buffer.readstring(buf, offset, length - 1),
			})
			offset += length
			if buffer.readu8(buf, offset - 1) ~= 0xF7 then
				error(`Invalid sysex event before offset {offset}`)
			end
		else
			if byte <= 127 then
				-- first bit is 0, means it's a running status
				if eventBuffer == 0 then
					error(`Tried to do running status without buffered event at offset {offset}`)
				end
				offset -= 1
			else
				eventBuffer = byte
			end
			local channel = bit32.band(eventBuffer, 0b00001111)
			local eventType = bit32.rshift(eventBuffer, 4)
			local argumentCount = MidiCommandArguments[eventType]
			local event = { v_time, Midi.EventTypes.midi, eventType, channel, 0, 0 }
			for i = 1, argumentCount do
				event[i + 4] = buffer.readu8(buf, offset + i - 1)
			end
			table.insert(events, event)
			offset += argumentCount
		end
	end
	return events, offset
end

export type MidiEvent = { [number]: any }

export type MidiFile = {
	format: number,
	trackCount: number,
	division: number,
	tracks: { [number]: { [number]: MidiEvent } },
}

function Midi.parse(fileString: string): MidiFile
	local buf = buffer.fromstring(fileString)
	local header, offset = read_header(buf, 0)
	local events
	for trackNumber = 1, header.trackCount do
		events, offset = read_track(buf, offset)
		header.tracks[trackNumber] = events
	end
	return header
end

return Midi
