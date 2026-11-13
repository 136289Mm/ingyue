local P=game:GetService("Players")local T=game:GetService("TweenService")local pl=P.LocalPlayer local pg=pl:WaitForChild("PlayerGui")
local UIS=game:GetService("UserInputService")
local IN=Instance.new

local GOLD=Color3.fromRGB(255,200,50)
local PURP=Color3.fromRGB(130,80,220)
local DI=Color3.fromRGB(12,14,20) 
local FW=Color3.fromRGB(240,245,255)

local g=IN("ScreenGui")g.Name="MusicRepo4"g.ResetOnSpawn=false g.IgnoreGuiInset=true g.Parent=pg

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

local ti=IN("TextLabel")ti.Size=UDim2.new(1,-80,0,30)ti.Position=UDim2.new(0,20,0,15)ti.BackgroundTransparency=1 ti.Text="音乐仓库 4"ti.TextColor3=GOLD ti.TextSize=20 ti.Font=Enum.Font.GothamBlack ti.TextXAlignment=Enum.TextXAlignment.Left ti.ZIndex=3 ti.Parent=m

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
夜曲|139355201644243
无人之岛|130495965769206
我落泪情绪零碎|105189449355727
苦茶子|112814263629711
晴天|104378518510338
稻香|97203442342796
反乌托邦|117110253516151
催眠曲|71934965392436
打火机|106163933475151
告白气球|85373130121712
海阔天空伴奏|125897274540057
广东爱情故事|108067557520671
武家坡|88304207692432
咏春|81982499268244
知我|104939860670645
王琴牛肉面|72954292508946
失眠|138048397060431
银河|11174867550842
DJ老男孩|139077571929471
关山酒|95280153572320
串烧|126799830755086
红色高跟鞋|116195313552286
爱我还是他|71801490652455
轨迹|93907466733987
说好不哭|75343620587168
捷德奥特曼片尾曲|99590355252943
孤独患者|88257174439605
零距离的失恋|103782895676850
罗生门|79952466129206
茫|72194943092340
指纹|113798735846049
还是分开|101136970619190
暗号|96939204814618
春娇与志明|98977211342698
给我一首歌的时间|94967211880052
一路向北|133884933067429
十面埋伏|99248598986390
精卫|105304444874068
一样的月光|86582687674232
幻昼|103093530102792
失落沙洲|131288163821477
爱你没差|127941433099488
牵丝戏|87434869764368
花海|100728815581027
游京|132772094469180
唐人|74173898692517
辞九门|75361870687357
把回忆|132524361907107
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
