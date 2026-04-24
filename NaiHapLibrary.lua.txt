local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local Runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local mouse = plr:GetMouse()
local TweenService = game:GetService("TweenService")
local NightHubScreen = Instance.new("ScreenGui")
NightHubScreen.Name = "Night Hub Screen"
NightHubScreen.Parent = game.Players.LocalPlayer.PlayerGui
local NightLib = {}

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	uis.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function NightLib:Notify(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Notify"
    Configs.Description = Configs.Description or "Description"
    Configs.Time = Configs.Time or 5

    spawn(function()
        local Notify = Instance.new("Frame")
        local UICorner_18 = Instance.new("UICorner")
        local Title_5 = Instance.new("TextLabel")
        local UIPadding_20 = Instance.new("UIPadding")
        local Description_4 = Instance.new("TextLabel")
        local UIPadding_21 = Instance.new("UIPadding")

        Notify.Name = "Notify"
        Notify.Parent = NightHubScreen
        Notify.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Notify.BackgroundTransparency = 0.200
        Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Notify.BorderSizePixel = 0
        Notify.Position = UDim2.new(1.707564592, 0, 0.815789461, 0)
        Notify.Size = UDim2.new(0, 304, 0, 58)

        UICorner_18.CornerRadius = UDim.new(0, 4)
        UICorner_18.Parent = Notify

        Title_5.Name = "Title"
        Title_5.Parent = Notify
        Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_5.BackgroundTransparency = 1.000
        Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title_5.BorderSizePixel = 0
        Title_5.Size = UDim2.new(1, 0, 0.0862068981, 16)
        Title_5.Font = Enum.Font.GothamBold
        Title_5.Text = Configs.Title
        Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title_5.TextSize = 12.000
        Title_5.TextXAlignment = Enum.TextXAlignment.Left

        UIPadding_20.Parent = Title_5
        UIPadding_20.PaddingLeft = UDim.new(0, 6)
        UIPadding_20.PaddingTop = UDim.new(0, 3)

        Description_4.Name = "Description"
        Description_4.Parent = Notify
        Description_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Description_4.BackgroundTransparency = 1.000
        Description_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Description_4.BorderSizePixel = 0
        Description_4.Position = UDim2.new(0, 0, 0.362068951, 0)
        Description_4.Size = UDim2.new(0, 304, 0, 37)
        Description_4.Font = Enum.Font.GothamBold
        Description_4.Text = Configs.Description
        Description_4.TextColor3 = Color3.fromRGB(100, 100, 100)
        Description_4.TextSize = 10.000
        Description_4.TextWrapped = true
        Description_4.TextXAlignment = Enum.TextXAlignment.Left
        Description_4.TextYAlignment = Enum.TextYAlignment.Top

        UIPadding_21.Parent = Description_4
        UIPadding_21.PaddingLeft = UDim.new(0, 6)
        UIPadding_21.PaddingTop = UDim.new(0, 3)

        TweenService:Create(Notify,TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.707564592, 0, 0.815789461, 0)}):Play()
        task.wait(tonumber(Configs.Time))
        TweenService:Create(Notify,TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(2, 0, 0.856, 0)}):Play() 
        task.wait(tonumber(Configs.Time) / 2)
        Notify.Visible = false
        task.wait(tonumber(Configs.Time) / 2)
        Notify:Destroy()
    end)
end

