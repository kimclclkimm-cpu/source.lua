-- ===================== ADMIN GUI (Speed 리셋 방지 포함) =====================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("AdminGui") then
	PlayerGui.AdminGui:Destroy()
end
pcall(function()
	local cg = game:GetService("CoreGui")
	if cg:FindFirstChild("AdminGui") then cg.AdminGui:Destroy() end
end)

local AdminGui = Instance.new("ScreenGui")
AdminGui.Name = "AdminGui"
AdminGui.ResetOnSpawn = false
AdminGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AdminGui.DisplayOrder = 999
AdminGui.OnTopOfCoreBlur = true
AdminGui.IgnoreGuiInset = true

local parented = pcall(function()
	if typeof(gethui) == "function" then
		AdminGui.Parent = gethui()
	else
		AdminGui.Parent = game:GetService("CoreGui")
	end
end)
if not parented or not AdminGui.Parent then
	AdminGui.Parent = PlayerGui
end

-- ===================== 공통 프레임 =====================
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = AdminGui
Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -310, 0.5, -210)
Frame.Size = UDim2.new(0, 620, 0, 460)
Frame.Active = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 12)
Title.Size = UDim2.new(1, 0, 0, 36)
Title.Font = Enum.Font.GothamBold
Title.Text = "ADMIN GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Frame
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 55, 55)
CloseBtn.Position = UDim2.new(1, -48, 0, 12)
CloseBtn.Size = UDim2.new(0, 36, 0, 36)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

-- ===================== 탭 버튼 =====================
local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Parent = Frame
MainTabBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
MainTabBtn.Position = UDim2.new(0, 20, 0, 55)
MainTabBtn.Size = UDim2.new(0, 140, 0, 36)
MainTabBtn.Font = Enum.Font.GothamBold
MainTabBtn.Text = "Main"
MainTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTabBtn.TextSize = 15
Instance.new("UICorner", MainTabBtn).CornerRadius = UDim.new(0, 8)

local EspTabBtn = Instance.new("TextButton")
EspTabBtn.Parent = Frame
EspTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
EspTabBtn.Position = UDim2.new(0, 170, 0, 55)
EspTabBtn.Size = UDim2.new(0, 140, 0, 36)
EspTabBtn.Font = Enum.Font.GothamBold
EspTabBtn.Text = "ESP"
EspTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTabBtn.TextSize = 15
Instance.new("UICorner", EspTabBtn).CornerRadius = UDim.new(0, 8)

local MistTabBtn = Instance.new("TextButton")
MistTabBtn.Parent = Frame
MistTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
MistTabBtn.Position = UDim2.new(0, 320, 0, 55)
MistTabBtn.Size = UDim2.new(0, 140, 0, 36)
MistTabBtn.Font = Enum.Font.GothamBold
MistTabBtn.Text = "Mist"
MistTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MistTabBtn.TextSize = 15
Instance.new("UICorner", MistTabBtn).CornerRadius = UDim.new(0, 8)

-- ===================== MAIN 내용 =====================
local MainContent = Instance.new("Frame")
MainContent.Name = "MainContent"
MainContent.Parent = Frame
MainContent.BackgroundTransparency = 1
MainContent.Position = UDim2.new(0, 0, 0, 100)
MainContent.Size = UDim2.new(1, 0, 1, -110)

local AimLockToggle = Instance.new("TextButton")
AimLockToggle.Parent = MainContent
AimLockToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
AimLockToggle.Position = UDim2.new(0.5, -250, 0.05, 0)
AimLockToggle.Size = UDim2.new(0, 240, 0, 48)
AimLockToggle.Font = Enum.Font.GothamBold
AimLockToggle.Text = "🎯 AimLock: OFF"
AimLockToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimLockToggle.TextSize = 16
Instance.new("UICorner", AimLockToggle).CornerRadius = UDim.new(0, 10)

