local InfStamina = {}
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
InfStamina.Name = "Inf Stamina"

function InfStamina.DisableModule()

end    

function InfStamina.EnableModule()
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

return InfStamina