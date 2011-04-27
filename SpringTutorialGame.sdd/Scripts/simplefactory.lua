local nano1 = piece "nano1"
local nano2 = piece "nano2"
local buildspot = piece "center"

function script.Create()

end

function script.Killed()

end

--------BUILDING---------
function script.QueryBuildInfo() 
	return buildspot
end

function script.QueryNanoPiece() 
	local dice = math.random (1,2)
	if (dice == 1) then 
		return nano1
	else
		return nano2
	end
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


function script.StartBuilding()	
	Spin (nano1, y_axis, math.rad(200))
	Spin (nano2, y_axis, -math.rad(200))
end

function script.StopBuilding()
	StopSpin (nano1, y_axis)
	StopSpin (nano2, y_axis)
end
---------------------