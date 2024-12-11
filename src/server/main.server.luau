local UpdateRoundTimeText = game.ReplicatedStorage.RemoteEvents.UpdateRoundTimeText
local Maps = game.ServerStorage.Maps:GetChildren()

local function teleportPlayers(chosenMap)
    local Players = game:GetService("Players"):GetPlayers()
    local Spawns = chosenMap.Spawns:GetChildren()
    for _, player in Players do
        local chosenSpawn = Spawns[math.random(1, #Spawns)]
        local playerModel = game.Workspace:FindFirstChild(player.Name)
        playerModel.Humanoid.Health = playerModel.Humanoid.MaxHealth
        playerModel.HumanoidRootPart.CFrame = chosenSpawn.CFrame
    end
end

local function main(type, time)
    local chosenMap = Maps[math.random(1, #Maps)]
    chosenMap:Clone().Parent = game.Workspace
    teleportPlayers(chosenMap)
    for countdown = time, 0, -1 do
        task.wait(0.2)
        print(countdown)
        UpdateRoundTimeText:FireAllClients(countdown)
    end
    game.Workspace:FindFirstChild(chosenMap.Name):Destroy()
end


while true do
    main("round", 20)
end