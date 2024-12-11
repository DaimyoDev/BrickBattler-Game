local UpdateRoundTimeText = game.ReplicatedStorage.RemoteEvents.UpdateRoundTimeText
local TextLabel = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui").TextLabel

local function UpdateRoundTimeTextUI(time)
    TextLabel.Text = `Time Left {time} Seconds!`
end

UpdateRoundTimeText.OnClientEvent:Connect(UpdateRoundTimeTextUI)