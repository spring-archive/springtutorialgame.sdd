-- INCLUDES
-- CONSTANTS
-- SYNCED CONTROLS
-- CHILI CONTROLS
local Chili      
local Window     
local Label

-- MEMBERS
local helloWorldLabel
local helloWorldWindow

-- SCRIPT FUNCTIONS
-- WIDGET CODE
function widget:GetInfo()
	return {
		name		= "helloworld",
		desc		= "hello world tutorial",
		author		= "Sunspot",
		date		= "2011-06-19",
		license     = "GNU GPL v2",
		layer		= 1,
		enabled   	= true
	}
end

function widget:Initialize()
	
	if (not WG.Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
	Chili      = WG.Chili
	Window     = Chili.Window
	Label      = Chili.Label

	local screen0 = Chili.Screen0
	helloWorldWindow = Window:New{
		x = '50%',
		y = '50%',	
		dockable = true,
		parent = screen0,
		caption = "my hello world window",
		clientWidth = 500,
		clientHeight = 40,
		backgroundColor = {0.8,0.8,0.8,0.9},
	}	
	
	helloWorldLabel = Label:New{
		x = '50%',
		y = '50%',
		width = 12,
		parent = helloWorldWindow,
		caption = "Hello world",
		fontsize = 13,
		textColor = {1,1,1,1},
		anchors = {left=true,bottom=false,right=false,top=false},
	}
end