local WallAimToggle = Instance.new("TextButton")
WallAimToggle.Parent = MainContent
WallAimToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
WallAimToggle.Position = UDim2.new(0.5, 10, 0.05, 0)
WallAimToggle.Size = UDim2.new(0, 240, 0, 48)
WallAimToggle.Font = Enum.Font.GothamBold
WallAimToggle.Text = "🧱 WallAimLock: OFF"
WallAimToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
WallAimToggle.TextSize = 16
Instance.new("UICorner", WallAimToggle).CornerRadius = UDim.new(0, 10)

local HeadshotToggle = Instance.new("TextButton")
HeadshotToggle.Parent = MainContent
HeadshotToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
HeadshotToggle.Position = UDim2.new(0.5, -120, 0.35, 0)
HeadshotToggle.Size = UDim2.new(0, 240, 0, 48)
HeadshotToggle.Font = Enum.Font.GothamBold
HeadshotToggle.Text = "💀 Force Headshot: OFF"
HeadshotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadshotToggle.TextSize = 16
Instance.new("UICorner", HeadshotToggle).CornerRadius = UDim.new(0, 10)

local MainInfo = Instance.new("TextLabel")
MainInfo.Parent = MainContent
MainInfo.BackgroundTransparency = 1
MainInfo.Position = UDim2.new(0, 20, 0.7, 0)
MainInfo.Size = UDim2.new(1, -40, 0, 50)
MainInfo.Font = Enum.Font.Gotham
MainInfo.Text = "X = 숨김  |  End 키 = 다시 표시"
MainInfo.TextColor3 = Color3.fromRGB(180, 180, 180)
MainInfo.TextSize = 14

-- ===================== ESP 내용 =====================
local EspContent = Instance.new("Frame")
EspContent.Name = "EspContent"
EspContent.Parent = Frame
EspContent.BackgroundTransparency = 1
EspContent.Position = UDim2.new(0, 0, 0, 100)
EspContent.Size = UDim2.new(1, 0, 1, -110)
EspContent.Visible = false

local BoxToggle = Instance.new("TextButton")
BoxToggle.Parent = EspContent
BoxToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
BoxToggle.Position = UDim2.new(0.5, -120, 0.15, 0)
BoxToggle.Size = UDim2.new(0, 240, 0, 50)
BoxToggle.Font = Enum.Font.GothamBold
BoxToggle.Text = "📦 ESP Box: OFF"
BoxToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BoxToggle.TextSize = 17
Instance.new("UICorner", BoxToggle).CornerRadius = UDim.new(0, 10)

local NameToggle = Instance.new("TextButton")
NameToggle.Parent = EspContent
NameToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
NameToggle.Position = UDim2.new(0.5, -120, 0.4, 0)
NameToggle.Size = UDim2.new(0, 240, 0, 50)
NameToggle.Font = Enum.Font.GothamBold
NameToggle.Text = "🏷 ESP Name: OFF"
NameToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NameToggle.TextSize = 17
Instance.new("UICorner", NameToggle).CornerRadius = UDim.new(0, 10)

-- ===================== MIST 내용 =====================
local MistContent = Instance.new("Frame")
MistContent.Name = "MistContent"
MistContent.Parent = Frame
MistContent.BackgroundTransparency = 1
MistContent.Position = UDim2.new(0, 0, 0, 100)
MistContent.Size = UDim2.new(1, 0, 1, -110)
MistContent.Visible = false

local FlyToggle = Instance.new("TextButton")
FlyToggle.Parent = MistContent
FlyToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
FlyToggle.Position = UDim2.new(0.5, -250, 0.02, 0)
FlyToggle.Size = UDim2.new(0, 240, 0, 42)
FlyToggle.Font = Enum.Font.GothamBold
FlyToggle.Text = "🕊 Fly: OFF"
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.TextSize = 15
Instance.new("UICorner", FlyToggle).CornerRadius = UDim.new(0, 10)

