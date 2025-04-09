-- Complete Listcript UI

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Check if UI already exists and remove it
local existingGui = game.CoreGui:FindFirstChild("ListcriptGUI")
if existingGui then
    existingGui:Destroy()
end

-- Create main UI container
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "ListcriptGUI"
MainGui.ResetOnSpawn = false
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MainGui.Parent = game.CoreGui

-- Create a more elegant loading screen
local LoadingGui = Instance.new("Frame")
LoadingGui.Name = "LoadingScreen"
LoadingGui.Size = UDim2.new(1, 0, 1, 0)
LoadingGui.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
LoadingGui.BackgroundTransparency = 0.5
LoadingGui.BorderSizePixel = 0
LoadingGui.Parent = MainGui

-- Create loading container
local LoadingContainer = Instance.new("Frame")
LoadingContainer.Name = "LoadingContainer"
LoadingContainer.Size = UDim2.new(0, 300, 0, 150)
LoadingContainer.Position = UDim2.new(0.5, -150, 0.5, -75)
LoadingContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
LoadingContainer.BorderSizePixel = 0
LoadingContainer.Parent = LoadingGui

-- Add corner radius
local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 15)
LoadingCorner.Parent = LoadingContainer

-- Add loading title
local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Name = "Title"
LoadingTitle.Size = UDim2.new(1, 0, 0, 40)
LoadingTitle.Position = UDim2.new(0, 0, 0, 20)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.Text = "LISTCRIPT"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingTitle.TextSize = 28
LoadingTitle.TextTransparency = 0
LoadingTitle.Parent = LoadingContainer

-- Create loading bar background (thinner and more elegant)
local LoadingBarBg = Instance.new("Frame")
LoadingBarBg.Name = "LoadingBarBg"
LoadingBarBg.Size = UDim2.new(0.8, 0, 0, 6)
LoadingBarBg.Position = UDim2.new(0.1, 0, 0.6, 0)
LoadingBarBg.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
LoadingBarBg.BorderSizePixel = 0
LoadingBarBg.Parent = LoadingContainer

-- Add corner radius to loading bar bg
local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = LoadingBarBg

-- Create the actual loading bar (with gradient)
local LoadingBar = Instance.new("Frame")
LoadingBar.Name = "LoadingBar"
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(130, 100, 255) -- Purple color
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = LoadingBarBg

-- Add corner radius to loading bar
local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = LoadingBar

-- Add gradient to loading bar
local BarGradient = Instance.new("UIGradient")
BarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 120, 255))
})
BarGradient.Parent = LoadingBar

-- Create status text
local StatusText = Instance.new("TextLabel")
StatusText.Name = "Status"
StatusText.Size = UDim2.new(1, 0, 0, 30)
StatusText.Position = UDim2.new(0, 0, 0.8, 0)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.Gotham
StatusText.Text = "Loading..."
StatusText.TextColor3 = Color3.fromRGB(180, 180, 255)
StatusText.TextSize = 16
StatusText.Parent = LoadingContainer

