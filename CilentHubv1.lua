local supportedGames = {
    [14451515684] = "PETA PETA Level6"
}

if not supportedGames[game.GameId] then
    game.Players.LocalPlayer:Kick("This game is not supported by Client Hub.")
    return
end

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "Client Hub | Peta Peta lvl 6"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 340, 0, 140)
mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 3
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Title bar
local titleBar = Instance.new("TextLabel", mainFrame)
titleBar.Size = UDim2.new(1, -60, 0, 35)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.Text = "Client -Hub | Peta peta Level 6"
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 16
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local minBtn = Instance.new("TextButton", mainFrame)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -60, 0, 3)
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 20
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Close Button
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 3)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Content Frame (for future buttons)
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.Size = UDim2.new(1, 0, 1, -60)
contentFrame.BackgroundTransparency = 1
contentFrame.Name = "ContentFrame"

-- Minimize toggle
local minimized = false
minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	contentFrame.Visible = not minimized
end)

-- Close GUI
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Credit Label
local credit = Instance.new("TextLabel", mainFrame)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -20)
credit.BackgroundTransparency = 1
credit.Text = "Made by Faheem"
credit.Font = Enum.Font.Gotham
credit.TextSize = 13
credit.TextColor3 = Color3.fromRGB(255, 255, 255)
credit.TextXAlignment = Enum.TextXAlignment.Center

-- Color Pulse Effect (Black ↔ White)
local function pulseTextColor(textLabel)
    coroutine.wrap(function()
        while textLabel and textLabel.Parent do
            local toBlack = TweenService:Create(textLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(0, 0, 0)
            })
            toBlack:Play()
            toBlack.Completed:Wait()

            local toWhite = TweenService:Create(textLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
            toWhite:Play()
            toWhite.Completed:Wait()
        end
    end)()
end

pulseTextColor(titleBar)
pulseTextColor(credit)
