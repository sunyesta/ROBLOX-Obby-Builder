local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)

local Players = game:GetService("Players")
local Tools = require(game.ReplicatedStorage.Common.Tools)

local SpeedBoostBlock = Component.new {
	Tag = "SpeedBoostBlock",
	Ancestors = {game.Workspace},
}

function SpeedBoostBlock:Construct()
	print("SpeedBoostBlock was initialized")
    
    self.Properties = self.Instance
    self.Model = self.Instance.Parent
    if not self.Model:IsA("Model") then
        error(self, "folder must be inside a Model!")
    end
    
    Tools.AnchorAll(self.Model)
    self.SpeedBoost = self.Properties:GetAttribute("Speed")
    self.Time = self.Properties:GetAttribute("Time")
    self.DefaultSpeed = 16
end

function SpeedBoostBlock:Start()
    for _,part in pairs(self.Model:GetDescendants())do
        if not part:IsA("BasePart") then
            continue
        end
        part.Touched:Connect(function(hit)
            local humanoid = hit.Parent:FindFirstChild("Humanoid")
            if not humanoid then
                return
            end

            humanoid.WalkSpeed = self.SpeedBoost
            task.wait(self.Time)
            humanoid.WalkSpeed = self.DefaultSpeed
            
        end)

    end
	
end



function SpeedBoostBlock:Stop()
	
end


return SpeedBoostBlock