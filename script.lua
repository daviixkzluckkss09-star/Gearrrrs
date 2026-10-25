-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- ==================== SISTEMA DE WHITELIST ====================
if player.Name ~= "chiitlxz" then
    player:Kick("Você foi banido, pois não tem permissão para utilizar esse script")
    return
end

-- Destruir UI anterior se existir
if CoreGui:FindFirstChild("HalloweenFarmUI") then
    CoreGui.HalloweenFarmUI:Destroy()
end

-- Variáveis de Configuração
getgenv().CandyFarm = false
getgenv().UndergroundMode = false
getgenv().CandyESP = false
getgenv().AutoResetFull = false
getgenv().KillAllMurderer = false
getgenv().FlingMurderer = false
getgenv().AntiFling = true
getgenv().MoveSpeed = 20

-- Interface Principal (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HalloweenFarmUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ==================== TELA DE LOGIN / SENHA ====================
local LoginFrame = Instance.new("Frame")
LoginFrame.Name = "LoginFrame"
LoginFrame.Size = UDim2.new(0, 280, 0, 160)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -80)
LoginFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
LoginFrame.BorderSizePixel = 0
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local LoginCorner = Instance.new("UICorner")
LoginCorner.CornerRadius = UDim.new(0, 10)
LoginCorner.Parent = LoginFrame

local LoginStroke = Instance.new("UIStroke")
LoginStroke.Color = Color3.fromRGB(255, 110, 0)
LoginStroke.Thickness = 1.5
LoginStroke.Parent = LoginFrame

local LoginHeader = Instance.new("TextLabel")
LoginHeader.Size = UDim2.new(1, 0, 0, 45)
LoginHeader.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
LoginHeader.Text = "🔐 Autenticação - Pumpkin Hub"
LoginHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginHeader.TextSize = 13
LoginHeader.Font = Enum.Font.GothamBold
LoginHeader.Parent = LoginFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = LoginHeader

local PasswordBox = Instance.new("TextBox")
PasswordBox.Size = UDim2.new(1, -30, 0, 35)
PasswordBox.Position = UDim2.new(0, 15, 0, 60)
PasswordBox.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
PasswordBox.PlaceholderText = "Digite a senha (iloveigor1)..."
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(255, 110, 0)
PasswordBox.TextSize = 12
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.Parent = LoginFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = PasswordBox

local LoginBtn = Instance.new("TextButton")
LoginBtn.Size = UDim2.new(1, -30, 0, 35)
LoginBtn.Position = UDim2.new(0, 15, 0, 110)
LoginBtn.BackgroundColor3 = Color3.fromRGB(255, 110, 0)
LoginBtn.Text = "Entrar"
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.TextSize = 13
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.Parent = LoginFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = LoginBtn

-- ==================== PAINEL PRINCIPAL ====================
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 260, 0, 430)
Main.Position = UDim2.new(0.1, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 110, 0)
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
Header.BorderSizePixel = 0
Header.Parent = Main

local MainHeaderCorner = Instance.new("UICorner")
MainHeaderCorner.CornerRadius = UDim.new(0, 10)
MainHeaderCorner.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 40, 0))
}
HeaderGradient.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🎃 Pumpkin Hub (Anti-Void Fix)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -16, 1, -55)
Content.Position = UDim2.new(0, 8, 0, 50)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 0, 0)
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.ScrollBarThickness = 3
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 110, 0)
Content.Parent = Main

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.Parent = Content

-- Lógica de Verificação de Senha
LoginBtn.MouseButton1Click:Connect(function()
    if PasswordBox.Text == "iloveigor1" then
        LoginFrame:Destroy()
        Main.Visible = true
    else
        PasswordBox.Text = ""
        PasswordBox.PlaceholderText = "Senha Incorreta!"
    end
end)

-- Funções da Interface (Toggles & Sliders)
local function CreateToggle(text, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    Frame.BorderSizePixel = 0
    Frame.Parent = Content

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextSize = 11
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 45, 0, 22)
    ToggleBtn.Position = UDim2.new(1, -50, 0.5, -11)
    ToggleBtn.BackgroundColor3 = defaultState and Color3.fromRGB(255, 110, 0) or Color3.fromRGB(45, 45, 55)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = Frame

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 16, 0, 16)
    Dot.Position = defaultState and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.BorderSizePixel = 0
    Dot.Parent = ToggleBtn

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = Dot

    local state = defaultState
    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        local targetPos = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        local targetColor = state and Color3.fromRGB(255, 110, 0) or Color3.fromRGB(45, 45, 55)
        
        Dot:TweenPosition(targetPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
        ToggleBtn.BackgroundColor3 = targetColor
        
        callback(state)
    end)
end

