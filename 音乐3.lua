local P=game:GetService("Players")local T=game:GetService("TweenService")local pl=P.LocalPlayer local pg=pl:WaitForChild("PlayerGui")
local UIS=game:GetService("UserInputService")
local IN=Instance.new

local GOLD=Color3.fromRGB(255,200,50)
local PURP=Color3.fromRGB(130,80,220)
local DI=Color3.fromRGB(12,14,20) 
local FW=Color3.fromRGB(240,245,255)

local g=IN("ScreenGui")g.Name="MusicRepo3"g.ResetOnSpawn=false g.IgnoreGuiInset=true g.Parent=pg

local m=IN("Frame")
m.Size=UDim2.new(0,600,0,350)
m.Position=UDim2.new(.5,-300,.5,-175)
m.BackgroundColor3=DI
m.BackgroundTransparency=.15
m.BorderSizePixel=0
m.ClipsDescendants=true 
m.Visible = false
m.Parent=g 
IN("UICorner",m).CornerRadius=UDim.new(0,10)

local st=IN("UIStroke",m)st.Thickness=2 st.Color=GOLD st.Transparency=.3
T:Create(st,TweenInfo.new(2.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{Color=PURP}):Play()

local ti=IN("TextLabel")ti.Size=UDim2.new(1,-80,0,30)ti.Position=UDim2.new(0,20,0,15)ti.BackgroundTransparency=1 ti.Text="音乐仓库 3"ti.TextColor3=GOLD ti.TextSize=20 ti.Font=Enum.Font.GothamBlack ti.TextXAlignment=Enum.TextXAlignment.Left ti.ZIndex=3 ti.Parent=m

local mi=IN("TextButton")mi.Size=UDim2.new(0,24,0,24)mi.Position=UDim2.new(1,-58,0,18)mi.BackgroundTransparency=1 mi.Text="—"mi.TextColor3=FW mi.TextSize=18 mi.Font=Enum.Font.GothamBold mi.ZIndex=5 mi.Parent=m
local cl=IN("TextButton")cl.Size=UDim2.new(0,24,0,24)cl.Position=UDim2.new(1,-30,0,18)cl.BackgroundTransparency=1 cl.Text="×"cl.TextColor3=FW cl.TextSize=20 cl.Font=Enum.Font.GothamBold cl.ZIndex=5 cl.Parent=m

local line=IN("Frame")line.Size=UDim2.new(1,-40,0,1)line.Position=UDim2.new(0,20,0,50)line.BackgroundColor3=GOLD line.BackgroundTransparency=.5 line.BorderSizePixel=0 line.ZIndex=3 line.Parent=m

local li=IN("ScrollingFrame")
li.Size=UDim2.new(1,-40,1,-70)
li.Position=UDim2.new(0,20,0,60)
li.BackgroundTransparency=1
li.BorderSizePixel=0
li.ScrollBarThickness=2
li.ScrollBarImageColor3=GOLD
li.CanvasSize=UDim2.new(0,0,0,0)
li.AutomaticCanvasSize=Enum.AutomaticSize.Y
li.ZIndex=3
li.Parent=m 
IN("UIListLayout",li).Padding=UDim.new(0,4)

local SONG_DATA = [[
起风了|99498025749186
莫问归期|132049153370517
川普|82518513365412
国歌|1845918435
进步|124597524602869
伤感|103001052289903
教員|3068736836
豪庭|121336636707861
漂移|82736875196779
科比|99519218846428
氛围|130437050908450
唯一|138570939058838
大东北|134786908423441
山歌|124523430035974
新新|5409360995
奇迹再现|93593405027904
祝国人|86555185586884
wasted|107797507930019
合集|132048319229461
忘川彼岸|122016217747203
我本将心向明月|90627502789937
如果可以|88579552265286
你走|123927834442832
兰亭序|135324082524426
赛迦进行曲|88452678471146
银河奥特曼|136380055431487
空难之歌|93954211017533
祖国人进行曲|119298700286768
耍把戏|126178779210083
欧布|127443781811950
雷欧|108500559346523
中长跑9万字|81137321144573
迷你世界老版本主题曲|111290452660150
迷你世界战斗小曲|95680904128050
空城计|110501002424469
琵琶曲|91643849817584
东南|120260326962280
njj|105828916140935
风|93008010885802
老朱|85902137616312
啰命|81117689334191
豺狼进行曲|76681728135352
广东歌|119021048527411
爆率传奇|92243895464690
跳楼机|98850529016454
小城夏天|132959953803661
一笑倾城|132959953803661
一剪梅|120145064597801
]]

for name, id in SONG_DATA:gmatch("([^|\n]+)|([^\n]+)") do
    local btn=IN("TextButton")
    btn.Size=UDim2.new(1,0,0,34)
    btn.BackgroundColor3=Color3.fromRGB(20,25,35)
    btn.BackgroundTransparency=.4
    btn.BorderSizePixel=0
    btn.Text="  "..name.."   |   "..id
    btn.TextColor3=FW
    btn.TextSize=13
    btn.Font=Enum.Font.GothamBold
    btn.TextXAlignment=Enum.TextXAlignment.Left
    btn.ZIndex=4
    btn.Parent=li
    IN("UICorner",btn).CornerRadius=UDim.new(0,6)
    
    local bs=IN("UIStroke",btn)bs.Color=GOLD bs.Thickness=1 bs.Transparency=.8
    
    btn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(id)
            local oldText = btn.Text
            btn.Text = "  ✅ 已复制 ID: "..id
            btn.TextColor3 = Color3.fromRGB(0,255,100)
            task.wait(1)
            btn.Text = oldText
            btn.TextColor3 = FW
        end
    end)