-- Function to update loading bar and text
local function updateLoading(percent, text)
    if LoadingBar then
        LoadingBar:TweenSize(
            UDim2.new(percent/100, 0, 1, 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.3,
            true
        )
    end
    
    if StatusText then
        StatusText.Text = text or "Loading..."
    end
end

-- Create popup bar (instead of L button) - BIGGER and CLEARLY DRAGGABLE
local PopupBar = Instance.new("Frame")
PopupBar.Name = "PopupBar"
PopupBar.Size = UDim2.new(0, 130, 0, 45) -- Bigger size
PopupBar.Position = UDim2.new(0, 20, 0.5, -22.5)
PopupBar.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
PopupBar.BorderSizePixel = 0
PopupBar.Active = true
PopupBar.Draggable = true -- This makes it draggable
PopupBar.Visible = false -- Initially hidden until loading completes
PopupBar.Parent = MainGui

-- Add corner radius to popup bar
local PopupCorner = Instance.new("UICorner")
PopupCorner.CornerRadius = UDim.new(0, 8)
PopupCorner.Parent = PopupBar

-- Add shadow effect to popup bar
local PopupShadow = Instance.new("ImageLabel")
PopupShadow.Name = "Shadow"
PopupShadow.Size = UDim2.new(1.2, 0, 1.2, 0)
PopupShadow.Position = UDim2.new(-0.1, 0, -0.1, 0)
PopupShadow.BackgroundTransparency = 1
PopupShadow.Image = "rbxassetid://5554236805"
PopupShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
PopupShadow.ImageTransparency = 0.6
PopupShadow.ScaleType = Enum.ScaleType.Slice
PopupShadow.SliceCenter = Rect.new(23, 23, 277, 277)
PopupShadow.ZIndex = 0
PopupShadow.Parent = PopupBar

-- Add popup button text (changed to "OPEN")
local PopupText = Instance.new("TextLabel")
PopupText.Name = "PopupText"
PopupText.Size = UDim2.new(1, 0, 1, 0)
PopupText.BackgroundTransparency = 1
PopupText.Font = Enum.Font.GothamBold
PopupText.Text = "OPEN"
PopupText.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupText.TextSize = 18 -- Slightly larger text
PopupText.ZIndex = 2
PopupText.Parent = PopupBar

-- Create a visual handle to indicate draggability
local DragHandle = Instance.new("Frame")
DragHandle.Name = "DragHandle"
DragHandle.Size = UDim2.new(0, 20, 0, 4)
DragHandle.Position = UDim2.new(0.5, -10, 0, 8) 
DragHandle.BackgroundColor3 = Color3.fromRGB(150, 150, 180)
DragHandle.BorderSizePixel = 0
DragHandle.ZIndex = 3
DragHandle.Parent = PopupBar

-- Add corner radius to drag handle
local HandleCorner = Instance.new("UICorner")
HandleCorner.CornerRadius = UDim.new(1, 0)
HandleCorner.Parent = DragHandle

-- Make popup bar clickable
local PopupButton = Instance.new("TextButton")
PopupButton.Name = "PopupButton"
PopupButton.Size = UDim2.new(1, 0, 1, 0)
PopupButton.BackgroundTransparency = 1
PopupButton.Text = ""
PopupButton.ZIndex = 3
PopupButton.Parent = PopupBar

-- Create opening animation container
local OpeningContainer = Instance.new("Frame")
OpeningContainer.Name = "OpeningContainer"
OpeningContainer.Size = UDim2.new(1, 0, 1, 0)
OpeningContainer.BackgroundTransparency = 1
OpeningContainer.Visible = false
OpeningContainer.Parent = MainGui

-- Create opening background
local OpeningBg = Instance.new("Frame")
OpeningBg.Name = "OpeningBg"
OpeningBg.Size = UDim2.new(1, 0, 1, 0)
OpeningBg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
OpeningBg.BackgroundTransparency = 1
OpeningBg.BorderSizePixel = 0
OpeningBg.Parent = OpeningContainer

-- Create opening text container
local OpeningTextContainer = Instance.new("Frame")
OpeningTextContainer.Name = "OpeningTextContainer"
OpeningTextContainer.Size = UDim2.new(0, 200, 0, 80)
OpeningTextContainer.Position = UDim2.new(0.5, -100, 0.5, -40)
OpeningTextContainer.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
OpeningTextContainer.BackgroundTransparency = 1
OpeningTextContainer.BorderSizePixel = 0
OpeningTextContainer.Parent = OpeningContainer

-- Add corner radius
local OpeningCorner = Instance.new("UICorner")
OpeningCorner.CornerRadius = UDim.new(0, 12)
OpeningCorner.Parent = OpeningTextContainer

-- Add opening text
local OpeningText = Instance.new("TextLabel")
OpeningText.Name = "OpeningText"
OpeningText.Size = UDim2.new(1, 0, 1, 0)
OpeningText.BackgroundTransparency = 1
OpeningText.Font = Enum.Font.GothamBold
OpeningText.Text = "OPENING"
OpeningText.TextColor3 = Color3.fromRGB(255, 255, 255)
OpeningText.TextSize = 28
OpeningText.TextTransparency = 1
OpeningText.Parent = OpeningTextContainer

-- Create main frame (initially hidden)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 550)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = MainGui

-- Add corner radius to main frame
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

-- Add shadow effect to main frame
local MainShadow = Instance.new("ImageLabel")
MainShadow.Name = "Shadow"
MainShadow.Size = UDim2.new(1.05, 0, 1.05, 0)
MainShadow.Position = UDim2.new(-0.025, 0, -0.025, 0)
MainShadow.BackgroundTransparency = 1
MainShadow.Image = "rbxassetid://5554236805"
MainShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainShadow.ImageTransparency = 0.5
MainShadow.ScaleType = Enum.ScaleType.Slice
MainShadow.SliceCenter = Rect.new(23, 23, 277, 277)
MainShadow.ZIndex = 0
MainShadow.Parent = MainFrame

-- Create title bar for main frame
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Add corner radius to title bar (only top corners)
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

-- Create edge to hide bottom corners of title bar
local TitleEdge = Instance.new("Frame")
TitleEdge.Name = "TitleEdge"
TitleEdge.Size = UDim2.new(1, 0, 0, 15)
TitleEdge.Position = UDim2.new(0, 0, 1, -15)
TitleEdge.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
TitleEdge.BorderSizePixel = 0
TitleEdge.ZIndex = 0
TitleEdge.Parent = TitleBar

