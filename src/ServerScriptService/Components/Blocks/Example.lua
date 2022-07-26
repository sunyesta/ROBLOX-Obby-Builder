local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)

local Players = game:GetService("Players")


local ColorPickerUI = Component.new {
	Tag = "ColorPickerUI",
	Ancestors = {game.Workspace},
}

function ColorPickerUI:Construct()
	print("ColorPickerUI was initialized")
end

function ColorPickerUI:Start()

	
end



function ColorPickerUI:Stop()
	
end


return ColorPickerUI