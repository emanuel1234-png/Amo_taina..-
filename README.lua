local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- Função para criar o coração no personagem
local function createHeart(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Evita duplicar
    if hrp:FindFirstChild("HeartBillboard") then
        return
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "HeartBillboard"
    billboard.Size = UDim2.new(0, 100, 0, 100)
    billboard.Adornee = hrp
    billboard.AlwaysOnTop = true
    billboard.Parent = hrp

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = "rbxassetid://12345678" -- Troque pelo ID da sua imagem de coração
    imageLabel.Parent = billboard
end

-- Função para criar texto no céu
local function createSkyText()
    -- Opcional: limpa partes antigas
    if Workspace:FindFirstChild("SkyTextParts") then
        Workspace.SkyTextParts:Destroy()
    end

    local folder = Instance.new("Folder")
    folder.Name = "SkyTextParts"
    folder.Parent = Workspace

    for i = 1, 4 do
        local part = Instance.new("Part")
        part.Name = "SkyTextPart_" .. i
        part.Size = Vector3.new(5000, 5000, 1)
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 1
        part.Position = Vector3.new(0, 500 + i * 300, i * 100)
        part.Parent = folder

        local surfaceGui = Instance.new("SurfaceGui")
        surfaceGui.Face = Enum.NormalId.Front
        surfaceGui.AlwaysOnTop = true
        surfaceGui.Parent = part

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = "*EU AMO TAINÀ*"
        textLabel.TextScaled = true
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        textLabel.Font = Enum.Font.Fantasy
        textLabel.Parent = surfaceGui
    end
end

-- Conecta quando jogador entra
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createHeart(player)
    end)
end)

-- Cria o texto no céu
createSkyText()