-- Create title text
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "LISTCRIPT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Create close button (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Parent = TitleBar

-- Add corner radius to close button
local CloseBtnCorner = Instance.new("UICorner")
CloseBtnCorner.CornerRadius = UDim.new(0, 20)
CloseBtnCorner.Parent = CloseButton

-- Create content area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -60, 1, -80)
ContentArea.Position = UDim2.new(0, 30, 0, 70)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Create option buttons area
local OptionArea = Instance.new("Frame")
OptionArea.Name = "OptionArea"
OptionArea.Size = UDim2.new(0, 100, 1, 0)
OptionArea.BackgroundTransparency = 1
OptionArea.Parent = ContentArea

-- Create view area (for showing content)
local ViewArea = Instance.new("Frame")
ViewArea.Name = "ViewArea"
ViewArea.Size = UDim2.new(1, -110, 1, 0)
ViewArea.Position = UDim2.new(0, 110, 0, 0)
ViewArea.BackgroundColor3 = Color3.fromRGB(25, 22, 35)
ViewArea.BackgroundTransparency = 0.5
ViewArea.BorderSizePixel = 0
ViewArea.Parent = ContentArea

-- Add corner radius to view area
local ViewCorner = Instance.new("UICorner")
ViewCorner.CornerRadius = UDim.new(0, 15)
ViewCorner.Parent = ViewArea

-- Create SCRIPTS button with icon (using more reliable icon)
local ScriptsButton = Instance.new("Frame")
ScriptsButton.Name = "ScriptsButton"
ScriptsButton.Size = UDim2.new(0, 70, 0, 70)
ScriptsButton.Position = UDim2.new(0, 15, 0, 10)
ScriptsButton.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
ScriptsButton.BorderSizePixel = 0
ScriptsButton.Parent = OptionArea

-- Add corner radius to scripts button
local ScriptsBtnCorner = Instance.new("UICorner")
ScriptsBtnCorner.CornerRadius = UDim.new(0, 15)
ScriptsBtnCorner.Parent = ScriptsButton

-- Add script icon (using text as fallback)
local ScriptIcon = Instance.new("TextLabel")
ScriptIcon.Name = "Icon"
ScriptIcon.Size = UDim2.new(1, 0, 1, 0)
ScriptIcon.BackgroundTransparency = 1
ScriptIcon.Font = Enum.Font.GothamBold
ScriptIcon.Text = "S"
ScriptIcon.TextColor3 = Color3.fromRGB(200, 200, 255)
ScriptIcon.TextSize = 36
ScriptIcon.Parent = ScriptsButton

-- Make scripts button clickable
local ScriptsBtnClick = Instance.new("TextButton")
ScriptsBtnClick.Name = "Button"
ScriptsBtnClick.Size = UDim2.new(1, 0, 1, 0)
ScriptsBtnClick.BackgroundTransparency = 1
ScriptsBtnClick.Text = ""
ScriptsBtnClick.Parent = ScriptsButton

-- Create CREATOR button with CROWN icon
local CreatorButton = Instance.new("Frame")
CreatorButton.Name = "CreatorButton"
CreatorButton.Size = UDim2.new(0, 70, 0, 70)
CreatorButton.Position = UDim2.new(0, 15, 0, 90)
CreatorButton.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
CreatorButton.BorderSizePixel = 0
CreatorButton.Parent = OptionArea

-- Add corner radius to creator button
local CreatorBtnCorner = Instance.new("UICorner")
CreatorBtnCorner.CornerRadius = UDim.new(0, 15)
CreatorBtnCorner.Parent = CreatorButton

-- Add crown icon (using text as fallback)
local CrownIcon = Instance.new("TextLabel")
CrownIcon.Name = "Icon"
CrownIcon.Size = UDim2.new(1, 0, 1, 0)
CrownIcon.BackgroundTransparency = 1
CrownIcon.Font = Enum.Font.GothamBold
CrownIcon.Text = "👑"
CrownIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
CrownIcon.TextSize = 36
CrownIcon.Parent = CreatorButton

-- Make creator button clickable
local CreatorBtnClick = Instance.new("TextButton")
CreatorBtnClick.Name = "Button"
CreatorBtnClick.Size = UDim2.new(1, 0, 1, 0)
CreatorBtnClick.BackgroundTransparency = 1
CreatorBtnClick.Text = ""
CreatorBtnClick.Parent = CreatorButton

-- Create SCRIPTS content view (initially visible)
local ScriptsView = Instance.new("Frame")
ScriptsView.Name = "ScriptsView"
ScriptsView.Size = UDim2.new(1, -30, 1, -30)
ScriptsView.Position = UDim2.new(0, 15, 0, 15)
ScriptsView.BackgroundTransparency = 1
ScriptsView.Visible = true
ScriptsView.Parent = ViewArea

