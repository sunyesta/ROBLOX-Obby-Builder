local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)
local TweenService = game:GetService("TweenService")
local Tools = require(game.ReplicatedStorage.Common.Tools)
local Players = game:GetService("Players")


local MovingBlock = Component.new {
	Tag = "MovingBlock",
	Ancestors = {game.Workspace},
}

function MovingBlock:Construct()
	print("MovingBlock was initialized")
end

function MovingBlock:Start()
    self.Properties = self.Instance
	self.Model = self.Instance.Parent
    if not self.Model:IsA("Model") then
        error(self, "folder must be inside a Model!")
    end
	Tools.AnchorAll(self.Model)
	Tools.CheckForPrimary(self.Model)

	self.Speed = self.Properties:GetAttribute("Speed")

	self.Pt1 = self.Properties.Pt1.CFrame
	self.Pt2 = self.Properties.Pt2.CFrame

	self.Properties.Pt1.Parent = nil
	self.Properties.Pt2.Parent = nil

	self:Move()
	
end

function MovingBlock:Move()
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = self.Model:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		
		self.Model:SetPrimaryPartCFrame(CFrameValue.Value)
	end)

	local tweenInfo = TweenInfo.new(self.Speed,Enum.EasingStyle.Linear)


	local goal1 = CFrame.new(self.Pt1.Position)
	local goal2 = CFrame.new(self.Pt2.Position)
	


	local tween1 = TweenService:Create(CFrameValue, tweenInfo, {Value = goal1})
	local tween2 = TweenService:Create(CFrameValue, tweenInfo, {Value = goal2})

	while true do
		tween1:Play()
		tween1.Completed:Wait()

		tween2:Play()
		tween2.Completed:Wait()
	end

end

function MovingBlock:Stop()
	
end


return MovingBlock