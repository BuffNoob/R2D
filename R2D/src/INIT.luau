local UserInputService = game:GetService("UserInputService")

-- Modules
local InfiniteStamina = require("../src/Modules/InfStamina")

UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
    if input.KeyCode == InfiniteStamina.GetKeycode() then
        if not InfiniteStamina.IsEnabled() then
            InfiniteStamina.Enable()
        else
            InfiniteStamina.Disable()
        end
    end
end)