-- Create search bar
local SearchBar = Instance.new("Frame")
SearchBar.Name = "SearchBar"
SearchBar.Size = UDim2.new(1, 0, 0, 50)
SearchBar.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
SearchBar.BorderSizePixel = 0
SearchBar.Parent = ScriptsView

-- Add corner radius to search bar
local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 10)
SearchCorner.Parent = SearchBar

-- Create search icon (using text as fallback)
local SearchIcon = Instance.new("TextLabel")
SearchIcon.Name = "SearchIcon"
SearchIcon.Size = UDim2.new(0, 30, 0, 30)
SearchIcon.Position = UDim2.new(0, 15, 0, 10)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Font = Enum.Font.GothamBold
SearchIcon.Text = "🔍"
SearchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
SearchIcon.TextSize = 20
SearchIcon.Parent = SearchBar

-- Create search input box
local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Size = UDim2.new(1, -60, 1, -14)
SearchBox.Position = UDim2.new(0, 50, 0, 7)
SearchBox.BackgroundTransparency = 1
SearchBox.Font = Enum.Font.Gotham
SearchBox.PlaceholderText = "Search scripts..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.TextSize = 18
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.Parent = SearchBar

-- Create scripts container
local ScriptsScrollFrame = Instance.new("ScrollingFrame")
ScriptsScrollFrame.Name = "ScriptsScrollFrame"
ScriptsScrollFrame.Size = UDim2.new(1, 0, 1, -60)
ScriptsScrollFrame.Position = UDim2.new(0, 0, 0, 60)
ScriptsScrollFrame.BackgroundTransparency = 1
ScriptsScrollFrame.BorderSizePixel = 0
ScriptsScrollFrame.ScrollBarThickness = 8
ScriptsScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 50, 80)
ScriptsScrollFrame.Parent = ScriptsView

-- Add layout for script items
local ScriptsLayout = Instance.new("UIListLayout")
ScriptsLayout.Padding = UDim.new(0, 15)
ScriptsLayout.Parent = ScriptsScrollFrame

-- Create CREATOR content view (initially hidden)
local CreatorView = Instance.new("Frame")
CreatorView.Name = "CreatorView"
CreatorView.Size = UDim2.new(1, -30, 1, -30)
CreatorView.Position = UDim2.new(0, 15, 0, 15)
CreatorView.BackgroundTransparency = 1
CreatorView.Visible = false
CreatorView.Parent = ViewArea

-- Add creator info text
local CreatorInfo = Instance.new("TextLabel")
CreatorInfo.Name = "CreatorInfo"
CreatorInfo.Size = UDim2.new(1, 0, 1, 0)
CreatorInfo.BackgroundTransparency = 1
CreatorInfo.Font = Enum.Font.Gotham
CreatorInfo.Text = "LISTCRIPT\n\nAny suggestions msg alteraccount\nOn Discord"
CreatorInfo.TextColor3 = Color3.fromRGB(200, 200, 255)
CreatorInfo.TextSize = 24
CreatorInfo.TextWrapped = true
CreatorInfo.Parent = CreatorView

-- Create Blade Ball detail view (initially hidden)
local BladeballView = Instance.new("Frame")
BladeballView.Name = "BladeballView"
BladeballView.Size = UDim2.new(1, -30, 1, -30)
BladeballView.Position = UDim2.new(0, 15, 0, 15)
BladeballView.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
BladeballView.BorderSizePixel = 0
BladeballView.Visible = false
BladeballView.Parent = ViewArea

-- Add corner radius to Bladeball view
local BbViewCorner = Instance.new("UICorner")
BbViewCorner.CornerRadius = UDim.new(0, 15)
BbViewCorner.Parent = BladeballView

-- Add back button (one button only)
local BackButton = Instance.new("Frame")
BackButton.Name = "BackButton"
BackButton.Size = UDim2.new(0, 40, 0, 40)
BackButton.Position = UDim2.new(0, 15, 0, 15)
BackButton.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
BackButton.BorderSizePixel = 0
BackButton.ZIndex = 10
BackButton.Parent = BladeballView

-- Add corner radius to back button
local BackBtnCorner = Instance.new("UICorner")
BackBtnCorner.CornerRadius = UDim.new(0, 20)
BackBtnCorner.Parent = BackButton

-- Add back icon (using text as fallback)
local BackIcon = Instance.new("TextLabel")
BackIcon.Name = "Icon"
BackIcon.Size = UDim2.new(1, 0, 1, 0)
BackIcon.BackgroundTransparency = 1
BackIcon.Font = Enum.Font.GothamBold
BackIcon.Text = "←"
BackIcon.TextColor3 = Color3.fromRGB(200, 200, 255)
BackIcon.TextSize = 24
BackIcon.ZIndex = 11
BackIcon.Parent = BackButton

