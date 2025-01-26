local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local keycode = Enum.KeyCode.G
local enabled = false
local connection = nil

local InfiniteStamina = {}

function InfiniteStamina.Disable()
    print("Disabled!")
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
    enabled = true
    connection = localPlayer.CharacterAdded:Connect(activate)
end    

function InfiniteStamina.IsEnabled()
    if enabled then
        return true
    else
        return false
    end
end

function InfiniteStamina.GetKeycode()
    return keycode
end

return InfiniteStamina