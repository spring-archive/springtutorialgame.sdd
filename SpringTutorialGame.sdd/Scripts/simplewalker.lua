--a walking animation using threads
local leg_left = piece "leg_left"
local leg_right = piece "leg_right"

local base = piece "base"
local body = piece "body"

local SIG_WALK = 1
local leg_movespeed = 20
local leg_movedistance = 10

function script.Create()
	--Spin (hip_left, x_axis, math.rad(90))
end

local function walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	while (true) do
		--left leg up, right leg down
		Move (leg_left, y_axis, leg_movedistance, leg_movespeed)
		Move (leg_right, y_axis, 0, leg_movespeed)
		WaitForMove (leg_left, y_axis)
		WaitForMove (leg_left, y_axis)		
		Sleep (50)
		--left leg down, right leg up
		Move (leg_left, y_axis, 0, leg_movespeed)
		Move (leg_right, y_axis, leg_movedistance, leg_movespeed)
		WaitForMove (leg_left, y_axis)
		WaitForMove (leg_left, y_axis)
		Sleep (50)
	end
end

local function legs_down ()
	Move (leg_left, y_axis, 0, leg_movespeed)
	Move (leg_right, y_axis, 0, leg_movespeed)
end

function script.StartMoving()
--    Spring.Echo ("starting to move!")
	StartThread (walk)
end

function script.StopMoving()
--    Spring.Echo ("Stopped moving!")
		Signal(SIG_WALK)
		legs_down ()
end


function script.Killed(recentDamage, maxHealth)
	Turn (base, x_axis, math.rad(90),math.rad(150))
	WaitForTurn (base, x_axis)	
	Explode (body, SFX.SHATTER)	
	Explode (leg_left, SFX.FIRE)
	Explode (leg_right, SFX.FIRE)
end