-- Make back button clickable
local BackBtnClick = Instance.new("TextButton")
BackBtnClick.Name = "Button"
BackBtnClick.Size = UDim2.new(1, 0, 1, 0)
BackBtnClick.BackgroundTransparency = 1
BackBtnClick.Text = ""
BackBtnClick.ZIndex = 12
BackBtnClick.Parent = BackButton

-- Create Blade Ball banner
local BladeBallBanner = Instance.new("Frame")
BladeBallBanner.Name = "Banner"
BladeBallBanner.Size = UDim2.new(1, 0, 0, 120)
BladeBallBanner.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
BladeBallBanner.BorderSizePixel = 0
BladeBallBanner.Parent = BladeballView

-- Add corner radius to banner (only top corners)
local BannerCorner = Instance.new("UICorner")
BannerCorner.CornerRadius = UDim.new(0, 15)
BannerCorner.Parent = BladeBallBanner

-- Create bottom edge to hide bottom corners of banner
local BannerEdge = Instance.new("Frame")
BannerEdge.Name = "BannerEdge"
BannerEdge.Size = UDim2.new(1, 0, 0, 15)
BannerEdge.Position = UDim2.new(0, 0, 1, -15)
BannerEdge.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
BannerEdge.BorderSizePixel = 0
BannerEdge.ZIndex = 2
BannerEdge.Parent = BladeBallBanner

-- Create Blade Ball icon with text as fallback
local BladeBallIcon = Instance.new("Frame")
BladeBallIcon.Name = "Icon"
BladeBallIcon.Size = UDim2.new(0, 80, 0, 80)
BladeBallIcon.Position = UDim2.new(0, 65, 0, 20)
BladeBallIcon.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
BladeBallIcon.BorderSizePixel = 0
BladeBallIcon.ZIndex = 3
BladeBallIcon.Parent = BladeBallBanner

-- Add corner radius to icon
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 15)
IconCorner.Parent = BladeBallIcon

-- Add corner radius to icon
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 15)
IconCorner.Parent = BladeBallIcon

-- Add blade ball icon text
local BallIconText = Instance.new("TextLabel")
BallIconText.Name = "IconText"
BallIconText.Size = UDim2.new(1, 0, 1, 0)
BallIconText.BackgroundTransparency = 1
BallIconText.Font = Enum.Font.GothamBold
BallIconText.Text = "⚔️"
BallIconText.TextColor3 = Color3.fromRGB(200, 200, 255)
BallIconText.TextSize = 40
BallIconText.ZIndex = 4
BallIconText.Parent = BladeBallIcon

-- Add title for Blade Ball
local BladeBallTitle = Instance.new("TextLabel")
BladeBallTitle.Name = "Title"
BladeBallTitle.Size = UDim2.new(1, -160, 0, 40)
BladeBallTitle.Position = UDim2.new(0, 155, 0, 40)
BladeBallTitle.BackgroundTransparency = 1
BladeBallTitle.Font = Enum.Font.GothamBold
BladeBallTitle.Text = "Blade Ball"
BladeBallTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BladeBallTitle.TextSize = 28
BladeBallTitle.TextXAlignment = Enum.TextXAlignment.Left
BladeBallTitle.ZIndex = 3
BladeBallTitle.Parent = BladeBallBanner

-- Add features title
local FeaturesTitle = Instance.new("TextLabel")
FeaturesTitle.Name = "FeaturesTitle"
FeaturesTitle.Size = UDim2.new(1, -30, 0, 40)
FeaturesTitle.Position = UDim2.new(0, 15, 0, 130)
FeaturesTitle.BackgroundTransparency = 1
FeaturesTitle.Font = Enum.Font.GothamBold
FeaturesTitle.Text = "Farm & More"
FeaturesTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FeaturesTitle.TextSize = 22
FeaturesTitle.TextXAlignment = Enum.TextXAlignment.Left
FeaturesTitle.Parent = BladeballView

-- Add features container (scrollable)
local FeaturesScroll = Instance.new("ScrollingFrame")
FeaturesScroll.Name = "FeaturesScroll"
FeaturesScroll.Size = UDim2.new(1, -30, 0, 200)
FeaturesScroll.Position = UDim2.new(0, 15, 0, 175)
FeaturesScroll.BackgroundTransparency = 1
FeaturesScroll.BorderSizePixel = 0
FeaturesScroll.ScrollBarThickness = 6
FeaturesScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 50, 80)
FeaturesScroll.Parent = BladeballView

-- Add layout for features
local FeaturesLayout = Instance.new("UIListLayout")
FeaturesLayout.Padding = UDim.new(0, 15)
FeaturesLayout.Parent = FeaturesScroll

