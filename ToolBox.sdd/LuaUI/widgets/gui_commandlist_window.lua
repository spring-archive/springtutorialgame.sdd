-- INCLUDES
VFS.Include("LuaRules/Gadgets/Includes/utilities.lua")

-- CONSTANTS
local MAXBUTTONSONROW = 3
local COMMANDSTOEXCLUDE = {"timewait","deathwait","squadwait","gatherwait","loadonto","nextmenu","prevmenu"}
local Chili

-- MEMBERS
local x
local y
local imageDir = 'LuaUI/Images/commands/'
local commandWindow
local stateCommandWindow
local buildCommandWindow
local updateRequired = true

-- CONTROLS
local spGetActiveCommand 	= Spring.GetActiveCommand
local spGetActiveCmdDesc 	= Spring.GetActiveCmdDesc
local spGetSelectedUnits    = Spring.GetSelectedUnits
local spSendCommands        = Spring.SendCommands


-- SCRIPT FUNCTIONS
function LayoutHandler(xIcons, yIcons, cmdCount, commands)
	widgetHandler.commands   = commands
	widgetHandler.commands.n = cmdCount
	widgetHandler:CommandsChanged()
	local reParamsCmds = {}
	local customCmds = {}

	return "", xIcons, yIcons, {}, customCmds, {}, {}, {}, {}, reParamsCmds, {[1337]=9001}
end

function ClickFunc(button) 
	local _,_,left,_,right = Spring.GetMouseState()
	local alt,ctrl,meta,shift = Spring.GetModKeyState()
	local index = Spring.GetCmdDescIndex(button.cmdid)
	if (left) then
		if DEBUG then Spring.Echo("active command set to ", button.cmdid) end
		Spring.SetActiveCommand(index,1,left,right,alt,ctrl,meta,shift)
	end
	if (right) then
		if DEBUG then Spring.Echo("active command set to ", button.cmdid) end
		Spring.SetActiveCommand(index,3,left,right,alt,ctrl,meta,shift)
	end
end

-- Returns the caption, parent container and commandtype of the button	
function findButtonData(cmd)
	local isState = (cmd.type == CMDTYPE.ICON_MODE and #cmd.params > 1)
	local isBuild = (cmd.id < 0)	
	local buttontext = ""
	local container
	local texture = nil
	if not isState and not isBuild then
		buttontext = cmd.name
		container = commandWindow
	elseif isState then
		local indexChoice = cmd.params[1] + 2
		buttontext = cmd.params[indexChoice]
		container = stateCommandWindow
	else
		container = buildCommandWindow
		texture = '#'..-cmd.id
	end
	return buttontext, container, isState, isBuild, texture	
end

function createMyButton(cmd)
	if(type(cmd) == 'table')then
		buttontext, container, isState, isBuild, texture = findButtonData(cmd)

		local result = container.xstep % MAXBUTTONSONROW
		container.xstep = container.xstep + 1
		local increaseRow = false
		if(result==0)then
			result = MAXBUTTONSONROW
			increaseRow = true
		end	

		local y_axis = 0;
		if not texture then
			y_axis = 38 * (container.ystep-1)
		else
			y_axis = 80 * (container.ystep-1)
		end
		
		local color = {0,0,0,1}
		local button = Chili.Button:New {
			parent = container,
			x = 80 * (result-1),
			y = y_axis,
			padding = {5, 5, 5, 5},
			margin = {0, 0, 0, 0},
			minWidth = 40,
			minHeight = 40,
			caption = buttontext,
			isDisabled = false,
			cmdid = cmd.id,
			OnMouseDown = {ClickFunc},
		}
		
		if texture then
			if DEBUG then Spring.Echo("texture",texture) end
			button:Resize(80,80)
			image= Chili.Image:New {
				width="100%";
				height="90%";
				y="6%";
				keepAspect = true,	--isState;
				file = texture;
				parent = button;
			}		
		end
		
		if(increaseRow)then
			container.ystep = container.ystep+1
		end		
	end
end

function filterUnwanted(commands)
	local uniqueList = {}
	if DEBUG then Spring.Echo("Total commands ", #commands) end
	if not(#commands == 0)then
		j = 1
		for _, cmd in ipairs(commands) do
			if DEBUG then Spring.Echo("Adding command ", cmd.action) end
			if not table.contains(COMMANDSTOEXCLUDE,cmd.action) then
				uniqueList[j] = cmd
				j = j + 1
			end
		end
	end
	return uniqueList
end

function resetWindow(container)
	container:ClearChildren()
	container.xstep = 1
	container.ystep = 1
end

function loadPanel()
	resetWindow(commandWindow)
	resetWindow(stateCommandWindow)
	resetWindow(buildCommandWindow)
	local commands = Spring.GetActiveCmdDescs()
	commands = filterUnwanted(commands)
	table.sort(commands,function(x,y) return x.action < y.action end)
	for cmdid, cmd in pairs(commands) do
		rowcount = createMyButton(commands[cmdid]) 
	end
end

-- WIDGET CODE
function widget:GetInfo()
	return {
		name		= "command list window",
		desc		= "ChiliUi window that contains all the commands a unit has",
		author		= "Sunspot",
		date		= "2011-06-15",
		license     = "GNU GPL v2",
		layer		= math.huge,
		enabled   	= true,
		handler		= true,
	}
end

function widget:Initialize()
	widgetHandler:ConfigLayoutHandler(LayoutHandler)
	Spring.ForceLayoutUpdate()
	spSendCommands({"tooltip 0"})
	
	if (not WG.Chili) then
		widgetHandler:RemoveWidget()
		return
	end

	Chili = WG.Chili
	local screen0 = Chili.Screen0
		
	commandWindow = Chili.Control:New{
		x = 0,
		y = 0,
		width = "100%",
		height = "40%",
		xstep = 1,
		ystep = 1,
		draggable = false,
		resizable = false,
		dragUseGrip = false,		
		children = {},
	}

	stateCommandWindow = Chili.Control:New{
		x = 0,
		y = "40%",
		width = "100%",
		height = "20%",
		xstep = 1,
		ystep = 1,
		draggable = false,
		resizable = false,
		dragUseGrip = false,		
		children = {},
	}	

	buildCommandWindow = Chili.Control:New{
		x = 0,
		y = "60%",
		width = "100%",
		height = "40%",
		xstep = 1,
		ystep = 1,
		draggable = false,
		resizable = false,
		dragUseGrip = false,		
		children = {},
	}		
	
	window0 = Chili.Window:New{
		x = '50%',
		y = '15%',	
		dockable = true,
		parent = screen0,
		caption = "",
		draggable = true,
		resizable = true,
		dragUseGrip = true,
		clientWidth = 400,
		clientHeight = 200,
		backgroundColor = {0,0,0,1},
		skinName  = "DarkGlass",		
		children = {commandWindow,stateCommandWindow,buildCommandWindow},
	}
	
end

function widget:CommandsChanged()
	if DEBUG then Spring.Echo("commandChanged called") end
	updateRequired = true
end

function widget:DrawScreen()
    if updateRequired then
        updateRequired = false
		loadPanel()
    end
end

function widget:Shutdown()
  widgetHandler:ConfigLayoutHandler(nil)
  Spring.ForceLayoutUpdate()
  spSendCommands({"tooltip 1"})
end