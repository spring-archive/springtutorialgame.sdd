local nano = piece "nano"
local crane1 = piece "crane1"
local crane2 = piece "crane2"

local wheel1, wheel2, wheel3, wheel4 = piece ("wheel1", "wheel2", "wheel3", "wheel4")
local wheel_speed = math.rad(180)

function script.Create()

end

function script.Killed()

end

--------BUILDING---------
function script.StopBuilding()
    Turn (crane1, y_axis, 0, math.rad(100))
	StopSpin (nano, z_axis)
	Turn (nano, z_axis, 0, math.rad(200))
	moveCrane (0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
end

function script.StartBuilding(heading, pitch)	
	Turn (crane1, y_axis, heading+math.rad(180), math.rad(100))
	moveCrane (75)
	waitForCrane ()
	Spin (nano, z_axis, math.rad (200))
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.QueryNanoPiece()
     return nano
end

function moveCrane (angle)
	angle = math.rad (-angle)
	Turn (crane1, x_axis, angle, math.rad(50))
	Turn (crane2, x_axis, -angle*2, math.rad(100))	
end

function waitForCrane ()
	WaitForTurn (crane1, x_axis)
	WaitForTurn (crane2, x_axis)
end
----------------

----driving animation
--http://answers.springlobby.info/questions/427/howto-spinning-wheels-on-moving-units
function script.StartMoving()
    Spin(wheel1, x_axis, wheel_speed)
    Spin(wheel2, x_axis, wheel_speed)
    Spin(wheel3, x_axis, wheel_speed)
    Spin(wheel4, x_axis, wheel_speed)
end

function script.StopMoving()
    StopSpin (wheel1,x_axis)
    StopSpin (wheel2,x_axis)
    StopSpin (wheel3,x_axis)
    StopSpin (wheel4,x_axis)
end