local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function rainbowColor()
    local time = tick() * 3
    return Color3.new(math.sin(time), math.sin(time + 2), math.sin(time + 4))
end

local function createESP(player)
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.new(1, 1, 1)
    highlight.OutlineColor = rainbowColor()
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character or game.Workspace

    player.CharacterAdded:Connect(function(character)
        highlight.Parent = character
    end)

    RunService.RenderStepped:Connect(function()
        highlight.OutlineColor = rainbowColor()
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait()
    createESP(player)
end)