local NoClipToggle = Instance.new("TextButton")
NoClipToggle.Parent = MistContent
NoClipToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
NoClipToggle.Position = UDim2.new(0.5, 10, 0.02, 0)
NoClipToggle.Size = UDim2.new(0, 240, 0, 42)
NoClipToggle.Font = Enum.Font.GothamBold
NoClipToggle.Text = "👻 NoClip: OFF"
NoClipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClipToggle.TextSize = 15
Instance.new("UICorner", NoClipToggle).CornerRadius = UDim.new(0, 10)

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Parent = MistContent
SpeedToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SpeedToggle.Position = UDim2.new(0.5, -120, 0.18, 0)
SpeedToggle.Size = UDim2.new(0, 240, 0, 42)
SpeedToggle.Font = Enum.Font.GothamBold
SpeedToggle.Text = "⚡ Speed: OFF"
SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggle.TextSize = 15
Instance.new("UICorner", SpeedToggle).CornerRadius = UDim.new(0, 10)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = MistContent
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0.5, -120, 0.32, 0)
SpeedLabel.Size = UDim2.new(0, 240, 0, 24)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Text = "WalkSpeed: 50"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 13

local SpeedUp = Instance.new("TextButton")
SpeedUp.Parent = MistContent
SpeedUp.BackgroundColor3 = Color3.fromRGB(50, 100, 180)
SpeedUp.Position = UDim2.new(0.5, -120, 0.40, 0)
SpeedUp.Size = UDim2.new(0, 110, 0, 34)
SpeedUp.Font = Enum.Font.GothamBold
SpeedUp.Text = "속도 +"
SpeedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedUp.TextSize = 13
Instance.new("UICorner", SpeedUp).CornerRadius = UDim.new(0, 8)

local SpeedDown = Instance.new("TextButton")
SpeedDown.Parent = MistContent
SpeedDown.BackgroundColor3 = Color3.fromRGB(50, 100, 180)
SpeedDown.Position = UDim2.new(0.5, 10, 0.40, 0)
SpeedDown.Size = UDim2.new(0, 110, 0, 34)
SpeedDown.Font = Enum.Font.GothamBold
SpeedDown.Text = "속도 -"
SpeedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedDown.TextSize = 13
Instance.new("UICorner", SpeedDown).CornerRadius = UDim.new(0, 8)

local ToLabel = Instance.new("TextLabel")
ToLabel.Parent = MistContent
ToLabel.BackgroundTransparency = 1
ToLabel.Position = UDim2.new(0.5, -150, 0.55, 0)
ToLabel.Size = UDim2.new(0, 300, 0, 22)
ToLabel.Font = Enum.Font.GothamBold
ToLabel.Text = "To (플레이어 뒤로 텔레포트)"
ToLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToLabel.TextSize = 14

local NameBox = Instance.new("TextBox")
NameBox.Parent = MistContent
NameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
NameBox.Position = UDim2.new(0.5, -150, 0.63, 0)
NameBox.Size = UDim2.new(0, 300, 0, 36)
NameBox.Font = Enum.Font.Gotham
NameBox.PlaceholderText = "유저네임 입력 (예: Player1)"
NameBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
NameBox.Text = ""
NameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
NameBox.TextSize = 14
NameBox.ClearTextOnFocus = false
Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0, 8)

local TpBtn = Instance.new("TextButton")
TpBtn.Parent = MistContent
TpBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 90)
TpBtn.Position = UDim2.new(0.5, -100, 0.76, 0)
TpBtn.Size = UDim2.new(0, 200, 0, 40)
TpBtn.Font = Enum.Font.GothamBold
TpBtn.Text = "텔레포트하기"
TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TpBtn.TextSize = 15
Instance.new("UICorner", TpBtn).CornerRadius = UDim.new(0, 8)

local TpStatus = Instance.new("TextLabel")
TpStatus.Parent = MistContent
TpStatus.BackgroundTransparency = 1
TpStatus.Position = UDim2.new(0.5, -150, 0.88, 0)
TpStatus.Size = UDim2.new(0, 300, 0, 22)
TpStatus.Font = Enum.Font.Gotham
TpStatus.Text = ""
TpStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
TpStatus.TextSize = 13

