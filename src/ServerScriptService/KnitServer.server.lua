local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit =  require(ReplicatedStorage.Packages.Knit)

require(ServerStorage.Source.Money.MoneyService)

for _,v in pairs(game.ServerScriptService.Server.Components:GetDescendants())do
    if v:IsA("ModuleScript") then
        require(v)
    end
    
end

Knit.Start():andThen(function()
    print("Knit started")
end):catch(warn)

