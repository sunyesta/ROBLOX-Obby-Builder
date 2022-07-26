local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Component = require(ReplicatedStorage.Packages.Component)
local TweenService = game:GetService("TweenService")
local Tools = require(game.ReplicatedStorage.Common.Tools)
local Players = game:GetService("Players")


local SpinningBlock = Component.new {
	Tag = "SpinningBlock",
	Ancestors = {game.Workspace},
}

function SpinningBlock:Construct()
	print("SpinningBlock was initialized")
end

function SpinningBlock:Start()
    self.Properties = self.Instance
	self.Model = self.Instance.Parent
    if not self.Model:IsA("Model") then
        error(self, "folder must be inside a Model!")
    end

	Tools.AnchorAll(self.Model)
	Tools.CheckForPrimary(self.Model)
	
	self.Speed = self.Properties:GetAttribute("Speed")

	self.Angle = 0
	

	self:Move()
	
end

function SpinningBlock:Move()
	local RotationValue = Instance.new("NumberValue")
	RotationValue.Value = self.Model:GetPrimaryPartCFrame()

	RotationValue:GetPropertyChangedSignal("Value"):Connect(function()
		
		self.Model:SetPrimaryPartCFrame(CFrame.new(self.Model.PrimaryPart.CFrame.Position)*CFrame.Angles(0,RotationValue.Value,0))
	end)

	local tweenInfo = TweenInfo.new(self.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,-1)
	local tween1 = TweenService:Create(RotationValue, tweenInfo, {Value = math.rad(360)})
	tween1:Play()

end

function SpinningBlock:Stop()
	
end


return SpinningBlock