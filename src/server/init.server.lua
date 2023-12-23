local file = game:GetService("HttpService"):GetAsync("file.mid", true)

local MidiParser = require(game:GetService("ReplicatedStorage").Shared.MidiParser)
local MidiPlayer = require(game:GetService("ReplicatedStorage").Shared.MidiPlayer)

local playerPart = workspace.Player

local parsed = MidiParser.parse(file)
local player = MidiPlayer.LoadFile(parsed, playerPart)

task.wait(3)

-- player:setTime(120)

game:GetService("RunService").Heartbeat:Connect(function(dt)
	player:update(dt)
end)