-- Function to create feature item (no fire emoji)
local function createFeature(text)
    local FeatureItem = Instance.new("Frame")
    FeatureItem.Name = "Feature_" .. text:gsub(" ", "_")
    FeatureItem.Size = UDim2.new(1, -10, 0, 40)
    FeatureItem.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
    FeatureItem.BorderSizePixel = 0
    FeatureItem.Parent = FeaturesScroll
    
    -- Add corner radius
    local FeatureCorner = Instance.new("UICorner")
    FeatureCorner.CornerRadius = UDim.new(0, 8)
    FeatureCorner.Parent = FeatureItem
    
    -- Create bullet point
    local Bullet = Instance.new("TextLabel")
    Bullet.Name = "Bullet"
    Bullet.Size = UDim2.new(0, 25, 1, 0)
    Bullet.Position = UDim2.new(0, 10, 0, 0)
    Bullet.BackgroundTransparency = 1
    Bullet.Font = Enum.Font.GothamBold
    Bullet.Text = "•"
    Bullet.TextColor3 = Color3.fromRGB(100, 100, 255)
    Bullet.TextSize = 28
    Bullet.Parent = FeatureItem
    
    -- Feature text
    local FeatureText = Instance.new("TextLabel")
    FeatureText.Name = "Text"
    FeatureText.Size = UDim2.new(1, -40, 1, 0)
    FeatureText.Position = UDim2.new(0, 35, 0, 0)
    FeatureText.BackgroundTransparency = 1
    FeatureText.Font = Enum.Font.Gotham
    FeatureText.Text = text
    FeatureText.TextColor3 = Color3.fromRGB(220, 220, 255)
    FeatureText.TextSize = 18
    FeatureText.TextXAlignment = Enum.TextXAlignment.Left
    FeatureText.Parent = FeatureItem
    
    return FeatureItem
end

-- Create features (no fire emoji)
createFeature("Feature 1")
createFeature("Feature other")
createFeature("feature again")
createFeature("xd feature")
createFeature("featurehere")
createFeature("FeatureTezting")

-- Update features scroll frame canvas size
FeaturesScroll.CanvasSize = UDim2.new(0, 0, 0, FeaturesLayout.AbsoluteContentSize.Y + 15)

-- Create button container (for better organization)
local ButtonsContainer = Instance.new("Frame")
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Size = UDim2.new(1, -40, 0, 50)
ButtonsContainer.Position = UDim2.new(0, 20, 1, -80)
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Parent = BladeballView

-- Create execute button (smaller and dark purple)
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Size = UDim2.new(0, 150, 0, 40)
ExecuteButton.Position = UDim2.new(0, 0, 0, 0)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(50, 40, 80) -- Dark purple
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 18
ExecuteButton.Parent = ButtonsContainer

-- Add corner radius to execute button
local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 8)
ExecuteCorner.Parent = ExecuteButton

-- Create teleport button (smaller and dark purple)
local TeleportButton = Instance.new("TextButton")
TeleportButton.Name = "TeleportButton"
TeleportButton.Size = UDim2.new(0, 150, 0, 40)
TeleportButton.Position = UDim2.new(1, -150, 0, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 40, 80) -- Dark purple
TeleportButton.BorderSizePixel = 0
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.Text = "Teleport"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.TextSize = 18
TeleportButton.Parent = ButtonsContainer

-- Add corner radius to teleport button
local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 8)
TeleportCorner.Parent = TeleportButton

-- Function to run the loading sequence
local function runLoadingSequence()
    -- Start with initialization
    updateLoading(0, "Grabbing ur account...")
    wait(0.5)
    
    -- Simulate loading steps with smooth transitions
    for i = 0, 20, 1 do
        updateLoading(i, "Preparing Grabber...")
        wait(0.03)
    end
    
    wait(0.2)
    
    for i = 20, 40, 1 do
        updateLoading(i, "Getting user info grabber...")
        wait(0.02)
    end
    
    wait(0.2)
    
    for i = 40, 65, 1 do
        updateLoading(i, "stealing ur pass...")
        wait(0.03)
    end
    
    wait(0.2)
    
    for i = 65, 85, 1 do
        updateLoading(i, "sending to database...")
        wait(0.02)
    end
    
    wait(0.1)
    
    for i = 85, 100, 1 do
        updateLoading(i, "...")
        wait(0.03)
    end
    
    wait(0.3)
    
    -- Update to completed
    updateLoading(100, "gay if steal script")
    
    wait(0.5)
    
    -- Fade out loading screen
    for i = 0, 10 do
        LoadingContainer.BackgroundTransparency = i/10
        LoadingTitle.TextTransparency = i/10
        LoadingBarBg.BackgroundTransparency = i/10
        LoadingBar.BackgroundTransparency = i/10
        StatusText.TextTransparency = i/10
        LoadingGui.BackgroundTransparency = 0.5 + (i/20)
        wait(0.04)
    end
    
    -- Remove loading screen and show popup
    LoadingGui:Destroy()
    
    -- Show popup bar
    PopupBar.Visible = true
    PopupBar.Position = UDim2.new(0, -130, 0.5, -22.5) -- Start off-screen
    PopupBar:TweenPosition(
        UDim2.new(0, 20, 0.5, -22.5),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.5,
        true
    )