-- ===================== 탭 전환 =====================
local function setTab(tab)
	MainContent.Visible = (tab == "Main")
	EspContent.Visible = (tab == "ESP")
	MistContent.Visible = (tab == "Mist")
	MainTabBtn.BackgroundColor3 = (tab == "Main") and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	EspTabBtn.BackgroundColor3 = (tab == "ESP") and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	MistTabBtn.BackgroundColor3 = (tab == "Mist") and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
end

MainTabBtn.MouseButton1Click:Connect(function() setTab("Main") end)
EspTabBtn.MouseButton1Click:Connect(function() setTab("ESP") end)
MistTabBtn.MouseButton1Click:Connect(function() setTab("Mist") end)

-- ===================== 드래그 =====================
local dragging, dragStart, startPos
Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position
	end
end)
Frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- ===================== X / End =====================
CloseBtn.MouseButton1Click:Connect(function()
	AdminGui.Enabled = false
end)

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.End then
		AdminGui.Enabled = true
	end
end)

-- ===================== ESP =====================
local EspBoxEnabled = false
local EspNameEnabled = false
local EspObjects = {}

local function clearEsp(plr)
	if EspObjects[plr] then
		for _, obj in pairs(EspObjects[plr]) do
			if obj.Remove then obj:Remove() end
		end
		EspObjects[plr] = nil
	end
end

local function createEsp(plr)
	if plr == LocalPlayer then return end
	clearEsp(plr)
	local box = Drawing.new("Square")
	box.Thickness = 1.5
	box.Filled = false
	box.Color = Color3.fromRGB(0, 255, 100)
	box.Visible = false
	local name = Drawing.new("Text")
	name.Size = 16
	name.Center = true
	name.Outline = true
	name.Color = Color3.fromRGB(255, 255, 255)
	name.Visible = false
	EspObjects[plr] = {Box = box, Name = name}
end

local function updateEsp()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr == LocalPlayer then continue end
		if not EspObjects[plr] then createEsp(plr) end
		local objs = EspObjects[plr]
		local char = plr.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local head = char and char:FindFirstChild("Head")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if not root or not head or not hum or hum.Health <= 0 then
			objs.Box.Visible = false
			objs.Name.Visible = false
			continue
		end
		local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
		if not onScreen then
			objs.Box.Visible = false
			objs.Name.Visible = false
			continue
		end
		if EspBoxEnabled then
			local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
			local legPos = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
			local height = math.abs(headPos.Y - legPos.Y)
			local width = height / 2
			objs.Box.Size = Vector2.new(width, height)
			objs.Box.Position = Vector2.new(pos.X - width/2, pos.Y - height/2)
			objs.Box.Visible = true
		else
			objs.Box.Visible = false
		end
		if EspNameEnabled then
			objs.Name.Text = plr.Name
			objs.Name.Position = Vector2.new(pos.X, pos.Y - 40)
			objs.Name.Visible = true
		else
			objs.Name.Visible = false
		end
	end
end

Players.PlayerRemoving:Connect(clearEsp)
RunService.RenderStepped:Connect(function()
	if EspBoxEnabled or EspNameEnabled then updateEsp() end
end)

BoxToggle.MouseButton1Click:Connect(function()
	EspBoxEnabled = not EspBoxEnabled
	BoxToggle.Text = EspBoxEnabled and "📦 ESP Box: ON" or "📦 ESP Box: OFF"
	BoxToggle.BackgroundColor3 = EspBoxEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	if not EspBoxEnabled then
		for _, objs in pairs(EspObjects) do objs.Box.Visible = false end
	end
end)

NameToggle.MouseButton1Click:Connect(function()
	EspNameEnabled = not EspNameEnabled
	NameToggle.Text = EspNameEnabled and "🏷 ESP Name: ON" or "🏷 ESP Name: OFF"
	NameToggle.BackgroundColor3 = EspNameEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	if not EspNameEnabled then
		for _, objs in pairs(EspObjects) do objs.Name.Visible = false end
	end
end)

-- ===================== Fly =====================
local FlyEnabled = false
local FlySpeed = 50
local BodyVel, BodyGyro = nil, nil

