--a walking animation using threads
--smoothly aiming the weapon, also using threads
local base = piece "base"
local body = piece "body"
local leg_left = piece "leg_left"
local leg_right = piece "leg_right"
--pieces used by the weapon:
local turret = piece "turret"
local barrel = piece "barrel"
local flare = piece "flare"


local SIG_WALK = 1	--signal for the walk animation thread
local SIG_WALK = 2  --signal for the weapon aiming thread
local leg_movespeed = 20
local leg_movedistance = 10

function script.Create()
	
end

---WALKING---
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
--    Spring.Echo ("starting to walk!")
	StartThread (walk)
end

function script.StopMoving()
--    Spring.Echo ("stopped walking!")
		Signal(SIG_WALK)
		legs_down ()
end

---AIMING & SHOOTING---
function script.AimFromWeapon1() 
	return body 
end

function script.QueryWeapon1() 
	return flare
end

--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed
function script.AimWeapon1( heading, pitch )
	--make sure the aiming animation is only run once
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(90))
	Turn(barrel, x_axis, -pitch, math.rad(90))
	--wait until the weapon is pointed in the right direction
	WaitForTurn (turret, y_axis)
	WaitForTurn (barrel, x_axis)
	return true
end

--called after the weapon has fired
function script.FireWeapon1()
	
end

----death animation: fall over & explode
function script.Killed(recentDamage, maxHealth)
	Turn (base, x_axis, math.rad(90),math.rad(150))
	WaitForTurn (base, x_axis)	
	Explode (body, SFX.SHATTER)	
	Explode (leg_left, SFX.FIRE)
	Explode (leg_right, SFX.FIRE)
end