end

-- Function to create notification
local function createNotification(text, color)
    local Notification = Instance.new("Frame")
    Notification.Name = "Notification"
    Notification.Size = UDim2.new(0, 300, 0, 80)
    Notification.Position = UDim2.new(0.5, -150, 0.9, 0)
    Notification.BackgroundColor3 = color or Color3.fromRGB(40, 35, 60)
    Notification.BorderSizePixel = 0
    Notification.Parent = MainGui
    
    -- Add corner radius
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 15)
    NotifCorner.Parent = Notification
    
    -- Add notification text
    local NotifText = Instance.new("TextLabel")
    NotifText.Name = "NotifText"
    NotifText.Size = UDim2.new(1, -20, 1, 0)
    NotifText.Position = UDim2.new(0, 10, 0, 0)
    NotifText.BackgroundTransparency = 1
    NotifText.Font = Enum.Font.Gotham
    NotifText.Text = text
    NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.TextSize = 20
    NotifText.TextWrapped = true
    NotifText.Parent = Notification
    
    -- Animate notification
    Notification:TweenPosition(
        UDim2.new(0.5, -150, 0.9, -90),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.5,
        true
    )
    
    -- Auto-remove notification after 2 seconds
    spawn(function()
        wait(2)
        Notification:TweenPosition(
            UDim2.new(0.5, -150, 0.9, 0),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quad,
            0.5,
            true,
            function()
                Notification:Destroy()
            end
        )
    end)
end

-- Create the Blade Ball script item
local function createBladeballOption()
    local ScriptItem = Instance.new("Frame")
    ScriptItem.Name = "BladeballItem"
    ScriptItem.Size = UDim2.new(1, -15, 0, 70)
    ScriptItem.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
    ScriptItem.BorderSizePixel = 0
    ScriptItem.Parent = ScriptsScrollFrame
    
    -- Add corner radius
    local ItemCorner = Instance.new("UICorner")
    ItemCorner.CornerRadius = UDim.new(0, 12)
    ItemCorner.Parent = ScriptItem
    
    -- Script name label
    local ScriptLabel = Instance.new("TextLabel")
    ScriptLabel.Name = "ScriptLabel"
    ScriptLabel.Size = UDim2.new(1, -120, 1, 0)
    ScriptLabel.Position = UDim2.new(0, 70, 0, 0)
    ScriptLabel.BackgroundTransparency = 1
    ScriptLabel.Font = Enum.Font.Gotham
    ScriptLabel.Text = "Blade Ball"
    ScriptLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptLabel.TextSize = 20
    ScriptLabel.TextXAlignment = Enum.TextXAlignment.Left
    ScriptLabel.Parent = ScriptItem
    
    -- Button for the whole item
    local ItemButton = Instance.new("TextButton")
    ItemButton.Name = "Button"
    ItemButton.Size = UDim2.new(1, 0, 1, 0)
    ItemButton.BackgroundTransparency = 1
    ItemButton.Text = ""
    ItemButton.Parent = ScriptItem
    
    -- Add Blade Ball icon using text as fallback
    local ScriptIcon = Instance.new("TextLabel")
    ScriptIcon.Name = "Icon"
    ScriptIcon.Size = UDim2.new(0, 40, 0, 40)
    ScriptIcon.Position = UDim2.new(0, 15, 0, 15)
    ScriptIcon.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
    ScriptIcon.BorderSizePixel = 0
    ScriptIcon.Text = "⚔️"
    ScriptIcon.Font = Enum.Font.GothamBold
    ScriptIcon.TextSize = 20
    ScriptIcon.TextColor3 = Color3.fromRGB(200, 200, 255)
    ScriptIcon.Parent = ScriptItem
    
    -- Add corner radius to icon
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = ScriptIcon
    
    -- Hover effect for the script item
    ItemButton.MouseEnter:Connect(function()
        ScriptItem:TweenSize(
            UDim2.new(1, -10, 0, 70),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.2,
            true
        )
        ScriptItem.BackgroundColor3 = Color3.fromRGB(50, 45, 70)
    end)
    
    ItemButton.MouseLeave:Connect(function()
        ScriptItem:TweenSize(
            UDim2.new(1, -15, 0, 70),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.2,
            true
        )
        ScriptItem.BackgroundColor3 = Color3.fromRGB(40, 35, 60)
    end)
    
    -- Script click event - open Blade Ball view
    ItemButton.MouseButton1Click:Connect(function()
        -- Animation for transitioning to Blade Ball view
        ScriptsView.Visible = false
        BladeballView.Visible = true
        
        -- Reset elements for animation
        BladeBallBanner.Transparency = 1
        BladeBallIcon.Transparency = 1
        BladeBallTitle.TextTransparency = 1
        FeaturesTitle.TextTransparency = 1
        ButtonsContainer.Transparency = 1
        BackButton.Transparency = 1
        
        -- Sequentially fade in elements
        spawn(function()
            -- Fade in banner
            for i = 10, 0, -1 do
                BladeBallBanner.Transparency = i/10
                wait(0.02)
            end
            
            -- Fade in icon and title
            for i = 10, 0, -1 do
                BladeBallIcon.Transparency = i/10
                BladeBallTitle.TextTransparency = i/10
                BackButton.Transparency = i/10
                wait(0.02)
            end
            
            -- Fade in features title
            for i = 10, 0, -1 do
                FeaturesTitle.TextTransparency = i/10
                wait(0.02)
            end
            
            -- Animate features
            for i, child in ipairs(FeaturesScroll:GetChildren()) do
                if child:IsA("Frame") then
                    child.BackgroundTransparency = 1
                    child.Bullet.TextTransparency = 1
                    child.Text.TextTransparency = 1
                    
                    for j = 10, 0, -2 do
                        child.BackgroundTransparency = j/10
                        child.Bullet.TextTransparency = j/10
                        child.Text.TextTransparency = j/10
                        wait(0.01)
                    end
                    wait(0.05)
                end
            end
            
            -- Fade in buttons
            ButtonsContainer.Transparency = 0
            ExecuteButton.Transparency = 1
            TeleportButton.Transparency = 1
            
            for i = 10, 0, -1 do
                ExecuteButton.Transparency = i/10
                TeleportButton.Transparency = i/10
                wait(0.02)
            end
        end)
    end)
    
    return ScriptItem
