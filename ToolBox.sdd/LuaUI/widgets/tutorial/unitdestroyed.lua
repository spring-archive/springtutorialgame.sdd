-- INCLUDES
VFS.Include("LuaRules/Gadgets/Includes/utilities.lua")
VFS.Include("LuaRules/Gadgets/Includes/messagetypes.lua")

-- CONSTANTS
local DEBUG = true
local LOCALPLAYER = Spring.GetMyPlayerID()

-- MEMBERS
local Chili
local Window
local Label
local unitsDestroyedLabel
local unitsDestroyedWindow

-- SCRIPT FUNCTIONS
function doUnitDestroyedUpdate(value)
	if DEBUG then Spring.Echo("changing unitsdestroyed to " .. value) end
	unitsDestroyedLabel:SetCaption(value)
end

-- WIDGET CODE
function widget:GetInfo()
	return {
		name		= "unit destroyed window",
		desc		= "window to keep the unitdestroyed counter",
		author		= "Sunspot",
		date		= "2011-06-19",
		license     = "GNU GPL v2",
		layer		= 2,
		enabled   	= true  --  loaded by default?
	}
end

function widget:Initialize()
	
	if (not WG.Chili) then
		widgetHandler:RemoveWidget()
		return
	end

	Chili = WG.Chili
	Window = Chili.Window
	Label = Chili.Label
	local screen0 = Chili.Screen0
	
	unitsDestroyedWindow = Window:New{
		x = '50%',
		y = '50%',	
		dockable = true,
		parent = screen0,
		caption = "units destroyed",
		draggable = true,
		resizable = false,
		dragUseGrip = true,
		clientWidth = 100,
		clientHeight = 20,
		backgroundColor = {0.8,0.8,0.8,0.9},
	}
	
	unitsDestroyedLabel = Label:New{
		x = "50%",
		y = '50%',
		parent = unitsDestroyedWindow,
		caption = 0,
		fontsize = 13,
		autosize = false,
		textColor = {1,1,1,1},
		anchors = {left=true,bottom=false,right=false,top=false},
	}	
end

function widget:RecvLuaMsg(msg, playerID)
	if (playerID ~= LOCALPLAYER) then return end
	
	local tokens = split(msg,"-");
	if(tokens[1] == UNITDESTROYEDUPDATE)then
		if DEBUG then Spring.Echo("unitdestroyed msg recieved : " .. msg) end		
		doUnitDestroyedUpdate(tokens[2])
	end
end