local function stopFly()
	if BodyVel then BodyVel:Destroy() BodyVel = nil end
	if BodyGyro then BodyGyro:Destroy() BodyGyro = nil end
	local char = LocalPlayer.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum.PlatformStand = false end
	end
end

local function startFly()
	local char = LocalPlayer.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not root or not hum then return end
	stopFly()
	hum.PlatformStand = true
	BodyVel = Instance.new("BodyVelocity")
	BodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	BodyVel.Velocity = Vector3.new(0, 0, 0)
	BodyVel.Parent = root
	BodyGyro = Instance.new("BodyGyro")
	BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	BodyGyro.P = 9e4
	BodyGyro.Parent = root
end

FlyToggle.MouseButton1Click:Connect(function()
	FlyEnabled = not FlyEnabled
	if FlyEnabled then
		FlyToggle.Text = "🕊 Fly: ON"
		FlyToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
		startFly()
	else
		FlyToggle.Text = "🕊 Fly: OFF"
		FlyToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
		stopFly()
	end
end)

RunService.RenderStepped:Connect(function()
	if not FlyEnabled or not BodyVel or not BodyGyro then return end
	local char = LocalPlayer.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local camCF = Camera.CFrame
	local move = Vector3.zero
	if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + camCF.LookVector end
	if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - camCF.LookVector end
	if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - camCF.RightVector end
	if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + camCF.RightVector end
	if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
	if move.Magnitude > 0 then move = move.Unit * FlySpeed end
	BodyVel.Velocity = move
	BodyGyro.CFrame = camCF
end)

-- ===================== NoClip =====================
local NoClipEnabled = false

NoClipToggle.MouseButton1Click:Connect(function()
	NoClipEnabled = not NoClipEnabled
	NoClipToggle.Text = NoClipEnabled and "👻 NoClip: ON" or "👻 NoClip: OFF"
	NoClipToggle.BackgroundColor3 = NoClipEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
end)

RunService.Stepped:Connect(function()
	if not NoClipEnabled then return end
	local char = LocalPlayer.Character
	if not char then return end
	for _, part in pairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
		end
	end
end)

-- ===================== Speed (리셋 방지) =====================
local SpeedEnabled = false
local WalkSpeedValue = 50

local function applySpeed()
	local char = LocalPlayer.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.WalkSpeed = SpeedEnabled and WalkSpeedValue or 16
	end
end

SpeedToggle.MouseButton1Click:Connect(function()
	SpeedEnabled = not SpeedEnabled
	SpeedToggle.Text = SpeedEnabled and "⚡ Speed: ON" or "⚡ Speed: OFF"
	SpeedToggle.BackgroundColor3 = SpeedEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	applySpeed()
end)

SpeedUp.MouseButton1Click:Connect(function()
	WalkSpeedValue = math.clamp(WalkSpeedValue + 5, 16, 300)
	SpeedLabel.Text = "WalkSpeed: " .. WalkSpeedValue
	if SpeedEnabled then applySpeed() end
end)

SpeedDown.MouseButton1Click:Connect(function()
	WalkSpeedValue = math.clamp(WalkSpeedValue - 5, 16, 300)
	SpeedLabel.Text = "WalkSpeed: " .. WalkSpeedValue
	if SpeedEnabled then applySpeed() end
end)

-- 핵심: Speed 켜져 있으면 계속 강제 적용
RunService.Heartbeat:Connect(function()
	if SpeedEnabled then
		applySpeed()
	end
end)

-- ===================== To (텔레포트) =====================
local function findPlayerByName(name)
	name = string.lower(name or "")
	if name == "" then return nil end
	for _, plr in ipairs(Players:GetPlayers()) do
		if string.lower(plr.Name) == name or string.lower(plr.DisplayName) == name then
			return plr
		end
		if string.find(string.lower(plr.Name), name, 1, true)
			or string.find(string.lower(plr.DisplayName), name, 1, true) then
			return plr
		end
	end
	return nil
end

