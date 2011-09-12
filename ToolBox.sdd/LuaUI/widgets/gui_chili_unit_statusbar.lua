-- INCLUDES
VFS.Include("LuaRules/Gadgets/Includes/utilities.lua")

-- CONSTANTS
local XY = true
local Chili
local Label
local Window

-- MEMBERS
local old_mx, old_my = -1,-1
local mx, my = -1,-1

-- CONTROLS
local spGetModKeyState			= Spring.GetModKeyState
local spGetMouseState			= Spring.GetMouseState
local spTraceScreenRay			= Spring.TraceScreenRay
local spGetUnitHealth			= Spring.GetUnitHealth
local spGetUnitExp			    = Spring.GetUnitExperience 

-- SCRIPT FUNCTIONS
function setUnitInfo(unit,x,y)
	local unitInfoString = ""
	local health, maxHealth, _, cpProgress, bProgress = spGetUnitHealth(unit)
	if health and health ~= nil then
		if DEBUG then Spring.Echo("health appended") end
		unitInfoString = "HP: " .. unitInfoString .. math.floor(health) .. " / " .. maxHealth .. "      "
	end
	if cpProgress ~= 0 and cpProgress ~= nil then
		if DEBUG then Spring.Echo("capture appended") end
		unitInfoString = unitInfoString .. "cpt " .. math.floor(cpProgress*100) .. "%" .. "      "
	end
	if bProgress ~= 1 and bProgress ~= nil then
		if DEBUG then Spring.Echo("building appended") end
		unitInfoString = unitInfoString .. "bld " .. math.floor(bProgress*100) .. "%"
	end
	local defId = Spring.GetUnitDefID(unit)
	if(defId ~= nil) then
		local weapons = UnitDefs[defId]["weapons"]
		if DEBUG then Spring.Echo("units amount of weapons", #weapons) end
		for i=1, #weapons do
			local weaponDef = WeaponDefs[weapons[i]["weaponDef"]]
			local damage = 0
			local range = 0
			for name,param in weaponDef:pairs() do
				if(name == "range")then
					range = param
				end
				if(name == "damages")then
					damage = param[0]
				end
			end
			unitInfoString = unitInfoString .. "      wp" .. i .. " D:" .. damage .. "-R:" .. range
		end
	end
	if XY then unitInfoString = unitInfoString .. "      x:" .. x .. "   y:" .. y end
	test:SetCaption(unitInfoString)
end

-- WIDGET CODE
function widget:GetInfo()
	return {
		name		= "Unit status bar",
		desc		= "ChiliUi show status of the unit you are hovering over",
		author		= "Sunspot",
		date		= "2011-06-18",
		license     = "GNU GPL v2",
		layer		= math.huge,
		enabled   	= true,
		handler		= true,
	}
end

function widget:Initialize()
	
	if (not WG.Chili) then
		widgetHandler:RemoveWidget()
		return
	end

	Chili = WG.Chili
	Label = Chili.Label
	Window = Chili.Window
	local screen0 = Chili.Screen0

	statusBar = Window:New{
		parent = screen0,
		x = 0,
		y = -50,
		width = "100%",
		height = "5%",
		draggable = false,
		resizable = false,
		dragUseGrip = false,		
		anchors = {left=true,bottom=true,right=true,top=false},
		skinName  = "carbon",
	}	

	test = Label:New{
		parent = statusBar,
		width = 1000,
		caption = "0",
		fontsize = 13,
		autosize = false,
		autoObeyLineHeight = false,
		textColor = {1,1,1,1},
		anchors = {left=true,bottom=true,right=false,top=false},		
	}	
end

function widget:Update(dt)
	old_mx, old_my = mx,my
	alt,_,meta,_ = spGetModKeyState()
	mx,my = spGetMouseState()
	local mousemoved = (mx ~= old_mx or my ~= old_my)
	if mousemoved then
		local type, data = spTraceScreenRay(mx, my)
		if(type == "unit")then
			setUnitInfo(data,mx,my)
		else
			if(test.caption ~= "") then
				test:SetCaption("x:" .. mx .. "   y:" .. my)
			end
		end
	end
end

function widget:Shutdown()
  widgetHandler:ConfigLayoutHandler(nil)
  Spring.ForceLayoutUpdate()
end