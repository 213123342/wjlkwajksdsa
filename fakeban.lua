local plr = game.Players.LocalPlayer
local FakeBan = Instance.new("ScreenGui")
local JailTimer = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

--// Properties

FakeBan.Name = "FakeBan"
FakeBan.Parent = game.CoreGui
FakeBan.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

JailTimer.Name = "JailTimer"
JailTimer.Parent = FakeBan
JailTimer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JailTimer.BackgroundTransparency = 1.000
JailTimer.BorderSizePixel = 0
JailTimer.Size = UDim2.new(0, 1364, 0, 767)

TextLabel.Parent = JailTimer
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.426724851, 0, 0.042955175, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Jail Timer: 99999999"
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextSize = 35.000

--// wea pa kickar

plr:Kick("User: BANNED")
