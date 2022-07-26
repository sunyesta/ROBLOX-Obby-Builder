local Players = game:GetService("Players")
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

-- Create the service:
local MoneyService = Knit.CreateService {
    Name = "MoneyService",
    Client = {
        MoneyChanged = Knit.CreateSignal(),
    },
    _MoneyPerPlayer = {},
    _StartingMoney = 10,
}

-- Add some methods to the service:

function MoneyService.Client:GetMoney(player)
    return self.Server:GetMoney(player)
end

function MoneyService:GetMoney(player: Player): number
    -- Do some sort of data fetch
    local money = self._MoneyPerPlayer[player] or self._StartingMoney
    return money
end

function MoneyService:AddMoney(player, amount)
    local currentMoney = self:GetMoney(player) + amount

    if amount > 0 then
        local newMoney = currentMoney + amount
        self._MoneyPerPlayer[player] = newMoney
        self.Client.MoneyChanged:Fire(player, newMoney)
    end
    
end

function MoneyService:KnitStart()
    print("money service started")

    while true do
        task.wait(1)

        -- for _,player in ipairs(Players:GetPlayers())do
        --     self:AddMoney(player, math.random(1,10))
        -- end
    end
end

function MoneyService:KnitInit()
    print("money service initialized")
end


return MoneyService