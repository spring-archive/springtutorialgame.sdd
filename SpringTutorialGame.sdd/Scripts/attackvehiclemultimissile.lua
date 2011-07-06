--Define the wheel pieces
local wheels = {}
for i=1,6 do
	local pname = "wheel" .. i
	table.insert (wheels, piece (pname))
end

local wheel_speed = math.rad(150)
--Define the pieces of the weapon
local rockets = {}
for i=1,8 do
	local pname = "rocket" .. i
	table.insert (rockets, piece (pname))	
end
local rocket_i = 1

--define the pieces that weapons are emited from
local flares = {}
for i=1,8 do
	local pname = "flare" .. i
	table.insert (flares, piece (pname))
end

local pivot = piece "pivot"
local turret = piece "turret"
local SIG_AIM = 2  --signal for the weapon aiming thread

--define other pieces
local body = piece "body"

--get the effects that are defined in the unitDef:
local muzzleflash = SFX.CEG + 0

function script.Create()
	
end

----driving animation
--http://answers.springlobby.info/questions/427/howto-spinning-wheels-on-moving-units
function script.StartMoving()
	for i=1,6 do    
		Spin(wheels[i], x_axis, wheel_speed)
	end
end

function script.StopMoving()
	for i=1,6 do
		StopSpin (wheels[i], x_axis)
	end
end

----aimining & fire weapon
function script.AimFromWeapon1() 
	return turret 
end

function script.QueryWeapon1() 
	return flares [rocket_i] 
end

function script.AimWeapon1( heading, pitch )	
	--aiming animation:
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(180))
	Turn(pivot, x_axis, -pitch, math.rad(90))
	--wait until the weapon is pointed in the right direction
	WaitForTurn (turret, y_axis)
	WaitForTurn (pivot, x_axis)
	return true
end

function script.Shot1()	
	--emit muzzle flash CEG
	EmitSfx (flares [rocket_i] , muzzleflash)
	StartThread (reload_animation, rockets[rocket_i])
	--increase counter to the next rocket, loop to start if max number of rockets is reached
	rocket_i = rocket_i +1
	if (rocket_i > #rockets) then rocket_i = 1 end	
end

function reload_animation (rocket)
	Hide (rocket)
	Move (rocket, z_axis, -8)	
	Sleep (1000)
	Show (rocket)
	Move (rocket, z_axis, 0,30)
	--WaitForMove (rocket, z_axis)	
end

---death animation
function script.Killed(recentDamage, maxHealth)
	Explode (body, SFX.SHATTER)
	--send all the wheels flying away:
	for i=1,6 do
		Explode (wheels[i], SFX.FIRE)
	end
end