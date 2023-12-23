return {
	Patches = {

		-- Piano --

		[0] = { "Piano", "Acoustic Grand", "rbxassetid://5924276201", { Transpose = -8 } },
		[1] = { "Piano", "Bright Acoustic", "rbxassetid://5924276201", { Transpose = -8 } },
		[2] = { "Piano", "Electric Grand", "rbxassetid://5924276201", { Transpose = -8 } },
		[3] = { "Piano", "Honky-Tonk", "rbxassetid://5924276201", { Transpose = -8 } },
		[4] = {
			"Piano",
			"Electric Piano 1",
			"rbxassetid://9040512197",
			{ Transpose = 2, Loop = true, Decay = { 2, 0 } },
		},
		[5] = {
			"Piano",
			"Electric Piano 2",
			"rbxassetid://9040512197",
			{ Transpose = 2, Loop = true, Decay = { 2, 0 } },
		},
		[6] = { "Piano", "Harpsichord", "rbxassetid://109618842", { Transpose = -13, Offset = 0.033, Gain = -0.3 } },
		[7] = { "Piano", "Clavinet", "rbxasset://Sounds/electronicpingshort.wav", { Transpose = -11, Offset = 0.095 } },

		-- Chromatic Percussion --

		[9] = {
			"Chromatic Percussion",
			"Glockenspiel",
			"rbxasset://Sounds/electronicpingshort.wav",
			{ Transpose = -11, Offset = 0.095 },
		},
		[10] = {
			"Chromatic Percussion",
			"Music Box",
			"rbxasset://Sounds/electronicpingshort.wav",
			{ Transpose = -11, Offset = 0.095 },
		},
		[11] = {
			"Chromatic Percussion",
			"Vibraphone",
			"rbxassetid://109618940",
			{
				Transpose = -13,
				Offset = 0.033,
				Gain = -0.3,
			},
		},
		[12] = {
			"Chromatic Percussion",
			"Marimba",
			"rbxasset://Sounds/electronicpingshort.wav",
			{ Transpose = -11, Offset = 0.095 },
		},
		[13] = {
			"Chromatic Percussion",
			"Xylophone",
			"rbxasset://Sounds/electronicpingshort.wav",
			{ Transpose = -11, Offset = 0.095 },
		},
		[14] = { "Chromatic Percussion", "Tubular Bells", "rbxassetid://130944009", { Transpose = -1, Offset = 0.035 } },
		[15] = {
			"Chromatic Percussion",
			"Dulcimer",
			"rbxassetid://109618842",
			{ Transpose = -1, Offset = 0.033, Decay = { 2, 0 }, Gain = -0.3 },
		},

		-- Organ --

		[16] = { "Organ", "Drawbar Organ", "rbxassetid://4007485270", { Transpose = 0, Gain = 0.3, Offset = 0.1 } },
		[17] = { "Organ", "Percussive Organ", "rbxassetid://4007485270", { Transpose = 0, Gain = 0.3, Offset = 0.1 } },
		[18] = { "Organ", "Rock Organ", "rbxassetid://4007485270", { Transpose = 0, Gain = 0.3, Offset = 0.1 } },
		[19] = { "Organ", "Church Organ", "rbxassetid://4007485270", { Transpose = 0, Gain = 0.3, Offset = 0.1 } },
		[20] = { "Organ", "Reed Organ", "rbxassetid://4007485270", { Transpose = 0, Gain = 0.3, Offset = 0.1 } },
		[21] = { "Organ", "Accordion", "rbxassetid://13418521", { Transpose = 3 } },
		[22] = { "Organ", "Harmonica", "rbxassetid://13418521", { Transpose = 3 } },
		[23] = { "Organ", "Tango Accordion", "rbxassetid://13418521", { Transpose = 3, Offset = 0.051 } },

		-- Guitar --

		[24] = { "Guitar", "Acoustic Guitar (Nylon)", "rbxassetid://4007485270", { Transpose = 0, Offset = 0.1 } },
		[25] = { "Guitar", "Acoustic Guitar (Steel)", "rbxassetid://4007485270", { Transpose = 0, Offset = 0.1 } },
		[26] = { "Guitar", "Electric Guitar (Jazz)", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[27] = { "Guitar", "Electric Guitar (Clean)", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[28] = { "Guitar", "Electric Guitar (Muted)", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[29] = {
			"Guitar",
			"Overdriven Guitar",
			"rbxassetid://130851174",
			{
				Transpose = -1,
				Offset = 0.026,
				Decay = { 1.75, 0 },
			},
		},
		[30] = {
			"Guitar",
			"Distortion Guitar",
			"rbxassetid://130851174",
			{
				Transpose = -1,
				Offset = 0.026,
				Decay = { 1.75, 0 },
			},
		},
		[31] = { "Guitar", "Guitar Harmonics", "rbxassetid://4007485270", { Transpose = 0, Gain = 1, Offset = 0.1 } },

		-- Bass --

		[32] = { "Bass", "Acoustic Bass", "rbxassetid://9040512197", { Transpose = 2, Loop = true, Decay = { 2, 0 } } },
		[33] = {
			"Bass",
			"Electric Bass (Finger)",
			"rbxassetid://9040512197",
			{ Transpose = 2, Loop = true, Decay = { 2, 0 } },
		},
		[34] = { "Bass", "Electric Bass (Pick)", "rbxassetid://4007485270", { Transpose = 0, Offset = 0.1, Gain = 1 } },
		[35] = { "Bass", "Fretless Bass", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[36] = { "Bass", "Slap Bass 1", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[37] = { "Bass", "Slap Bass 2", "rbxassetid://1846986997", { Transpose = 11, Offset = 0.138 } },
		[38] = {
			"Bass",
			"Synth Bass 1",
			"rbxassetid://9040512330",
			{ Transpose = 2, Gain = -0.2, Loop = true, Decay = {
				4,
				0,
			} },
		},
		[39] = {
			"Bass",
			"Synth Bass 2",
			"rbxassetid://9040512330",
			{ Transpose = 2, Gain = -0.2, Loop = true, Decay = {
				4,
				0,
			} },
		},

		-- T/T
		[105] = { "Ethnic", "Banjo", "rbxassetid://12857804", { Transpose = -8, Offset = 0.1, Gain = 1 } },
		[40] = {
			"Solo Strings",
			"Violin",
			"rbxassetid://130850974",
			{ Transpose = 1, Offset = 0.1, Decay = { 16, 0 } },
		},
		[41] = { "Solo Strings", "Viola", "rbxassetid://130850974", { Transpose = 1, Offset = 0.1, Decay = { 16, 0 } } },
		[42] = { "Solo Strings", "Cello", "rbxassetid://130850974", { Transpose = 1, Offset = 0.1, Decay = { 16, 0 } } },

		[44] = { "Solo Strings", "Tremolo", "rbxassetid://13418521", { Transpose = -9, FadeOut = 0.05 } },
		[45] = { "Solo Strings", "Pizzicato", "rbxassetid://13418521", { Transpose = 3, FadeOut = 0.05 } },
		[48] = { "Solo Strings", "Timpani", "rbxassetid://13418521", { Transpose = -9, FadeOut = 0.05 } },
		[56] = {
			"Brass",
			"Trumpet",
			"rbxassetid://130818484",
			{ Transpose = -13, Offset = 0.1, Gain = 0.3, Decay = { 2, 0 }, FadeOut = 0.05 },
		},
		[57] = {
			"Brass",
			"Trombone",
			"rbxassetid://130850974",
			{ Transpose = 1, Offset = 0.1, Gain = -0.2, Decay = { 16, 0 }, FadeOut = 0.05 },
		},

		[64] = { "Brass", "Soprano Sax", "rbxassetid://13418521", { Transpose = -9, Offset = 0.051, FadeOut = 0.05 } },
		[65] = { "Brass", "Alto Sax", "rbxassetid://13418521", { Transpose = -9, Offset = 0.051, FadeOut = 0.05 } },
		[66] = { "Brass", "Tenor Sax", "rbxassetid://13418521", { Transpose = -9, Offset = 0.051, FadeOut = 0.05 } },
		[67] = { "Brass", "Baritone Sax", "rbxassetid://13418521", { Transpose = -9, Offset = 0.051, FadeOut = 0.05 } },

		[109] = {
			"Standard FX",
			"Kalimba",
			"rbxassetid://12805557101",
			{ Transpose = -13, Gain = 0.1, Loop = false, Decay = { 8, 0 } },
		},
		[72] = { "Pipe", "Piccolo", "rbxassetid://13424334", { Transpose = -36.2, Offset = 0.056 } },
		[73] = { "Pipe", "Flute", "rbxassetid://13424334", { Transpose = -36.2, Offset = 0.056 } },
		[74] = { "Pipe", "Recorder", "rbxassetid://13424334", { Transpose = -36.2, Offset = 0.056 } },

		-- Synth Lead --
		[80] = {
			"Synth Lead",
			"Lead 1 (Square)",
			"rbxassetid://9040512330",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[81] = {
			"Synth Lead",
			"Lead 2 (Sawtooth)",
			"rbxassetid://9040512075",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[82] = {
			"Synth Lead",
			"Lead 3 (Calliope)",
			"rbxassetid://9040512197",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[83] = {
			"Synth Lead",
			"Lead 4 (Chiff)",
			"rbxassetid://9040512197",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[84] = { "Synth Lead", "Lead 5 (Charang)", "rbxassetid://13414759", { Transpose = 3 } },
		[85] = {
			"Synth Lead",
			"Lead 6 (Voice)",
			"rbxassetid://9040512197",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[86] = {
			"Synth Lead",
			"Lead 7 (Fifths)",
			"rbxassetid://9040512197",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},
		[87] = {
			"Synth Lead",
			"Lead 8 (Bass + Lead)",
			"rbxassetid://9085536418",
			{ Transpose = -10, Loop = true, Decay = { 4, 0 }, FadeOut = 0.05 },
		},

		--[121]={'FX','Breath','rbxassetid://0',{ Transpose = -3, Gain = .5, Offset = .441 }};
		[107] = { "Koto", "Koto", "rbxassetid://1846310773", { Transpose = -3, Gain = 0.5, Offset = 0.441 } },

		-- Percussion --
		[122] = { "FX", "Seashore", "rbxassetid://106708146", { Transpose = 19, Loop = true } },
		[126] = { "FX", "Applause", "rbxassetid://106708146", { Transpose = 19, Loop = true } },
		[127] = { "FX", "Gunshot", "rbxassetid://10209257", { Transpose = -1, Gain = -0.3 } },
		[120] = { "FX", "Guitar Fret", "rbxassetid://8407028730", { Transpose = 29 } },
		[118] = { "Percussive", "Synth Drum", "rbxassetid://11944350", { Transpose = 2, Offset = 0.25, Gain = 0 } },
	},
	Percussion = {
		--REcord
		[30] = {
			"Record Scratch",
			{
				Sound = "rbxassetid://9118090437",
				Settings = {
					Start = 1.041,
					Pitch = 0.7,
					Volume = -0.5,
				},
			},
		},
		-- Snap
		[31] = { "Snap", { Sound = "rbxassetid://9114427348" } },
		-- Rim Click
		[37] = { "Rim Click", { Sound = "rbxassetid://12221976" } },

		-- Bass Drum
		[35] = { "Bass Drum", { Sound = "rbxassetid://31173820" } },
		[36] = { "Bass Drum", { Sound = "rbxassetid://31173820" } },

		--IDK
		[82] = { "IDK", { Sound = "rbxassetid://31173898" } },

		--Claves
		[75] = {
			"Claves",
			{
				Sound = "rbxassetid://1844468627",
				Settings = {
					Start = 0.518,
					Stop = 0.451,
				},
			},
		},

		--Conga
		[62] = { "Conga (High)", { Sound = "rbxassetid://57802212" } },
		[63] = { "Conga (High)", { Sound = "rbxassetid://57802212" } },
		[64] = { "Conga (Low)", { Sound = "rbxassetid://57802134" } },

		--High Bongo
		[60] = {
			"High Bongo",
			{ Sound = "rbxassetid://57802055", Settings = {
				Start = 0.027,
				Volume = -0.5,
			} },
		},

		--Low Bongo
		[61] = { "Low Bongo", { Sound = "rbxassetid://57801983", Settings = {
			Start = 0.027,
			Volume = -0.5,
		} } },

		--Toms
		[45] = { "Tom (Low)", { Sound = "rbxassetid://31173881" } },
		[47] = { "Tom (Low Mid)", { Sound = "rbxassetid://31173863" } },
		[48] = { "Tom (High Mid)", { Sound = "rbxassetid://31173863" } },
		[50] = { "Tom (High)", { Sound = "rbxassetid://31173844" } },

		--Cowbell
		[56] = { "Cowbell", { Sound = "rbxassetid://9120917609" } },

		--Laser
		[27] = { "Laser", { Sound = "rbxassetid://1624609598", Settings = { Pitch = 3 } } },

		--Cymbals
		[49] = { "Crash Cymbal", { Sound = "rbxassetid://31173771" } },
		[51] = { "Ride Cymbal", { Sound = "rbxassetid://31173898" } },
		[57] = { "Crash Cymbal", { Sound = "rbxassetid://31173771" } },
		[59] = { "Ride Cymbal", { Sound = "rbxassetid://31173898" } },

		--HiHat
		[42] = { "Closed Hi-Hat", { Sound = "rbxassetid://4702649974" } },
		[44] = { "Hi-Hat", { Sound = "rbxassetid://31173735" } },
		[46] = { "Hi-Hat", { Sound = "rbxassetid://31173735" } },

		--Tambourine
		[54] = {
			"Tambourine",
			{
				Sound = "rbxassetid://1840229078",
				Settings = {
					Start = 0.140,
					Stop = 0.9,
					Volume = -0.5,
				},
			},
		},

		--SFX
		[39] = {
			"Clap",
			{
				Sound = "rbxassetid://9114669634",
				Settings = {
					Start = 0.044,
					Volume = 1,
				},
			},
		},
		[28] = { "Whip", { Sound = "rbxassetid://9126213464", Settings = {
			Start = 0.106,
		} } },

		--Cabasa
		[69] = {
			"Cabasa",
			{
				Sound = "rbxassetid://1841124373",
				Settings = {
					Start = 0.136,
					Stop = 0.340,
				},
			},
		},

		--Maracas
		[70] = {
			"Maracas",
			{
				Sound = "rbxassetid://1844421271",
				Settings = {
					Start = 0.236,
					Stop = 0.211,
					Volume = -0.5,
				},
			},
		},

		--Cuica
		[78] = { "Cuica", { Sound = "rbxassetid://7430849680" } },
		[79] = { "Cuica", { Sound = "rbxassetid://7430849680" } },

		--Snare
		[38] = { "Snare Drum", { Sound = "rbxassetid://31173799" } },
		[40] = { "Snare Drum", { Sound = "rbxassetid://31173799" } },

		--Triangle
		[80] = { "Triangle", { Sound = "rbxassetid://9116223900" } },
		[81] = { "Triangle", { Sound = "rbxassetid://9116223333" } },

		--Castanets
		[85] = {
			"Castanets",
			{
				Sound = "rbxassetid://1840247421",
				Settings = {
					Start = 0.348,
					Stop = 0.057,
				},
			},
		},
		--High Tom
		[43] = {
			"High Tom",
			{
				Sound = "rbxassetid://9125514674",
				Settings = {
					Stop = 2,
					Fade = { 0, 0.176 },
					Pitch = 1.4,
					Volume = -0.5,
				},
			},
		},

		--Low Tom
		[41] = {
			"Low Tom",
			{
				Sound = "rbxassetid://9125514674",
				Settings = {
					Stop = 2,
					Fade = { 0, 0.440 },
					Pitch = 1,
					Volume = -0.5,
				},
			},
		},

		--Short Guiro
		[73] = {
			"Short Guiro",
			{
				Sound = "rbxassetid://1844425210",
				Settings = {
					Start = 0.928,
					Stop = 0.118,
				},
			},
		},

		--Long Guiro
		[74] = {
			"Long Guiro",
			{
				Sound = "rbxassetid://1844425210",
				Settings = {
					Start = 0.547,
					Stop = 0.285,
				},
			},
		},

		-- Wood Blocks
		[76] = { "Wood Block (High)", { Sound = "rbxassetid://9120917978" } },
		[77] = { "Wood Block (Low)", { Sound = "rbxassetid://9120917605" } },
	},
}
