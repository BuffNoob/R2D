local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

StarterGui:SetCore("SendNotification", {
    Title = "Loading",
    Text = "Script injecting...",
    Duration = 3
})

task.wait(3)

StarterGui:SetCore("SendNotification", {
    Title = "Hub",
    Text = "Script injected!",
    Duration = 2
})

task.wait(4)

Players.LocalPlayer:Kick("\nYou've been banned permanently!\nBanned by: Anti-cheat\nReason: Unusaul client behaviour")