end

local function L(u,f)local o,p=pcall(function()if not isfile(f)then writefile(f,game:HttpGet(u))end return getcustomasset(f)end)return o and p or nil end
local orbImg=L("https://i.ibb.co/tPmpdph6/Image-1794569972481-855.jpg","so.png")

local o=IN("ImageButton")
o.Size=UDim2.new(0,40,0,40)
o.Position=UDim2.new(.5,-20,.5,-20)
o.BackgroundTransparency=1 
o.Image=orbImg or "rbxassetid://0"
o.ScaleType=Enum.ScaleType.Crop 
o.Visible=false 
o.Parent=g 
IN("UICorner",o).CornerRadius=UDim.new(0,8)
local os=IN("UIStroke",o)os.Color=GOLD os.Thickness=1 os.Transparency=.4

m.Visible = true
m.Size = UDim2.new(0,0,0,0)
m.Position = UDim2.new(.5,0,.5,0)
m.BackgroundTransparency = 1
T:Create(m, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0,600,0,350),
    Position = UDim2.new(.5,-300,.5,-175),
    BackgroundTransparency = .15
}):Play()

mi.MouseButton1Click:Connect(function()
    local currentCenterPos = m.Position
    T:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0,0,0,0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    m.Visible=false 
    o.Visible=true
    o.Position = currentCenterPos
    o.Size = UDim2.new(0,0,0,0)
    T:Create(o, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0,40,0,40)
    }):Play()
end)

o.MouseButton1Click:Connect(function()
    local currentOrbPos = o.Position
    T:Create(o, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0,0,0,0)
    }):Play()
    task.wait(0.2)
    o.Visible=false 
    m.Visible=true
    m.Size = UDim2.new(0,0,0,0)
    m.Position = currentOrbPos
    m.BackgroundTransparency = 1
    T:Create(m, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0,600,0,350),
        BackgroundTransparency = .15
    }):Play()
end)

cl.MouseButton1Click:Connect(function()
    T:Create(m, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0,600,0,0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    g:Destroy()
end)

local dragging, dragInput, dragStart, startPos
o.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = o.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
o.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        o.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
