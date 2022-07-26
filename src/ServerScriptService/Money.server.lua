local function onPlayerJoin(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 100
	money.Parent = leaderstats
end

game.Players.PlayerAdded:Connect(onPlayerJoin)
