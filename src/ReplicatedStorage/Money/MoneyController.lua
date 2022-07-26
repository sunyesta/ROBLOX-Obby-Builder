local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Create the controller:
local MoneyController = Knit.CreateController {
    Name = "MoneyController",
}

-- Add some methods to the controller:
function MoneyController:KnitStart()

    local function ObserveMoney(money)
        print("money = ",money)
    end

    local MoneyService = Knit.GetService("MoneyService")
    MoneyService:GetMoney():andThen(ObserveMoney):await()
    MoneyService.MoneyChanged:Connect(ObserveMoney)
end

function MoneyController:KnitInit()
    print("money service initialized")
end


return MoneyController