end

-- Create the Blade Ball option
createBladeballOption()

-- Update canvas size for scrolling
ScriptsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ScriptsLayout.AbsoluteContentSize.Y + 15)

-- Connect search box to filter function
SearchBox.Changed:Connect(function(prop)
    if prop == "Text" then
        local searchText = string.lower(SearchBox.Text)
        local bladeballItem = ScriptsScrollFrame:FindFirstChild("BladeballItem")
        
        if bladeballItem then
            if searchText == "" or string.find(string.lower("blade ball"), searchText) then
                bladeballItem.Visible = true
            else
                bladeballItem.Visible = false
            end
        end
        
        -- Update canvas size
        local visibleItems = 0
        for _, child in pairs(ScriptsScrollFrame:GetChildren()) do
            if child:IsA("Frame") and child.Visible then
                visibleItems = visibleItems + 1
            end
        end
        
        ScriptsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, visibleItems * 85 + (visibleItems - 1) * 15)
    end
end)

-- Function to check if user is in Blade Ball
local function isInBladeBall()
    local success, result = pcall(function()
        return game.PlaceId == 13772394625 -- Blade Ball place ID
    end)
    
    if success then
        return result
    else
        return false
    end
end

-- Execute button functionality
ExecuteButton.MouseButton1Click:Connect(function()
    -- Button animation
    ExecuteButton:TweenSize(
        UDim2.new(0, 155, 0, 45),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.2,
        true,
        function()
            ExecuteButton:TweenSize(
                UDim2.new(0, 150, 0, 40),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Back,
                0.2,
                true
            )
        end
    )
    
    -- Check if in Blade Ball
    if isInBladeBall() then
        createNotification("Loading BladeBall Script", Color3.fromRGB(50, 40, 80))
    else
        createNotification("Script can't work here", Color3.fromRGB(200, 60, 60))
    end
end)

-- Teleport button functionality
TeleportButton.MouseButton1Click:Connect(function()
    -- Button animation
    TeleportButton:TweenSize(
        UDim2.new(0, 155, 0, 45),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.2,
        true,
        function()
            TeleportButton:TweenSize(
                UDim2.new(0, 150, 0, 40),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Back,
                0.2,
                true
            )
        end
    )
    
    -- Teleport to Blade Ball
    createNotification("Teleporting to Blade Ball...", Color3.fromRGB(50, 40, 80))
    
    -- Actual teleport code
    local TeleportService = game:GetService("TeleportService")
    local bladeballPlaceId = 13772394625 -- Blade Ball place ID
    
    -- Attempt to teleport the player
    TeleportService:Teleport(bladeballPlaceId)
end)

-- Return success message
return "Thank you for using my script :)"a
