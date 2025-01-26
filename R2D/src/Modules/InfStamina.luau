local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local KEYCODE = Enum.KeyCode.G
local isEnabled = false
local connection = nil

local InfiniteStamina = {}

function InfiniteStamina.Disable()
    print("Disabled!")
    isEnabled = false
end    

function InfiniteStamina.Enable()
    local function activate()
        local screenGui = playerGui:FindFirstChild("Survivor") or playerGui:FindFirstChild("Zombie")
        if not screenGui then
            repeat
                screenGui = playerGui:FindFirstChild("Survivor") or playerGui:FindFirstChild("Zombie")
                task.wait(0.1)
            until screenGui
        end
        
        local keybind = screenGui:WaitForChild("Energy"):WaitForChild("Energy"):WaitForChild("Keybind")
        for k, v in pairs(getsenv(keybind)) do
            if not (k == "removestamina" and type(v) == "function")then
                warn("⚠️ Function non-existent ⚠️")
                return
            end

            local status, result = pcall(hookfunction(v, function()
                -- Hooked!
            end))

            if not status then
                warn("⚠️ An error has occured ⚠️")
            end
            print(status, result)
        end
    end

    activate()
    isEnabled = true
    connection = localPlayer.CharacterAdded:Connect(activate)
end    

function InfiniteStamina.IsEnabled()
    if isEnabled then
        return true
    else
        return false
    end
end

function InfiniteStamina.GetKeyCode()
    return KEYCODE
end

return InfiniteStamina