local function CreateSlider(text, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    Frame.BorderSizePixel = 0
    Frame.Parent = Content

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. tostring(default)
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextSize = 11
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -20, 0, 18)
    TextBox.Position = UDim2.new(0, 10, 0, 26)
    TextBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    TextBox.Text = tostring(default)
    TextBox.TextColor3 = Color3.fromRGB(255, 110, 0)
    TextBox.TextSize = 11
    TextBox.Font = Enum.Font.Gotham
    TextBox.Parent = Frame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 4)
    BoxCorner.Parent = TextBox

    TextBox.FocusLost:Connect(function()
        local val = tonumber(TextBox.Text)
        if val then
            val = math.clamp(val, min, max)
            Label.Text = text .. ": " .. tostring(val)
            callback(val)
        end
    end)
end

-- Adicionando Opções no Painel
CreateToggle("Auto Farm Candies", false, function(s) getgenv().CandyFarm = s end)
CreateToggle("Underground Mode (Seguro)", false, function(s) getgenv().UndergroundMode = s end)
CreateToggle("Anti-Fling", true, function(s) getgenv().AntiFling = s end)
CreateToggle("Candy ESP (Destacar)", false, function(s) getgenv().CandyESP = s end)
CreateToggle("Full, Reset (Auto Reset)", false, function(s) getgenv().AutoResetFull = s end)
CreateToggle("Full, Kill All (Murderer Only)", false, function(s) getgenv().KillAllMurderer = s end)
CreateToggle("Fling Murderer", false, function(s) getgenv().FlingMurderer = s end)
CreateSlider("Velocidade Segura", 10, 40, 20, function(v) getgenv().MoveSpeed = v end)

-- Checar se está cheio (Full)
local function checkIfFull()
    local success, result = pcall(function()
        local coinsText = player.PlayerGui.MainGUI.Game.Coins.Text
        local current, max = coinsText:match("(%d+)%s*/%s*(%d+)")
        if current and max then
            return tonumber(current) >= tonumber(max)
        end
    end)
    return success and result
end

-- Anti-Fling Loop Ativo
RunService.Stepped:Connect(function()
    pcall(function()
        if getgenv().AntiFling then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= player and v.Character then
                    for _, part in pairs(v.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end
    end)
end)

-- Lógica do Auto Farm Seguro com Ancoragem (Evita queda para o Void)
task.spawn(function()
    while task.wait() do
        if getgenv().CandyFarm then
            pcall(function()
                if getgenv().AutoResetFull and checkIfFull() then
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.Health = 0
                        task.wait(3)
                    end
                end

                local char = player.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not root or not hum then return end

                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if not getgenv().CandyFarm then break end
                    
                    if (obj.Name == "Candy" or obj.Name == "CoinVisual") and obj:IsA("BasePart") then
                        local targetPos = obj.Position
                        
                        if getgenv().UndergroundMode then
                            targetPos = Vector3.new(targetPos.X, targetPos.Y - 3.5, targetPos.Z)
                        else
                            targetPos = Vector3.new(targetPos.X, targetPos.Y + 2, targetPos.Z)
                        end

                        root.Anchored = true

                        while getgenv().CandyFarm and obj and obj.Parent and (root.Position - targetPos).Magnitude > 2 do
                            local direction = (targetPos - root.Position).Unit
                            local step = direction * math.min(getgenv().MoveSpeed * 0.1, (root.Position - targetPos).Magnitude)
                            
                            root.CFrame = CFrame.new(root.Position + step)
                            RunService.RenderStepped:Wait()
                        end
                        
                        root.Anchored = false
                        task.wait(0.1)
                    end
                end
            end)
        else
            pcall(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.Anchored = false
                end
            end)
        end
    end
end)

-- Lógica de Fling, Kill All e ESP
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local root = char.HumanoidRootPart

            local isMurderer = char:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")

            if getgenv().KillAllMurderer and isMurderer then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local targetRoot = p.Character.HumanoidRootPart
                        root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2)
                        task.wait(0.1)
                    end
                end
            end

            if getgenv().FlingMurderer then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character then
                        local mChar = p.Character
                        local mKnife = mChar:FindFirstChild("Knife") or p.Backpack:FindFirstChild("Knife")
                        if mKnife and mChar:FindFirstChild("HumanoidRootPart") then
                            local mRoot = mChar.HumanoidRootPart
                            
                            local bav = Instance.new("BodyAngularVelocity")
                            bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                            bav.AngularVelocity = Vector3.new(0, 99999, 0)
                            bav.Parent = root

                            local bv = Instance.new("BodyVelocity")
                            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            bv.Velocity = mRoot.Position - root.Position
                            bv.Parent = root

                            root.CFrame = mRoot.CFrame
                            task.wait(0.15)
                            bav:Destroy()
                            bv:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj.Name == "Candy" or obj.Name == "CoinVisual" then
                    if getgenv().CandyESP then
                        if not obj:FindFirstChild("CandyHighlight") then
                            local hl = Instance.new("Highlight")
                            hl.Name = "CandyHighlight"
                            hl.FillColor = Color3.fromRGB(255, 110, 0)
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.FillTransparency = 0.3
                            hl.Parent = obj
                        end
                    else
                        if obj:FindFirstChild("CandyHighlight") then
                            obj.CandyHighlight:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)
