local P = game:GetService("Players")
local T = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local pl = P.LocalPlayer
local pg = pl:WaitForChild("PlayerGui")
local IN = Instance.new

local FW = Color3.fromRGB(240, 245, 255)
local DI = Color3.fromRGB(12, 14, 20)
local GOLD = Color3.fromRGB(255, 200, 50)
local PURP = Color3.fromRGB(130, 80, 220)

local g = IN("ScreenGui")
g.Name = "SonicMusic"
g.ResetOnSpawn = false
g.IgnoreGuiInset = true
g.Parent = pg

-- 主面板 (锁定中心)
local m = IN("Frame")
m.AnchorPoint = Vector2.new(0.5, 0.5)
m.Size = UDim2.new(0, 360, 0, 210)
m.Position = UDim2.new(0.5, 0, 0.5, 0)
m.BackgroundColor3 = DI
m.BackgroundTransparency = 0.15
m.BorderSizePixel = 0
m.ClipsDescendants = true
m.Parent = g
IN("UICorner", m).CornerRadius = UDim.new(0, 10)

local st = IN("UIStroke", m)
st.Thickness = 2
st.Color = GOLD
st.Transparency = 0.3
T:Create(st, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Color = PURP}):Play()

local ti = IN("TextLabel", m)
ti.Size = UDim2.new(1, -80, 0, 30)
ti.Position = UDim2.new(0, 20, 0, 15)
ti.BackgroundTransparency = 1
ti.Text = "Sonic Player"
ti.TextColor3 = GOLD
ti.TextSize = 20
ti.Font = Enum.Font.GothamBlack
ti.TextXAlignment = Enum.TextXAlignment.Left
ti.ZIndex = 3

-- 极简图标：最小化
local mi = IN("TextButton", m)
mi.Size = UDim2.new(0, 24, 0, 24)
mi.Position = UDim2.new(1, -58, 0, 18)
mi.BackgroundTransparency = 1
mi.Text = ""
mi.ZIndex = 5
local lineMin = IN("Frame", mi)
lineMin.Size = UDim2.new(0, 12, 0, 1.5)
lineMin.Position = UDim2.new(0.5, -6, 0.5, -0.75)
lineMin.BackgroundColor3 = FW
lineMin.BorderSizePixel = 0

-- 极简图标：关闭
local cl = IN("TextButton", m)
cl.Size = UDim2.new(0, 24, 0, 24)
cl.Position = UDim2.new(1, -30, 0, 18)
cl.BackgroundTransparency = 1
cl.Text = ""
cl.ZIndex = 5
local lineX1 = IN("Frame", cl)
lineX1.Size = UDim2.new(0, 12, 0, 1.5)
lineX1.Position = UDim2.new(0.5, -6, 0.5, -0.75)
lineX1.BackgroundColor3 = FW
lineX1.BorderSizePixel = 0
lineX1.Rotation = 45
local lineX2 = IN("Frame", cl)
lineX2.Size = UDim2.new(0, 12, 0, 1.5)
lineX2.Position = UDim2.new(0.5, -6, 0.5, -0.75)
lineX2.BackgroundColor3 = FW
lineX2.BorderSizePixel = 0
lineX2.Rotation = -45

local line = IN("Frame", m)
line.Size = UDim2.new(1, -40, 0, 1)
line.Position = UDim2.new(0, 20, 0, 50)
line.BackgroundColor3 = GOLD
line.BackgroundTransparency = 0.5
line.BorderSizePixel = 0
line.ZIndex = 3

local statusText = IN("TextLabel", m)
statusText.Size = UDim2.new(1, -40, 0, 20)
statusText.Position = UDim2.new(0, 20, 0, 65)
statusText.BackgroundTransparency = 1
statusText.Text = "正在准备播放..."
statusText.TextColor3 = FW
statusText.Font = Enum.Font.GothamBold
statusText.TextSize = 14
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.ZIndex = 4

local inputBox = IN("TextBox", m)
inputBox.Size = UDim2.new(1, -100, 0, 36)
inputBox.Position = UDim2.new(0, 20, 0, 95)
inputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
inputBox.BackgroundTransparency = 0.5
inputBox.PlaceholderText = "粘贴纯数字 ID..."
inputBox.Text = ""
inputBox.TextColor3 = GOLD
inputBox.Font = Enum.Font.Code
inputBox.TextSize = 15
inputBox.ZIndex = 4
IN("UICorner", inputBox).CornerRadius = UDim.new(0, 6)
IN("UIPadding", inputBox).PaddingLeft = UDim.new(0, 10)

