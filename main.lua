if game.PlaceId == 79546208627805 then
  local Players = game:GetService("Players")
  local TweenService = game:GetService("TweenService")
  
  local function ShowSideMessage(msg, opts)
      opts = opts or {}
      local parent = Players.LocalPlayer:WaitForChild("PlayerGui")
      local anchor = opts.anchor or UDim2.new(1, -20, 1, -120)
      local size = opts.size or UDim2.new(0, 260, 0, 48)
      local autoClose = opts.autoCloseSeconds or nil
      local bgColor = opts.bgColor or Color3.fromRGB(28,28,30)
      local accent = opts.accentColor or Color3.fromRGB(85,170,255)
  
      if parent:FindFirstChild("SideMessageBox") then
          parent.SideMessageBox:Destroy()
      end
  
      local screenGui = Instance.new("ScreenGui")
      screenGui.Name = "SideMessageBox"
      screenGui.ResetOnSpawn = false
      screenGui.Parent = parent
  
      local frame = Instance.new("Frame")
      frame.Name = "Container"
      frame.Size = UDim2.new(0, 0, 0, 0)
      frame.Position = anchor
      frame.AnchorPoint = Vector2.new(1, 1)
      frame.BackgroundColor3 = bgColor
      frame.BorderSizePixel = 0
      frame.Parent = screenGui
      frame.ClipsDescendants = true
  
      local uic = Instance.new("UICorner", frame)
      uic.CornerRadius = UDim.new(0, 10)
  
      local stroke = Instance.new("UIStroke", frame)
      stroke.Transparency = 0.85
      stroke.Thickness = 1
  
      local label = Instance.new("TextLabel", frame)
      label.Size = UDim2.new(1, -16, 1, 0)
      label.Position = UDim2.new(0, 8, 0, 0)
      label.BackgroundTransparency = 1
      label.TextXAlignment = Enum.TextXAlignment.Left
      label.TextYAlignment = Enum.TextYAlignment.Center
      label.Font = Enum.Font.GothamSemibold
      label.TextSize = 16
      label.TextColor3 = Color3.fromRGB(240,240,240)
      label.Text = tostring(msg or "Join the main game to run this script")
      label.Parent = frame
  
      local accentBar = Instance.new("Frame", frame)
      accentBar.Size = UDim2.new(0, 6, 1, 0)
      accentBar.Position = UDim2.new(0, 0, 0, 0)
      accentBar.BackgroundColor3 = accent
      local accentCorner = Instance.new("UICorner", accentBar)
      accentCorner.CornerRadius = UDim.new(0, 6)
      TweenService:Create(frame, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
          Size = size
      }):Play()
      coroutine.wrap(function()
          while frame and frame.Parent do
              local t1 = TweenService:Create(accentBar, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.35})
              t1:Play()
              task.wait(1.0)
              if not frame.Parent then break end
          end
      end)()
      frame.InputBegan:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
              local outTween = TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)})
              outTween:Play()
              outTween.Completed:Wait()
              if screenGui and screenGui.Parent then screenGui:Destroy() end
          end
      end)
      if autoClose and type(autoClose) == "number" and autoClose > 0 then
          task.delay(autoClose, function()
              if frame and frame.Parent then
                  local outTween = TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)})
                  outTween:Play()
                  outTween.Completed:Wait()
                  if screenGui and screenGui.Parent then screenGui:Destroy() end
              end
          end)
      end
  
      return screenGui
  end
  ShowSideMessage("Join main game to run it")
elseif game.PlaceId == 126509999114328 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/6506692c3cbf789a"))()
elseif game.PlaceId == 126884695634066 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/aec04dd265c9656e"))()
elseif game.PlaceId == 127742093697776 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/f269d7846cd7a206"))()
elseif game.PlaceId == 9872472334 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/33b2c243da37d519"))()
elseif game.PlaceId == 121864768012064 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/1564eb06c7d8a411"))()
elseif game.PlaceId == 8737899170 or game.PlaceId == 16498369169 or game.PlaceId == 17503543197 or game.PlaceId == 140403681187145 then
  loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/eabe16c077bd48bf"))()
end
