local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)
local TweenService = game:GetService("TweenService")
local Tools = require(game.ReplicatedStorage.Common.Tools)
local Players = game:GetService("Players")


local MovingAndRotatingBlock = Component.new {
	Tag = "MovingAndRotatingBlock",
	Ancestors = {game.Workspace},
}

function MovingAndRotatingBlock:Construct()
	print("MovingAndRotatingBlock was initialized")
end

function MovingAndRotatingBlock:Start()
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

function MovingAndRotatingBlock:Move()
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = self.Model:GetPrimaryPartCFrame()

	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		
		self.Model:SetPrimaryPartCFrame(CFrameValue.Value)
	end)

	local tweenInfo = TweenInfo.new(self.Speed,Enum.EasingStyle.Linear)


	local goal1 = self.Pt1
	local goal2 = self.Pt2
	if self.Model:FindFirstChild("SpinningBlock") then
		goal1 = CFrame.new(goal1.Position)
		goal2 = CFrame.new(goal2.Position)
	end
	


	local tween1 = TweenService:Create(CFrameValue, tweenInfo, {Value = goal1})
	local tween2 = TweenService:Create(CFrameValue, tweenInfo, {Value = goal2})

	while true do
		tween1:Play()
		tween1.Completed:Wait()

		tween2:Play()
		tween2.Completed:Wait()
	end

end

function MovingAndRotatingBlock:Stop()
	
end


return MovingAndRotatingBlock