local playBtn = IN("TextButton", m)
playBtn.Size = UDim2.new(0, 60, 0, 36)
playBtn.Position = UDim2.new(1, -80, 0, 95)
playBtn.BackgroundColor3 = Color3.fromRGB(60, 50, 20)
playBtn.Text = "播放"
playBtn.TextColor3 = GOLD
playBtn.Font = Enum.Font.GothamBold
playBtn.TextSize = 14
playBtn.ZIndex = 4
IN("UICorner", playBtn).CornerRadius = UDim.new(0, 6)
local bs = IN("UIStroke", playBtn)
bs.Color = GOLD
bs.Thickness = 1
bs.Transparency = 0.3

local tip = IN("TextLabel", m)
tip.Size = UDim2.new(1, -40, 0, 20)
tip.Position = UDim2.new(0, 20, 0, 145)
tip.BackgroundTransparency = 1
tip.Text = "* 注入已自动播放《武家坡》"
tip.TextColor3 = Color3.fromRGB(150, 150, 150)
tip.Font = Enum.Font.Gotham
tip.TextSize = 12
tip.TextXAlignment = Enum.TextXAlignment.Left
tip.ZIndex = 4

local SoundService = game:GetService("SoundService")
for _, v in ipairs(SoundService:GetChildren()) do
    if v.Name == "SonicSound" then v:Destroy() end
end
local snd = IN("Sound", SoundService)
snd.Name = "SonicSound"
snd.Volume = 3
snd.Looped = true

local function LoadAndPlay(id, songName)
    if id == "" or not tonumber(id) then
        statusText.Text = "❌ 请输入纯数字 ID！"
        statusText.TextColor3 = Color3.fromRGB(255, 50, 50)
        return
    end
    snd:Stop()
    snd.SoundId = "rbxassetid://" .. id
    snd:Play()
    statusText.Text = "♫ 正在播放: " .. (songName or id)
    statusText.TextColor3 = GOLD
end

playBtn.MouseButton1Click:Connect(function()
    LoadAndPlay(inputBox.Text, "自定义音乐")
end)

task.spawn(function()
    task.wait(1)
    LoadAndPlay("88304207692432", "武家坡")
end)

local function L(u, f)
    local o, p = pcall(function()
        if not isfile(f) then writefile(f, game:HttpGet(u)) end
        return getcustomasset(f)
    end)
    return o and p or nil
end
local orbImg = L("https://i.ibb.co/tPmpdph6/Image-1794569972481-855.jpg", "so.png")

local o = IN("ImageButton", g)
o.AnchorPoint = Vector2.new(0.5, 0.5)
o.Size = UDim2.new(0, 45, 0, 45)
o.Position = UDim2.new(0.5, 0, 0.5, 0)
o.BackgroundTransparency = 1
o.Image = orbImg or "rbxassetid://0"
o.ScaleType = Enum.ScaleType.Crop
o.Visible = false
IN("UICorner", o).CornerRadius = UDim.new(0, 10)
local os = IN("UIStroke", o)
os.Color = GOLD
os.Thickness = 1.5
os.Transparency = 0.2

-- 初始展开
m.Size = UDim2.new(0, 0, 0, 0)
m.BackgroundTransparency = 1
T:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 360, 0, 210),
    BackgroundTransparency = 0.15
}):Play()

-- ================= 幻影分身法：完美解开死结 =================
local lastOrbPos = UDim2.new(0.5, 0, 0.5, 0) -- 用来记录悬浮球最后待的位置

-- 最小化：菜单直接消失，球出现在记录好的位置
mi.MouseButton1Click:Connect(function()
    T:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    m.Visible = false
    o.Visible = true
    o.Position = lastOrbPos -- 核心：球回到它该在的地方
    o.Size = UDim2.new(0, 0, 0, 0)
    T:Create(o, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 45, 0, 45)
    }):Play()
end)

-- 关闭
cl.MouseButton1Click:Connect(function()
    T:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 360, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    g:Destroy()
    if snd then snd:Destroy() end
end)

local dragging = false
local dragInput, dragStart, startPos
local hasMoved = false 
local pressTime = 0

o.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        hasMoved = false 
        dragStart = input.Position
        startPos = o.Position
        pressTime = tick()
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if not hasMoved and (tick() - pressTime) < 0.15 then
                    -- 记录球现在的坐标
                    lastOrbPos = o.Position
                    
                    T:Create(o, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 0, 0, 0)
                    }):Play()
                    task.wait(0.2)
                    o.Visible = false
                    m.Visible = true
                    m.Size = UDim2.new(0, 0, 0, 0)
                    m.Position = UDim2.new(0.5, 0, 0.5, 0) -- 死死锁定在屏幕正中心展开
                    m.BackgroundTransparency = 1
                    T:Create(m, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 360, 0, 210),
                        BackgroundTransparency = 0.15
                    }):Play()
                end
            end
        end)
    end
end)

o.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            hasMoved = true
        end
        -- 拖动时实时更新球的位置，同时也存进 lastOrbPos 里
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        o.Position = newPos
        lastOrbPos = newPos 
    end
end)