function NightLib:CreateWindow(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Night Hub"
    Configs.Cre = Configs.Cre or "! Nightx"

    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local NameHub = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local MiniSized = Instance.new("TextButton")
    local LogoMiniSized = Instance.new("ImageLabel")
    local CloseLib = Instance.new("TextButton")
    local LogoCLoseLib = Instance.new("ImageLabel")
    local TabHolder = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local ScrollingTab = Instance.new("ScrollingFrame")
    local UIPadding_2 = Instance.new("UIPadding")
    local UIListLayout = Instance.new("UIListLayout")
    local CloseOpen = Instance.new("ImageButton")
    local UICorner_12 = Instance.new("UICorner")
    local DropShadowHolder = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")
    local ChannelContainer = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local Sure = Instance.new("Frame")
    local UICorner_19 = Instance.new("UICorner")
    local Tieudereal = Instance.new("TextLabel")
    local Tieude = Instance.new("UIPadding")
    local Yes = Instance.new("TextButton")
    local UICorner_20 = Instance.new("UICorner")
    local No = Instance.new("TextButton")
    local UICorner_21 = Instance.new("UICorner")
    local Desc = Instance.new("TextLabel")
    local plr = game.Players.LocalPlayer
    local Logo = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local heheheh = Instance.new("Frame")

    heheheh.Name = "heheheh"
    heheheh.Parent = NightHubScreen
    heheheh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    heheheh.BorderColor3 = Color3.fromRGB(0, 0, 0)
    heheheh.BorderSizePixel = 0
    heheheh.Size = UDim2.new(1, 0, 1, 0)
    heheheh.Visible = false

    Logo.Name = "Logo"
    Logo.Parent = NightHubScreen
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.981549799, 0, 0.959514141, 0)
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Image = "rbxassetid://17717048927"

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Logo

    TweenService:Create(Logo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 100, 0, 100)}):Play()
    TweenService:Create(Logo, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 1800}):Play()
    TweenService:Create(Logo, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.273985237, 0, 0.127530366, 0)}):Play()
    wait(2)
    TweenService:Create(Logo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    TweenService:Create(Logo, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000}):Play()
    TweenService:Create(Logo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 598, 0, 376)}):Play()
    wait(2)
    Logo.Visible = false
    TweenService:Create(Main, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Visible = true}):Play()

    Sure.Name = "Sure?"
    Sure.Parent = NightHubScreen
    Sure.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Sure.BackgroundTransparency = 0.100
    Sure.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Sure.BorderSizePixel = 0
    Sure.Position = UDim2.new(0.376383752, 0, 0.26720649, 0)
    Sure.Size = UDim2.new(0, 394, 0, 217)
    Sure.Visible = false

    UICorner_19.CornerRadius = UDim.new(0, 4)
    UICorner_19.Parent = Sure

    Tieudereal.Name = "Tieudereal"
    Tieudereal.Parent = Sure
    Tieudereal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tieudereal.BackgroundTransparency = 1.000
    Tieudereal.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tieudereal.BorderSizePixel = 0
    Tieudereal.ClipsDescendants = true
    Tieudereal.Position = UDim2.new(0, 0, 0.0138248848, 0)
    Tieudereal.Size = UDim2.new(1, 0, 0, 50)
    Tieudereal.Font = Enum.Font.GothamBold
    Tieudereal.Text = "Do You Want Close Interface?"
    Tieudereal.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tieudereal.TextSize = 18.000
    Tieudereal.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

    Tieude.Name = "Tieude"
    Tieude.Parent = Tieudereal
    Tieude.PaddingLeft = UDim.new(0, 7)

    Yes.Name = "Yes"
    Yes.Parent = Sure
    Yes.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Yes.BackgroundTransparency = 0.200
    Yes.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Yes.BorderSizePixel = 0
    Yes.Position = UDim2.new(0, 0, 0.663594484, 0)
    Yes.Size = UDim2.new(0, 180, 0, 50)
    Yes.Font = Enum.Font.GothamBold
    Yes.Text = "YES"
    Yes.TextColor3 = Color3.fromRGB(255, 255, 255)
    Yes.TextSize = 14.000
    Yes.MouseButton1Click:Connect(function()
        TweenService:Create(Sure, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Visible = false}):Play()
        NightHubScreen.Enabled = false
        NightLib:Notify({Title = "Interface", Content = "Close Interface Completed!!!", Time = 5})
    end)

    UICorner_20.Parent = Yes

    No.Name = "No"
    No.Parent = Sure
    No.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    No.BackgroundTransparency = 0.200
    No.BorderColor3 = Color3.fromRGB(0, 0, 0)
    No.BorderSizePixel = 0
    No.Position = UDim2.new(0.543147206, 0, 0.663594484, 0)
    No.Size = UDim2.new(0, 180, 0, 50)
    No.Font = Enum.Font.GothamBold
    No.Text = "NO"
    No.TextColor3 = Color3.fromRGB(255, 255, 255)
    No.TextSize = 14.000
    No.MouseButton1Click:Connect(function()
        TweenService:Create(Sure, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Visible = false}):Play()
        Main.Visible = true
    end)

    UICorner_21.Parent = No

    Desc.Name = "Desc"
    Desc.Parent = Sure
    Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Desc.BackgroundTransparency = 1.000
    Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Desc.BorderSizePixel = 0
    Desc.Position = UDim2.new(0, 0, 0.23963134, 0)
    Desc.Size = UDim2.new(0, 394, 0, 81)
    Desc.Font = Enum.Font.GothamBold
    Desc.Text = "They Will Disable Screen GUI To Close Interface!!"
    Desc.TextColor3 = Color3.fromRGB(100, 100, 100)
    Desc.TextSize = 10.000

    Main.Name = "Main"
    Main.Parent = NightHubScreen
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BackgroundTransparency = 0.200
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.273985237, 0, 0.127530366, 0)
    Main.Size = UDim2.new(0, 598, 0, 376)
    Main.Visible = false

    CloseOpen.Name = "CloseOpen"
    CloseOpen.Parent = NightHubScreen
    CloseOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseOpen.BackgroundTransparency = 1.000
    CloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Position = UDim2.new(0.00696864119, 0, 0.457489878, 0)
    CloseOpen.Size = UDim2.new(0, 35, 0, 35)
    CloseOpen.Image = "rbxassetid://17717048927"
    CloseOpen.MouseButton1Click:Connect(function()
        if ReadyClose == true then
            TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 598, 0, 376)}):Play()
            wait(1)
            Top.Visible = true
            TabHolder.Visible = true
            ChannelContainer.Visible = true
            DropShadow.Visible = true
            ReadyClose = false
        end
    end)

    UICorner_12.Parent = CloseOpen

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Top.BackgroundTransparency = 0.500
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, 0.00231884886, 40)

    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = Top

    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Position = UDim2.new(0, 0, 1.87165128e-07, 0)
    NameHub.Size = UDim2.new(1.00167501, 0, 0.0213322397, 40)
    NameHub.Font = Enum.Font.GothamBold
    NameHub.Text = "" .. Configs.Title .. " By - " .. Configs.Cre .. ""
    NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.TextSize = 14.000
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = NameHub
    UIPadding.PaddingLeft = UDim.new(0, 12)

    MiniSized.Name = "Mini Sized"
    MiniSized.Parent = Top
    MiniSized.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MiniSized.BackgroundTransparency = 1.000
    MiniSized.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MiniSized.BorderSizePixel = 0
    MiniSized.Position = UDim2.new(0.854755521, 0, 0, 0)
    MiniSized.Size = UDim2.new(0, 40, 0, 40)
    MiniSized.Font = Enum.Font.SourceSansBold
    MiniSized.Text = ""
    MiniSized.TextColor3 = Color3.fromRGB(0, 0, 0)
    MiniSized.TextSize = 14.000
    MiniSized.MouseButton1Click:Connect(function()
        Top.Visible = false
        TabHolder.Visible = false
        ChannelContainer.Visible = false
        DropShadow.Visible = false
        ReadyClose = true
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 376)}):Play()
    end)

    LogoMiniSized.Name = "Logo Mini Sized"
    LogoMiniSized.Parent = MiniSized
    LogoMiniSized.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoMiniSized.BackgroundTransparency = 1.000
    LogoMiniSized.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LogoMiniSized.BorderSizePixel = 0
    LogoMiniSized.Position = UDim2.new(0.25, 0, 0.25, 0)
    LogoMiniSized.Size = UDim2.new(0, 20, 0, 20)
    LogoMiniSized.Image = "rbxassetid://17585149799"

    CloseLib.Name = "Close Lib"
    CloseLib.Parent = Top
    CloseLib.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    CloseLib.BackgroundTransparency = 1.000
    CloseLib.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseLib.BorderSizePixel = 0
    CloseLib.Position = UDim2.new(0.931550026, 0, 0, 0)
    CloseLib.Size = UDim2.new(0, 40, 0, 40)
    CloseLib.Font = Enum.Font.SourceSansBold
    CloseLib.Text = ""
    CloseLib.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseLib.TextSize = 14.000
    CloseLib.MouseButton1Click:Connect(function()
        Main.Visible = false
        TweenService:Create(Sure, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Visible = true}):Play()
    end)

    LogoCLoseLib.Name = "Logo CLose Lib"
    LogoCLoseLib.Parent = CloseLib
    LogoCLoseLib.BackgroundTransparency = 1.000
    LogoCLoseLib.Position = UDim2.new(0.174999997, 0, 0.174999997, 0)
    LogoCLoseLib.Size = UDim2.new(0, 25, 0, 25)
    LogoCLoseLib.Image = "rbxassetid://2777727756"

    TabHolder.Name = "Tab Holder"
    TabHolder.Parent = Main
    TabHolder.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    TabHolder.BackgroundTransparency = 0.500
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0, 0, 0.108701825, 0)
    TabHolder.Size = UDim2.new(0, 165, 0, 334)

    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = TabHolder

    ScrollingTab.Name = "Scrolling Tab"
    ScrollingTab.Parent = TabHolder
    ScrollingTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingTab.BackgroundTransparency = 1.000
    ScrollingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingTab.BorderSizePixel = 0
    ScrollingTab.Selectable = false
    ScrollingTab.Size = UDim2.new(1, 0, 1, 0)
    ScrollingTab.ScrollBarThickness = 0
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            ScrollingTab.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
        end)
    end)

    UIPadding_2.Parent = ScrollingTab
    UIPadding_2.PaddingBottom = UDim.new(0, 2)
    UIPadding_2.PaddingTop = UDim.new(0, 2)

    UIListLayout.Parent = ScrollingTab
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    DropShadowHolder.Name = "DropShadowHolder"
    DropShadowHolder.Parent = Main
    DropShadowHolder.BackgroundTransparency = 1.000
    DropShadowHolder.BorderSizePixel = 0
    DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
    DropShadowHolder.ZIndex = 0

    DropShadow.Name = "DropShadow"
    DropShadow.Parent = DropShadowHolder
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1.000
    DropShadow.BorderSizePixel = 0
    DropShadow.Position = UDim2.new(0.498327762, 0, 0.501329839, 0)
    DropShadow.Size = UDim2.new(1.0133779, 47, 1.01329792, 47)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://6014261993"
    DropShadow.ImageTransparency = 0.500
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    ChannelContainer.Name = "Channel Container"
    ChannelContainer.Parent = Main
    ChannelContainer.AnchorPoint = Vector2.new(1, 0)
    ChannelContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ChannelContainer.BackgroundTransparency = 0.500
    ChannelContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChannelContainer.BorderSizePixel = 0
    ChannelContainer.Position = UDim2.new(0.998327732, 0, 0.108701825, 0)
    ChannelContainer.Size = UDim2.new(0, 432, 0, 335)

    UICorner_5.CornerRadius = UDim.new(0, 4)
    UICorner_5.Parent = ChannelContainer

    MakeDraggable(Top, Main)

    local TabContent = {}
    function TabContent:CreateTab(Configs)
        Configs = Configs or {}
        Configs.Name = Configs.Name or "Tab"
        Configs.Icon = Configs.Icon or ""

        local tab = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")
        local UIPadding_3 = Instance.new("UIPadding")
        local IcoTab = Instance.new("ImageLabel")
        local Channel = Instance.new("ScrollingFrame")
        local UIPadding_4 = Instance.new("UIPadding")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local defaults = false
        local NameT = ""

        tab.Name = "tab"
        tab.Parent = ScrollingTab
        tab.BackgroundColor3 = Color3.fromRGB(5, 255, 255)
        tab.BackgroundTransparency = 1.000
        tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        tab.BorderSizePixel = 0
        tab.ClipsDescendants = true
        tab.Position = UDim2.new(0, 0, -0.00606060587, 0)
        tab.Size = UDim2.new(1, 0, 0, 35)
        tab.Font = Enum.Font.GothamBold
        tab.Text = Configs.Name
        tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.TextSize = 14.000
        tab.TextXAlignment = Enum.TextXAlignment.Left

        UICorner_4.CornerRadius = UDim.new(0, 4)
        UICorner_4.Parent = tab

        UIPadding_3.Parent = tab
        UIPadding_3.PaddingLeft = UDim.new(0, 40)
        UIPadding_3.PaddingTop = UDim.new(0, 3)

        IcoTab.Name = "IcoTab"
        IcoTab.Parent = tab
        IcoTab.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
        IcoTab.BackgroundTransparency = 1.000
        IcoTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        IcoTab.BorderSizePixel = 0
        IcoTab.Position = UDim2.new(-0.265, 0,0.041, 0)
        IcoTab.Size = UDim2.new(0, 25, 0, 25)
        IcoTab.ImageColor3 = Color3.fromRGB(144, 144, 144)
        IcoTab.Image = Configs.Icon

        Channel.Name = "Channel"
        Channel.Parent = ChannelContainer
        Channel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Channel.BackgroundTransparency = 1.000
        Channel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Channel.BorderSizePixel = 0
        Channel.Selectable = false
        Channel.Size = UDim2.new(1, 0, 1, 0)
        Channel.ScrollBarThickness = 1
        Channel.Visible = false
        spawn(function()
            while wait() do
                Channel.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y + 20)
            end
        end)

        UIPadding_4.Parent = Channel
        UIPadding_4.PaddingBottom = UDim.new(0, 4)
        UIPadding_4.PaddingLeft = UDim.new(0, 4)
        UIPadding_4.PaddingRight = UDim.new(0, 4)
        UIPadding_4.PaddingTop = UDim.new(0, 4)

        UIListLayout_2.Parent = Channel
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 4)

        tab.MouseEnter:Connect(function()
            if NameT ~= tab.Name then
                tab.TextColor3 = Color3.fromRGB(255,255,255)
                IcoTab.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
        end)
        
        tab.MouseLeave:Connect(function()
            if NameT ~= tab.Name then
                tab.TextColor3 = Color3.fromRGB(114, 118, 125)
                IcoTab.ImageColor3 = Color3.fromRGB(144, 144, 144)
            end
        end)   

        tab.MouseButton1Click:Connect(function()
            for i, v in next, ChannelContainer:GetChildren() do
                if v.Name == "Channel" then
                    v.Visible = false
                end
                Channel.Visible = true
            end
            for i, v in next, ScrollingTab:GetChildren() do
                if v.ClassName == "TextButton" then
                    v.TextColor3 = Color3.fromRGB(144, 144, 144)
                    v.BackgroundTransparency = 1.000
                end
            end
            tab.TextColor3 = Color3.fromRGB(255,255,255)
            tab.BackgroundColor3 = Color3.fromRGB(5, 255, 255)
            tab.BackgroundTransparency = 0.800
            NameT = tab.Name
        end)
        
        if defaults == false then
            defaults = true
            tab.TextColor3 = Color3.fromRGB(144,144,144)
            ChannelContainer.Visible = true
            Channel.Visible = false
        end

        local InTab = {}
        function InTab:CreateSection(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or {}

            local Section = Instance.new("TextLabel")
            local UIPadding_5 = Instance.new("UIPadding")

            Section.Name = "Section"
            Section.Parent = Channel
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 25)
            Section.Font = Enum.Font.GothamBold
            Section.Text = Configs.Text
            Section.TextColor3 = Color3.fromRGB(255, 255, 255)
            Section.TextSize = 12.000
            Section.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_5.Parent = Section
            UIPadding_5.PaddingLeft = UDim.new(0, 5)
        end

        function InTab:CreateLabel(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Label"

            local Label = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local LabelTitle = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")
            local Lbel = {}

            Label.Name = "Label"
            Label.Parent = Channel
            Label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Label.BackgroundTransparency = 0.500
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0, 0, 0.0886850134, 0)
            Label.Size = UDim2.new(1, 0, -0.0275229365, 45)

            UICorner_6.CornerRadius = UDim.new(0, 4)
            UICorner_6.Parent = Label

            LabelTitle.Name = "LabelTitle"
            LabelTitle.Parent = Label
            LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.BackgroundTransparency = 1.000
            LabelTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelTitle.BorderSizePixel = 0
            LabelTitle.Size = UDim2.new(1, 0, 1, 0)
            LabelTitle.Font = Enum.Font.GothamBold
            LabelTitle.Text = Configs.Text
            LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.TextSize = 12.000
            LabelTitle.TextWrapped = true
            LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_6.Parent = LabelTitle
            UIPadding_6.PaddingLeft = UDim.new(0, 5)

            function Lbel:Set(Text)
                LabelTitle.Text = Text
            end
            return Lbel
        end

        function InTab:CreateButton(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Button"
            Configs.Description = Configs.Description or ""
            Configs.CallBack = Configs.CallBack or function() end
            
            local Button = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local ButtonClick = Instance.new("TextButton")
            local UIPadding_7 = Instance.new("UIPadding")
            local Title = Instance.new("TextLabel")
            local UIPadding_8 = Instance.new("UIPadding")
            local Description = Instance.new("TextLabel")
            local UIPadding_9 = Instance.new("UIPadding")
            local Ico = Instance.new("ImageLabel")

            Button.Name = "Button"
            Button.Parent = Channel
            Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Button.BackgroundTransparency = 0.500
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 45)

            UICorner_7.CornerRadius = UDim.new(0, 4)
            UICorner_7.Parent = Button

            ButtonClick.Name = "ButtonClick"
            ButtonClick.Parent = Button
            ButtonClick.Active = false
            ButtonClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonClick.BackgroundTransparency = 1.000
            ButtonClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonClick.BorderSizePixel = 0
            ButtonClick.Selectable = false
            ButtonClick.Size = UDim2.new(1, 0, 1, 0)
            ButtonClick.Font = Enum.Font.GothamBold
            ButtonClick.Text = ""
            ButtonClick.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonClick.TextSize = 12.000
            ButtonClick.TextWrapped = true
            ButtonClick.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_7.Parent = ButtonClick
            UIPadding_7.PaddingLeft = UDim.new(0, 5)

            Title.Name = "Title"
            Title.Parent = ButtonClick
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.Position = UDim2.new(0, -5, 0, 3)
            Title.Size = UDim2.new(0.926014304, 0, 0, 16)
            Title.Font = Enum.Font.GothamBold
            Title.Text = Configs.Name
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 12.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_8.Parent = Title
            UIPadding_8.PaddingLeft = UDim.new(0, 5)

            Description.Name = "Description"
            Description.Parent = ButtonClick
            Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description.BackgroundTransparency = 1.000
            Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description.BorderSizePixel = 0
            Description.Position = UDim2.new(0, -5, 0, 18)
            Description.Size = UDim2.new(0.909307897, 0, 0, 26)
            Description.Font = Enum.Font.GothamBold
            Description.Text = Configs.Description
            Description.TextColor3 = Color3.fromRGB(100, 100, 100)
            Description.TextSize = 10.000
            Description.TextWrapped = true
            Description.TextXAlignment = Enum.TextXAlignment.Left
            Description.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_9.Parent = Description
            UIPadding_9.PaddingLeft = UDim.new(0, 5)
            UIPadding_9.PaddingTop = UDim.new(0, 4)

            Ico.Name = "Ico"
            Ico.Parent = ButtonClick
            Ico.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Ico.BackgroundTransparency = 1.000
            Ico.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Ico.BorderSizePixel = 0
            Ico.Position = UDim2.new(1, -30, 0, 11)
            Ico.Size = UDim2.new(0, 20, 0, 20)
            Ico.Image = "rbxassetid://17584910789"

            ButtonClick.MouseButton1Click:Connect(function()
                pcall(Configs.CallBack)
                Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                TweenService:Create(Button, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            end)
        end
        function InTab:CreateToggle(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Toggle"
            Configs.Description = Configs.Description or ""
            Configs.Default = Configs.Default or false
            Configs.CallBack = Configs.CallBack or function() end

            local Toggle = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local ToggleClick = Instance.new("TextButton")
            local UIPadding_10 = Instance.new("UIPadding")
            local Title_2 = Instance.new("TextLabel")
            local UIPadding_11 = Instance.new("UIPadding")
            local Description_2 = Instance.new("TextLabel")
            local UIPadding_12 = Instance.new("UIPadding")
            local CheckFrame = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")
            local Check = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local Tggle = {}
            Toggled = false

            Toggle.Name = "Toggle"
            Toggle.Parent = Channel
            Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Toggle.BackgroundTransparency = 0.500
            Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.BorderSizePixel = 0
            Toggle.Size = UDim2.new(1, 0, 0, 45)

            UICorner_8.CornerRadius = UDim.new(0, 4)
            UICorner_8.Parent = Toggle

            ToggleClick.Name = "ToggleClick"
            ToggleClick.Parent = Toggle
            ToggleClick.Active = false
            ToggleClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleClick.BackgroundTransparency = 1.000
            ToggleClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.BorderSizePixel = 0
            ToggleClick.Selectable = false
            ToggleClick.Size = UDim2.new(1, 0, 1, 0)
            ToggleClick.Font = Enum.Font.GothamBold
            ToggleClick.Text = ""
            ToggleClick.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleClick.TextSize = 12.000
            ToggleClick.TextWrapped = true
            ToggleClick.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_10.Parent = ToggleClick
            UIPadding_10.PaddingLeft = UDim.new(0, 5)

            Title_2.Name = "Title"
            Title_2.Parent = ToggleClick
            Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.BackgroundTransparency = 1.000
            Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_2.BorderSizePixel = 0
            Title_2.Position = UDim2.new(0, -5, 0, 3)
            Title_2.Size = UDim2.new(0.926014304, 0, 0, 16)
            Title_2.Font = Enum.Font.GothamBold
            Title_2.Text = Configs.Name
            Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.TextSize = 12.000
            Title_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_11.Parent = Title_2
            UIPadding_11.PaddingLeft = UDim.new(0, 5)

            Description_2.Name = "Description"
            Description_2.Parent = ToggleClick
            Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description_2.BackgroundTransparency = 1.000
            Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description_2.BorderSizePixel = 0
            Description_2.Position = UDim2.new(0, -5, 0, 18)
            Description_2.Size = UDim2.new(0.909307897, 0, 0, 26)
            Description_2.Font = Enum.Font.GothamBold
            Description_2.Text = Configs.Description
            Description_2.TextColor3 = Color3.fromRGB(100, 100, 100)
            Description_2.TextSize = 10.000
            Description_2.TextWrapped = true
            Description_2.TextXAlignment = Enum.TextXAlignment.Left
            Description_2.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_12.Parent = Description_2
            UIPadding_12.PaddingLeft = UDim.new(0, 5)
            UIPadding_12.PaddingTop = UDim.new(0, 4)

            CheckFrame.Name = "CheckFrame"
            CheckFrame.Parent = ToggleClick
            CheckFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            CheckFrame.BackgroundTransparency = 0.500
            CheckFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CheckFrame.BorderSizePixel = 0
            CheckFrame.Position = UDim2.new(0.968973756, -30, 0.111111112, 11)
            CheckFrame.Size = UDim2.new(0, 31, 0, 13)

            UICorner_9.CornerRadius = UDim.new(1, 0)
            UICorner_9.Parent = CheckFrame

            Check.Name = "Check"
            Check.Parent = CheckFrame
            Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Check.BorderSizePixel = 0
            Check.Position = UDim2.new(-0.268292695, 0, -0.307692319, 0)
            Check.Size = UDim2.new(0, 20, 0, 20)

            UICorner_10.CornerRadius = UDim.new(1, 0)
            UICorner_10.Parent = Check

            ToggleClick.MouseButton1Click:Connect(function()
                if Toggled == false then
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.506, 0,-0.308, 0)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                else
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-0.268, 0,-0.308, 0)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                end
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end)
            
            if Configs.Default == true then
                TweenService:Create(Check, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.506, 0,-0.308, 0)}):Play()
                TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                Toggled = Configs.Default
                pcall(Configs.CallBack, Toggled)
            end

            function Tggle:Set(Value)
                if Value then
                    TweenService:Create(Check, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new({-0.268, 0},{-0.308, 0})}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                else
                    TweenService:Create(Check, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.506, 0,-0.308, 0)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                end       
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end
            return Tggle
        end
        function InTab:CreateDropdown(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Dropdown"
            Configs.Description = Configs.Description or ""
            Configs.Options = Configs.Options or ""
            Configs.Default = Configs.Default or ""
            Configs.CallBack = Configs.CallBack or function() end

            local Dropdown = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local DropdownClick = Instance.new("TextButton")
            local UIPadding_13 = Instance.new("UIPadding")
            local Title_3 = Instance.new("TextLabel")
            local UIPadding_14 = Instance.new("UIPadding")
            local Description_3 = Instance.new("TextLabel")
            local UIPadding_15 = Instance.new("UIPadding")
            local Ico_2 = Instance.new("ImageLabel")
            local ListFrame = Instance.new("Frame")
            local UICorner_11 = Instance.new("UICorner")
            local List = Instance.new("ScrollingFrame")
            local UIPadding_16 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local DropFunc = {}
            Dropped = false

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Channel
            Dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Dropdown.BackgroundTransparency = 0.500
            Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 0, 0.510703385, 0)
            Dropdown.Size = UDim2.new(1, 0, 0, 45)

            UICorner_10.CornerRadius = UDim.new(0, 4)
            UICorner_10.Parent = Dropdown

            DropdownClick.Name = "DropdownClick"
            DropdownClick.Parent = Dropdown
            DropdownClick.Active = false
            DropdownClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownClick.BackgroundTransparency = 1.000
            DropdownClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DropdownClick.BorderSizePixel = 0
            DropdownClick.Selectable = false
            DropdownClick.Size = UDim2.new(1, 0, 1, 0)
            DropdownClick.Font = Enum.Font.GothamBold
            DropdownClick.Text = ""
            DropdownClick.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownClick.TextSize = 12.000
            DropdownClick.TextWrapped = true
            DropdownClick.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_13.Parent = DropdownClick
            UIPadding_13.PaddingLeft = UDim.new(0, 5)

            Title_3.Name = "Title"
            Title_3.Parent = DropdownClick
            Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.BackgroundTransparency = 1.000
            Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_3.BorderSizePixel = 0
            Title_3.Position = UDim2.new(0, -5, 0, 3)
            Title_3.Size = UDim2.new(0.926014304, 0, 0, 16)
            Title_3.Font = Enum.Font.GothamBold
            Title_3.Text = "".. Configs.Name .. " : ".. Configs.Default .. ""
            Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.TextSize = 12.000
            Title_3.TextXAlignment = Enum.TextXAlignment.Left
            if Configs.Default ~= "" and Configs.Default ~= nil then
                Configs.CallBack(Configs.Default)
            end

            UIPadding_14.Parent = Title_3
            UIPadding_14.PaddingLeft = UDim.new(0, 5)

            Description_3.Name = "Description"
            Description_3.Parent = DropdownClick
            Description_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description_3.BackgroundTransparency = 1.000
            Description_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description_3.BorderSizePixel = 0
            Description_3.Position = UDim2.new(0, -5, 0, 18)
            Description_3.Size = UDim2.new(0.909307897, 0, 0, 26)
            Description_3.Font = Enum.Font.GothamBold
            Description_3.Text = Configs.Description
            Description_3.TextColor3 = Color3.fromRGB(100, 100, 100)
            Description_3.TextSize = 10.000
            Description_3.TextWrapped = true
            Description_3.TextXAlignment = Enum.TextXAlignment.Left
            Description_3.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_15.Parent = Description_3
            UIPadding_15.PaddingLeft = UDim.new(0, 5)
            UIPadding_15.PaddingTop = UDim.new(0, 4)

            Ico_2.Name = "Ico"
            Ico_2.Parent = DropdownClick
            Ico_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Ico_2.BackgroundTransparency = 1.000
            Ico_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Ico_2.BorderSizePixel = 0
            Ico_2.Position = UDim2.new(1, -30, 0, 11)
            Ico_2.Size = UDim2.new(0, 20, 0, 20)
            Ico_2.Rotation = -90.000
            Ico_2.Image = "rbxassetid://17584979104"

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = Dropdown
            ListFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            ListFrame.BackgroundTransparency = 0.500
            ListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0, 0, 0.328358203, 0)
            ListFrame.Size = UDim2.new(1, 0, -0.074626863, 100)
            ListFrame.Visible = false

            UICorner_11.CornerRadius = UDim.new(0, 4)
            UICorner_11.Parent = ListFrame

            List.Name = "List"
            List.Parent = ListFrame
            List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            List.BackgroundTransparency = 1.000
            List.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List.BorderSizePixel = 0
            List.Selectable = false
            List.Size = UDim2.new(1, 0, 1, 0)
            List.ScrollBarThickness = 0

            UIPadding_16.Parent = List
            UIPadding_16.PaddingBottom = UDim.new(0, 2)
            UIPadding_16.PaddingLeft = UDim.new(0, 2)
            UIPadding_16.PaddingRight = UDim.new(0, 2)
            UIPadding_16.PaddingTop = UDim.new(0, 7)

            UIListLayout_3.Parent = List
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 4)

            spawn(function()
                while wait() do
                    List.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y)
                end
            end)

            for i, v in next, Configs.Options do
                local Option1 = Instance.new("TextButton")
                local UICorner_13 = Instance.new("UICorner")

                Option1.Name = "Option1"
                Option1.Parent = List
                Option1.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                Option1.BackgroundTransparency = 1.000
                Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Option1.BorderSizePixel = 0
                Option1.Size = UDim2.new(1, 0, 0, 30)
                Option1.Font = Enum.Font.GothamBold
                Option1.Text = tostring(v)
                Option1.TextColor3 = Color3.fromRGB(144, 144, 144)
                Option1.TextSize = 14.000

                UICorner_13.CornerRadius = UDim.new(0, 4)
                UICorner_13.Parent = Option1

                Option1.MouseButton1Click:Connect(function()
                    Dropped = false
                    ListFrame.Visible = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 45),"Out","Quad",0.3,true)
                    TweenService:Create(Ico_2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                    pcall(Option1.Text)
                    Configs.CallBack(Option1.Text)
                    Title_3.Text = "".. Configs.Name .. " : " .. Option1.Text .. ""
                end)
            end

            DropdownClick.MouseButton1Click:Connect(function()
                if Dropped == false then
                    Dropped = true
                    Dropdown:TweenSize(UDim2.new(1, 0, 0.134, 45),"Out","Quad",0.3,true)
                    TweenService:Create(Ico_2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    wait(0.2)
                    ListFrame.Visible = true
                else
                    Dropped = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 45),"Out","Quad",0.3,true)
                    TweenService:Create(Ico_2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    ListFrame.Visible = false
                end
            end)

            function DropFunc:Set(OptionName)
                for i, v in pairs(List:GetChildren()) do
                    if v.ClassName == "Button" then
                        if v.Name == OptionName then
                            v.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Title_3.Text = "".. Configs.Name .. " : " .. OptionName .. ""
                            pcall(Title_3.Text)
                        end
                    end
                end
            end

            function DropFunc:Add(Option)
                for i, v in next, Option do
                    local Nahvaicaicut = Instance.new("TextButton")

                    Nahvaicaicut.Name = "Option1"
                    Nahvaicaicut.Parent = List
                    Nahvaicaicut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Nahvaicaicut.BackgroundTransparency = 1.000
                    Nahvaicaicut.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Nahvaicaicut.BorderSizePixel = 0
                    Nahvaicaicut.ClipsDescendants = true
                    Nahvaicaicut.Size = UDim2.new(1, 0, 0, 25)
                    Nahvaicaicut.Font = Enum.Font.GothamBold
                    Nahvaicaicut.Text = tostring(v)
                    Nahvaicaicut.TextColor3 = Color3.fromRGB(144, 144, 144)
                    Nahvaicaicut.TextSize = 14.000

                    Nahvaicaicut.MouseButton1Click:Connect(function()
                        Dropped = false
                        ListFrame.Visible = false
                        Dropdown:TweenSize(UDim2.new(1, 0, 0, 55),"Out","Quad",0.3,true)
                        TweenService:Create(
                            ListFrame,
                            TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {
                                Visible = false
                            }
                        ):Play()
                        TweenService:Create(
                            Ico_2,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                            {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                        Nahvaicaicut.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Configs.CallBack(Nahvaicaicut.Text)
                        Title_3.Text = "".. Configs.Name .. " : ".. Nahvaicaicut.Text .. ""
                    end)
                end
            end

            function DropFunc:Refresh(Option)
                for i, v in pairs(List:GetChildren()) do
                    if v.Name == "Option1" then
                        v:Destroy()
                    end
                end
                Dropped = false
                Dropdown:TweenSize(UDim2.new(1, 0, 0, 55),"Out","Quad",0.3,true)
                TweenService:Create(
                    ListFrame,
                    TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Visible = false
                    }
                ):Play()
                TweenService:Create(
                    Ico_2,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                ):Play()
                DropFunc:Add(Option)
                Title_3.Text = "".. Configs.Name .. " : "
			end
            return DropFunc
        end
        function InTab:CreateSlider(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Slider"
            Configs.Max = Configs.Max or 100
            Configs.Min = Configs.Min or 1
            Configs.Default = Configs.Default or 50
            Configs.CallBack = Configs.CallBack or function() end

            local Slider = Instance.new("Frame")
            local UICorner_14 = Instance.new("UICorner")
            local Title_4 = Instance.new("TextLabel")
            local UIPadding_17 = Instance.new("UIPadding")
            local DragFrame = Instance.new("Frame")
            local UICorner_15 = Instance.new("UICorner")
            local Frame = Instance.new("Frame")
            local UICorner_16 = Instance.new("UICorner")
            local Valie = Instance.new("TextLabel")
            local SliderFunc = {Value = Configs.Default}

            Slider.Name = "Slider"
            Slider.Parent = Channel
            Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Slider.BackgroundTransparency = 0.500
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(1, 0, 0, 46)

            UICorner_14.CornerRadius = UDim.new(0, 4)
            UICorner_14.Parent = Slider

            Title_4.Name = "Title"
            Title_4.Parent = Slider
            Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_4.BackgroundTransparency = 1.000
            Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_4.BorderSizePixel = 0
            Title_4.Position = UDim2.new(0, 0, 0, 3)
            Title_4.Size = UDim2.new(1, 0, 0, 16)
            Title_4.Font = Enum.Font.GothamBold
            Title_4.Text = Configs.Name
            Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_4.TextSize = 12.000
            Title_4.TextWrapped = true
            Title_4.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_17.Parent = Title_4
            UIPadding_17.PaddingLeft = UDim.new(0, 5)

            DragFrame.Name = "DragFrame"
            DragFrame.Parent = Slider
            DragFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            DragFrame.BackgroundTransparency = 0.500
            DragFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DragFrame.BorderSizePixel = 0
            DragFrame.Position = UDim2.new(0, 5, 0.587000012, 0)
            DragFrame.Size = UDim2.new(0, 404, 0, 11)

            UICorner_15.CornerRadius = UDim.new(0, 4)
            UICorner_15.Parent = DragFrame

            Frame.Parent = DragFrame
            Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Frame.BackgroundTransparency = 0.500
            Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(0, 202, 0, 11)

            UICorner_16.CornerRadius = UDim.new(0, 4)
            UICorner_16.Parent = Frame

            Valie.Name = "Valie"
            Valie.Parent = DragFrame
            Valie.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Valie.BackgroundTransparency = 1.000
            Valie.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Valie.BorderSizePixel = 0
            Valie.Position = UDim2.new(0.0123762377, 0, 0, 0)
            Valie.Size = UDim2.new(1, 0, 1, 0)
            Valie.Font = Enum.Font.GothamBold
            Valie.Text = tonumber(Configs.Default)
            Valie.TextColor3 = Color3.fromRGB(255, 255, 255)
            Valie.TextSize = 14.000

            local Dragging = false
			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then Result = Result + Factor end
				return Result
			end
			function SliderFunc:Set(Value)
				Value = math.clamp(Round(Value, 1), Configs.Min, Configs.Max)
				SliderFunc.Value = Value
				Valie.Text = tostring(Value)
				TweenService:Create(
					Frame,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - Configs.Min) / (Configs.Max - Configs.Min), 1)}
				):Play()
			end
			Frame.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Frame.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					Configs.CallBack(SliderFunc.Value)
				end 
			end)
			uis.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == EnumTabContent.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(Configs.Min + ((Configs.Max - Configs.Min) * SizeScale)) 
				end
			end)
			Valie:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = Valie.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), Configs.Max)
					Valie.Text = tostring(ValidNumber)
				else
					Valie.Text = tostring(Valid)
				end
			end)
			SliderFunc:Set(tonumber(Configs.Default))
			return SliderFunc       
        end
        function InTab:CreateParagraph(Configs)
            Configs = Configs or {}
            Configs.Title = Configs.Title or "Paragraph"
            Configs.Content = Configs.Content or ""

            local Paragraph = Instance.new("Frame")
            local UICorner_17 = Instance.new("UICorner")
            local ParagraphTitle = Instance.new("TextLabel")
            local UIPadding_18 = Instance.new("UIPadding")
            local Descript = Instance.new("TextLabel")
            local UIPadding_19 = Instance.new("UIPadding")

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = Channel
            Paragraph.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Paragraph.BackgroundTransparency = 0.500
            Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Paragraph.BorderSizePixel = 0
            Paragraph.Position = UDim2.new(0, 0, 0.813455641, 0)
            Paragraph.Size = UDim2.new(1, 0, 0, 45)

            UICorner_17.CornerRadius = UDim.new(0, 4)
            UICorner_17.Parent = Paragraph

            ParagraphTitle.Name = "ParagraphTitle"
            ParagraphTitle.Parent = Paragraph
            ParagraphTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ParagraphTitle.BackgroundTransparency = 1.000
            ParagraphTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ParagraphTitle.BorderSizePixel = 0
            ParagraphTitle.Position = UDim2.new(0, 0, 0, 3)
            ParagraphTitle.Size = UDim2.new(1, 0, 0, 16)
            ParagraphTitle.Font = Enum.Font.GothamBold
            ParagraphTitle.Text = Configs.Title
            ParagraphTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ParagraphTitle.TextSize = 12.000
            ParagraphTitle.TextWrapped = true
            ParagraphTitle.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_18.Parent = ParagraphTitle
            UIPadding_18.PaddingLeft = UDim.new(0, 5)

            Descript.Name = "Descript"
            Descript.Parent = Paragraph
            Descript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Descript.BackgroundTransparency = 1.000
            Descript.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Descript.BorderSizePixel = 0
            Descript.ClipsDescendants = true
            Descript.Position = UDim2.new(0, 0, 0, 19)
            Descript.Size = UDim2.new(0, 423, 0, 24)
            Descript.Font = Enum.Font.GothamBold
            Descript.Text = Configs.Content
            Descript.TextColor3 = Color3.fromRGB(100, 100, 100)
            Descript.TextSize = 10.000
            Descript.TextWrapped = true
            Descript.TextXAlignment = Enum.TextXAlignment.Left
            Descript.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_19.Parent = Descript
            UIPadding_19.PaddingLeft = UDim.new(0, 5)
            UIPadding_19.PaddingTop = UDim.new(0, 4)
            
        end
        function InTab:CreateTextBox(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or ""
            Configs.Description = Configs.Description or ""
            Configs.Default = Configs.Default or ""
            Configs.CallBack = Configs.CallBack or function () end

            local TextBoxhahaha = Instance.new("Frame")
            local UICorner_18 = Instance.new("UICorner")
            local Title_5 = Instance.new("TextLabel")
            local UIPadding_20 = Instance.new("UIPadding")
            local Description_4 = Instance.new("TextLabel")
            local UIPadding_21 = Instance.new("UIPadding")
            local ehehehhe = Instance.new("TextBox")
            local UICorner_19 = Instance.new("UICorner")
            local UIStroke = Instance.new("UIStroke")
            local InputFunc = {}

            TextBoxhahaha.Name = "TextBoxhahaha"
            TextBoxhahaha.Parent = Channel
            TextBoxhahaha.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TextBoxhahaha.BackgroundTransparency = 0.500
            TextBoxhahaha.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBoxhahaha.BorderSizePixel = 0
            TextBoxhahaha.Position = UDim2.new(0.023584906, 0, 0.485565186, 0)
            TextBoxhahaha.Size = UDim2.new(1, 0, 0, 45)

            UICorner_18.CornerRadius = UDim.new(0, 4)
            UICorner_18.Parent = TextBoxhahaha

            Title_5.Name = "Title"
            Title_5.Parent = TextBoxhahaha
            Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.BackgroundTransparency = 1.000
            Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_5.BorderSizePixel = 0
            Title_5.Position = UDim2.new(0, 0, 0, 3)
            Title_5.Size = UDim2.new(0.621962786, 0, 0, 16)
            Title_5.Font = Enum.Font.GothamBold
            Title_5.Text = Configs.Name
            Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.TextSize = 12.000
            Title_5.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_20.Parent = Title_5
            UIPadding_20.PaddingLeft = UDim.new(0, 5)

            Description_4.Name = "Description"
            Description_4.Parent = TextBoxhahaha
            Description_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description_4.BackgroundTransparency = 1.000
            Description_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description_4.BorderSizePixel = 0
            Description_4.Position = UDim2.new(0, 0, 0.422222227, 0)
            Description_4.Size = UDim2.new(0, 263, 0, 26)
            Description_4.Font = Enum.Font.GothamBold
            Description_4.TextColor3 = Color3.fromRGB(100, 100, 100)
            Description_4.TextSize = 10.000
            Description_4.Text = Configs.Description
            Description_4.TextWrapped = true
            Description_4.TextXAlignment = Enum.TextXAlignment.Left
            Description_4.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_21.Parent = Description_4
            UIPadding_21.PaddingLeft = UDim.new(0, 5)
            UIPadding_21.PaddingTop = UDim.new(0, 4)

            ehehehhe.Name = "ehehehhe"
            ehehehhe.Parent = TextBoxhahaha
            ehehehhe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            ehehehhe.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ehehehhe.BorderSizePixel = 0
            ehehehhe.Position = UDim2.new(0.738207519, 0, 0.155555561, 0)
            ehehehhe.Size = UDim2.new(0, 100, 0, 30)
            ehehehhe.Font = Enum.Font.GothamBold
            ehehehhe.ClipsDescendants = true
            ehehehhe.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            ehehehhe.Text = Configs.Default
            ehehehhe.TextColor3 = Color3.fromRGB(255, 255, 255)
            ehehehhe.TextSize = 14.000

            UICorner_19.CornerRadius = UDim.new(0, 4)
            UICorner_19.Parent = ehehehhe

            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke.Color = Color3.fromRGB(150, 150, 150)
            UIStroke.Parent = ehehehhe

            function InputFunc:Set(Value)
				ehehehhe.Text = Value
			end
			ehehehhe.Focused:Connect(function()
			end)
			ehehehhe.FocusLost:Connect(function()
				ehehehhe.Size = UDim2.new(0, 100, 0, 27)
				Configs.CallBack(ehehehhe.Text)
			end)
			return InputFunc
        end

        return InTab
    end

    return TabContent
end
return NightLib