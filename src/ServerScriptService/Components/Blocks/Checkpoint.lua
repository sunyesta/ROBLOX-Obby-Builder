local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Component = require(ReplicatedStorage.Packages.Component)

local Players = game:GetService("Players")


local Checkpoint = Component.new {
	Tag = "Checkpoint",
	Ancestors = {game.Workspace},
}

function Checkpoint:Construct()
	print("Checkpoint was initialized")
end

function Checkpoint:Start()
    local checkpoint = self.Instance.Parent.PrimaryPart
    if not checkpoint then
        checkpoint = self.Instance.Parent:FindFirstChildWhichIsA("BasePart")
    end
    
    local function onTouched(hit)
        if hit and hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid") then
            local player = Players:GetPlayerFromCharacter(hit.Parent)
            local checkpointData = ServerStorage:FindFirstChild("CheckpointData")
            if not checkpointData then
                checkpointData = Instance.new("Folder")
                checkpointData.Name = "CheckpointData"
                checkpointData.Parent = ServerStorage
            end
            
            local userIdString = tostring(player.UserId)
            local checkpointValue = checkpointData:FindFirstChild(userIdString)
            if not checkpointValue then
                checkpointValue = Instance.new("ObjectValue")
                checkpointValue.Name = userIdString
                checkpointValue.Parent = checkpointData
                
                player.CharacterAdded:connect(function(character)
                    wait()
                    local storedCheckpoint = ServerStorage.CheckpointData[userIdString].Value
                    character:MoveTo(storedCheckpoint.Position)
                end)
            end
            
            checkpointValue.Value = checkpoint
        end
    end
    
    checkpoint.Touched:Connect(onTouched)
	
end



function Checkpoint:Stop()
	
end


return Checkpoint