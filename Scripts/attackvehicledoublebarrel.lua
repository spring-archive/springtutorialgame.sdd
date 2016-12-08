--Define the wheel pieces
local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local wheel3 = piece "wheel3"
local wheel4 = piece "wheel4"
local wheel_speed = math.rad(180)
--Define the pieces of the weapon
local turret = piece "turret"
local barrel_right = piece "barrel_right"
local barrel_left = piece "barrel_left"
local flare_right = piece "flare_right"
local flare_left = piece "flare_left"
local pivot = piece "pivot"	--both barrels are attached to this "invisible" piece. thus if we tilt this piece for aiming, both barrels will follow the rotation
local active_barrel = 1		--the barrel that the next shot will be fired from
local number_of_barrels = 2		--how many barrel there are in total
--define other pieces
local body = piece "body"

function script.Create()
	
end

----driving animation
--http://answers.springlobby.info/questions/427/howto-spinning-wheels-on-moving-units
function script.StartMoving()
--    Spring.Echo ("starting to move!")
    Spin(wheel1, x_axis, wheel_speed)
    Spin(wheel2, x_axis, wheel_speed)
    Spin(wheel3, x_axis, wheel_speed)
    Spin(wheel4, x_axis, wheel_speed)
end

function script.StopMoving()
--    Spring.Echo ("Stopped moving!")
    StopSpin (wheel1,x_axis)
    StopSpin (wheel2,x_axis)
    StopSpin (wheel3,x_axis)
    StopSpin (wheel4,x_axis)
end

----aimining & fire weapon
function script.AimFromWeapon1() 
	return turret
end

function script.QueryWeapon1()
	if (active_barrel == 1) then return barrel_right end
	if (active_barrel == 2) then return barrel_left end
end

function script.AimWeapon1( heading, pitch )	
	--aiming animation: instantly turn the gun towards the enemy
	Turn(turret, y_axis, heading)
	Turn(pivot, x_axis, -pitch)
	return true
end

function script.FireWeapon1()	
	--switch to the next barrel:
	active_barrel = active_barrel + 1
	--if all barrels have fired, start the cyclus from the beginning:
	if (active_barrel > number_of_barrels) then active_barrel = 1 end
	
	--recoil animation
	if (active_barrel == 1) then
		Move (barrel_right, z_axis, -5)
		Move (barrel_right, z_axis, 0, 20)
	end
	
	if (active_barrel == 2) then
		Move (barrel_left, z_axis, -5)
		Move (barrel_left, z_axis, 0, 20)
	end	
end

---death animation
function script.Killed(recentDamage, maxHealth)
	Explode (body, SFX.SHATTER) 
end