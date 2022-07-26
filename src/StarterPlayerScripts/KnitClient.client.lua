local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local Knit =  require(ReplicatedStorage.Packages.Knit)

local StarterPlrComponentsFolder = game.StarterPlayer.StarterPlayerScripts.Client.Components
-- require(ReplicatedStorage.Common.Components.UIs.ColorPickerUI)

Knit.Start({ServicePromises = true}):andThen(function()
    print("Knit started")
end):catch(warn)

for _,v in pairs(game.ReplicatedStorage.Common.Components:GetDescendants())do
    if v:IsA("ModuleScript") then
        require(v)
    end
    
end

for _,v in pairs(StarterPlrComponentsFolder:GetDescendants())do
    if v:IsA("ModuleScript") then
        require(v)
    end
    
end