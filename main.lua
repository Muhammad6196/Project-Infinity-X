local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local function ShowSideMessage(msg, opts)
    opts = opts or {}
    local parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local anchor   = opts.anchor           or UDim2.new(1, -20, 1, -120)
    local size     = opts.size             or UDim2.new(0, 260, 0, 48)
    local autoClose = opts.autoCloseSeconds or nil
    local bgColor  = opts.bgColor          or Color3.fromRGB(28, 28, 30)
    local accent   = opts.accentColor      or Color3.fromRGB(85, 170, 255)

    if parent:FindFirstChild("SideMessageBox") then
        parent.SideMessageBox:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name          = "SideMessageBox"
    screenGui.ResetOnSpawn  = false
    screenGui.Parent        = parent

    local frame = Instance.new("Frame")
    frame.Name               = "Container"
    frame.Size               = UDim2.new(0, 0, 0, 0)
    frame.Position           = anchor
    frame.AnchorPoint        = Vector2.new(1, 1)
    frame.BackgroundColor3   = bgColor
    frame.BorderSizePixel    = 0
    frame.ClipsDescendants   = true
    frame.Parent             = screenGui

    Instance.new("UICorner",  frame).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Transparency = 0.85
    stroke.Thickness    = 1

    local label = Instance.new("TextLabel", frame)
    label.Size               = UDim2.new(1, -16, 1, 0)
    label.Position           = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.TextXAlignment     = Enum.TextXAlignment.Left
    label.TextYAlignment     = Enum.TextYAlignment.Center
    label.Font               = Enum.Font.GothamSemibold
    label.TextSize           = 16
    label.TextColor3         = Color3.fromRGB(240, 240, 240)
    label.Text               = tostring(msg or "Join the main game to run this script")
    label.Parent             = frame

    local accentBar = Instance.new("Frame", frame)
    accentBar.Size             = UDim2.new(0, 6, 1, 0)
    accentBar.Position         = UDim2.new(0, 0, 0, 0)
    accentBar.BackgroundColor3 = accent
    Instance.new("UICorner", accentBar).CornerRadius = UDim.new(0, 6)

    TweenService:Create(frame,
        TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        { Size = size }
    ):Play()

    coroutine.wrap(function()
        while frame and frame.Parent do
            TweenService:Create(accentBar,
                TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                { BackgroundTransparency = 0.35 }
            ):Play()
            task.wait(1.0)
        end
    end)()

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local t = TweenService:Create(frame,
                TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, 0) }
            )
            t:Play()
            t.Completed:Wait()
            if screenGui and screenGui.Parent then screenGui:Destroy() end
        end
    end)

    if type(autoClose) == "number" and autoClose > 0 then
        task.delay(autoClose, function()
            if not (frame and frame.Parent) then return end
            local t = TweenService:Create(frame,
                TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, 0) }
            )
            t:Play()
            t.Completed:Wait()
            if screenGui and screenGui.Parent then screenGui:Destroy() end
        end)
    end

    return screenGui
end

local REDIRECT_PLACES = {
    [79546208627805] = true,
    [16116270224]    = true,
}

local FLOWAUTH = "https://flowauth.net/v1/ui/41f3beca09c1e740130cc023d127fb53.lua"

local DISPATCH = {
    [126509999114328] = "https://vss.pandadevelopment.net/virtual/file/a44fd27dbd8b4cff",        -- 99 Nights
    [126884695634066] = "https://pandadevelopment.net/virtual/file/d436a3dec68090f8",             -- Grow A Garden
    [127742093697776] = "https://pandadevelopment.net/virtual/file/f269d7846cd7a206",             -- Plant vs Brainrots
    [9872472334]      = "https://vss.pandadevelopment.net/virtual/file/a6242f0749304af0",         -- Evade
    [121864768012064] = FLOWAUTH,                                                                  -- Fish It
    [142823291]       = FLOWAUTH,                                                                  -- MM2
    [16552821455]     = "https://vss.pandadevelopment.net/virtual/file/f1a3c3bf15b5463b",         -- Dandy World
    [124473577469410] = "https://vss.pandadevelopment.net/virtual/file/8cb263cd3de34c26",         -- Be A Lucky Block
    [70845479499574]  = "https://vss.pandadevelopment.net/virtual/file/9da5b88f3b6d4846",         -- Bite By Night
    [92416421522960]  = "https://vss.pandadevelopment.net/virtual/file/c080c84b98754c18",         -- Slime RNG
    [107778070777162] = "https://vss.pandauth.com/kv/9d4a05ed8176e298",                           -- Steal An Egg
    -- PS99
    [140403681187145] = FLOWAUTH,
    [17503543197]     = FLOWAUTH,
    [16498369169]     = FLOWAUTH,
    [8737899170]      = FLOWAUTH,
    -- Misc FLOWAUTH games
    [72858262610964]  = FLOWAUTH,  --Tap Simulator Reborn
    [920587237]       = FLOWAUTH,  -- Adopt Me
    [78490532994307]  = FLOWAUTH,  -- Build An Ant Empire
    [72858262610964]  = FLOWAUTH,  -- +1 Skipping Stone
    [107535308163741] = FLOWAUTH,
    [72858262610964]  = FLOWAUTH,
}

local pid = game.PlaceId

if REDIRECT_PLACES[pid] then
    ShowSideMessage("Join main game to run it")
    return
end

local url = DISPATCH[pid]
if not url then return end

loadstring(game:HttpGet(url))()
