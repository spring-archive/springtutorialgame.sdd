--[[
hackish factory with multiple buildpags
--]]

local nano = piece "nano"
local base = piece "base"
local cranebase = piece "cranebase"
local fakeSpot = piece "undergroundspot"
local SIG_BUILD = 1

local buildSpots = {
	[1] = piece "spawn1",
	[2] = piece "spawn2",
	[3] = piece "spawn3",
	[4] = piece "spawn4",
}

function script.Create()
	Spring.Echo ("multi pad factori here!")
end

function script.Killed()
end

--------BUILDING---------
function script.QueryBuildInfo() 
	--the original unit will be constructed at the position of this piece
	--it is deep underground, you probally have never seen it (or somewhere else where it doesnt matter)
	return nano
end

function script.QueryNanoPiece()
	return nano
end

function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	return 0
end

bID = nil		--unitID of the unit that factory is "originaly" building
multiUnits = {}	--extra units that are built
function script.StartBuilding()
	Spin (cranebase, y_axis, math.rad(180))
	Sleep (20)
	createMultiUnits ()	
end

function script.StopBuilding()
	StopSpin (cranebase, y_axis)
	Signal(SIG_BUILD)
	
	--original unit was finished or buildorder was canceled.
	--finish or remove the multi units as well
	local _,  maxHealth,  _, _,  buildprogress = Spring.GetUnitHealth (bID)
	for i = 1, #buildSpots do
		if Spring.ValidUnitID (multiUnits[i]) then
			if (buildprogress == 1) then
				Spring.SetUnitHealth (multiUnits[i], {health=maxHealth, build =1, paralyze=0})
				Spring.MoveCtrl.Disable (multiUnits[i])
			else
				Spring.Echo ("destroi!")
				Spring.DestroyUnit (multiUnits[i], false,true)
			end
		end
	end
	--kill original unit:
	if Spring.ValidUnitID (bID) then
		Spring.DestroyUnit (bID, false,true)		
	end
	bID = nil
end

function createMultiUnits ()
	multiUnits = {}
	local teamID = Spring.GetUnitTeam (unitID)	--team of the factory
	bID = Spring.GetUnitIsBuilding (unitID)	--get the ID of the unit the factory is building
	local bdefID = Spring.GetUnitDefID (bID)
	for i = 1, #buildSpots do
		local x,y,z = Spring.GetUnitPiecePosDir (unitID, buildSpots[i])
		local newUnit = Spring.CreateUnit (bdefID, x,y,z, i, teamID, true)
		--Spring.MoveCtrl.Enable (newUnit)	--make unit immobile during building
		multiUnits[i] = newUnit
	end
	StartThread (updateMultiPads)	
	--hide original unit:	
	Spring.SetUnitNeutral (bID, true)
	Spring.SetUnitNoSelect (bID, true)
	Spring.SetUnitNoDraw (bID, true)
	allAllies = Spring.GetAllyTeamList()
	--this did not quite work:
	--for i,v in ipairs(allAllies) do
		--Spring.SetUnitLosMask (bID, v, {los = false, radar = false, prevLos = false, contRadar = false,})		
	--end
	--Spring.SetUnitPosition (bID, -666, -666, -666)
end


function updateMultiPads ()
	Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)	
	while (true) do
		if (bID) then
			--the last returned arguement of GetUnitHealth is the buildprogress
			--it goes from 0 to 1
			local health,  _,  _, _,  buildprogress = Spring.GetUnitHealth (bID)
			if (buildprogress) then	
				for i = 1, #buildSpots do
					if Spring.ValidUnitID (multiUnits[i]) then	--in case it got killed
					Spring.SetUnitHealth (multiUnits[i], {health= health, build =buildprogress})									
					end
				end
			end		
		end
		Sleep (20)
	end
end