TpBtn.MouseButton1Click:Connect(function()
	local target = findPlayerByName(NameBox.Text)
	if not target then
		TpStatus.Text = "플레이어를 찾을 수 없습니다"
		TpStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
		return
	end
	local targetRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
	local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not targetRoot or not myRoot then
		TpStatus.Text = "캐릭터가 없습니다"
		TpStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
		return
	end
	myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3.5)
	TpStatus.Text = target.Name .. " 뒤로 이동 완료"
	TpStatus.TextColor3 = Color3.fromRGB(80, 255, 120)
end)

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.3)
	if FlyEnabled then startFly() else stopFly() end
	if SpeedEnabled then applySpeed() end
end)

-- ===================== AimLock / WallAimLock / ForceHeadshot =====================
local AimLockEnabled = false
local WallAimLockEnabled = false
local ForceHeadshotEnabled = false
local HoldingRightClick = false
local CurrentTarget = nil

local function updateAimButtons()
	AimLockToggle.Text = AimLockEnabled and "🎯 AimLock: ON" or "🎯 AimLock: OFF"
	AimLockToggle.BackgroundColor3 = AimLockEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
	WallAimToggle.Text = WallAimLockEnabled and "🧱 WallAimLock: ON" or "🧱 WallAimLock: OFF"
	WallAimToggle.BackgroundColor3 = WallAimLockEnabled and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(50, 50, 60)
end

AimLockToggle.MouseButton1Click:Connect(function()
	AimLockEnabled = not AimLockEnabled
	if AimLockEnabled then WallAimLockEnabled = false end
	CurrentTarget = nil
	updateAimButtons()
end)

WallAimToggle.MouseButton1Click:Connect(function()
	WallAimLockEnabled = not WallAimLockEnabled
	if WallAimLockEnabled then AimLockEnabled = false end
	CurrentTarget = nil
	updateAimButtons()
end)

HeadshotToggle.MouseButton1Click:Connect(function()
	ForceHeadshotEnabled = not ForceHeadshotEnabled
	HeadshotToggle.Text = ForceHeadshotEnabled and "💀 Force Headshot: ON" or "💀 Force Headshot: OFF"
	HeadshotToggle.BackgroundColor3 = ForceHeadshotEnabled and Color3.fromRGB(200, 45, 45) or Color3.fromRGB(50, 50, 60)
end)

UserInputService.InputBegan:Connect(function(input, gp)
	if not gp and input.UserInputType == Enum.UserInputType.MouseButton2 then
		HoldingRightClick = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		HoldingRightClick = false
		CurrentTarget = nil
	end
end)

local function IsVisible(character)
	local head = character and character:FindFirstChild("Head")
	if not head then return false end
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {LocalPlayer.Character}
	params.IgnoreWater = true
	local origin = Camera.CFrame.Position
	local result = workspace:Raycast(origin, head.Position - origin, params)
	return result == nil or result.Instance:IsDescendantOf(character)
end

local function IsAlive(plr)
	local char = plr and plr.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	return hum ~= nil and hum.Health > 0 and char:FindFirstChild("Head") ~= nil
end

local function GetClosestPlayer(requireVisible)
	local closest, shortest = nil, math.huge
	local mousePos = UserInputService:GetMouseLocation()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and IsAlive(plr) then
			local head = plr.Character.Head
			local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
			if onScreen and (not requireVisible or IsVisible(plr.Character)) then
				local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
				if dist < shortest then
					shortest = dist
					closest = plr
				end
			end
		end
	end
	return closest
end

RunService.RenderStepped:Connect(function()
	if not (AimLockEnabled or WallAimLockEnabled) or not HoldingRightClick then return end
	local needVisible = AimLockEnabled
	if not IsAlive(CurrentTarget) or (needVisible and not IsVisible(CurrentTarget.Character)) then
		CurrentTarget = GetClosestPlayer(needVisible)
	end
	if CurrentTarget and IsAlive(CurrentTarget) then
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Character.Head.Position)
	end
end)

_G.ForceHeadshot = function(targetCharacter, damage)
	if not ForceHeadshotEnabled then return false end
	local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return false end
	humanoid:TakeDamage(damage or 100)
	return true
end

print("[AdminGui] Speed 리셋 방지 통합 완료")