local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)
local Tools = require(game.ReplicatedStorage.Common.Tools)
local Players = game:GetService("Players")


local DamageBlock = Component.new {
	Tag = "DamageBlock",
	Ancestors = {game.Workspace},
}

function DamageBlock:Construct()
	print("DamageBlock was initialized")
    
    self.Properties = self.Instance
    self.Model = self.Instance.Parent
    if not self.Model:IsA("Model") then
        error(self, "folder must be inside a Model!")
    end

    Tools.AnchorAll(self.Model)

    self.DamageAmount = self.Properties:GetAttribute("Damage")
end

function DamageBlock:Start()
    for _,part in pairs(self.Model:GetDescendants())do
        if not part:IsA("BasePart") then
            continue
        end
        part.Touched:Connect(function(hit)
            local humanoid = hit.Parent:FindFirstChild("Humanoid")
            if not humanoid then
                return
            end

            local character = humanoid.Parent

            humanoid:TakeDamage(self.DamageAmount)
            
        end)
    end
	
end



function DamageBlock:Stop()
	
end


return DamageBlock