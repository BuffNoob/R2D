local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

StarterGui:SetCore("SendNotification", {
    Title = "Blox Fruit Hub v1.0",
    Text = "Script injecting...",
    Duration = 5
})

StarterGui:SetCore("SendNotification", {
    Title = "Blox Fruit Hub v1.0",
    Text = "Script injected!",
    Duration = 5
})

task.wait(2)

Players.LocalPlayer:Kick("You've been banned permanently!\nBy: Anti-cheat\nReason: Suspected suspicous client behaviour")
