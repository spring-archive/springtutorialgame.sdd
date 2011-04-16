--Define the wheel pieces
local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local wheel3 = piece "wheel3"
local wheel4 = piece "wheel4"
local wheel_speed = math.rad(180)
--Define the pieces of the weapon
local turret = piece "turret"
local barrel = piece "barrel"
local flare = piece "flare"
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
	return flare 
end

function script.AimWeapon1( heading, pitch )	
	--aiming animation: instantly turn the gun towards the enemy
	Turn(turret, y_axis, heading)
	Turn(barrel, x_axis, pitch)
	return true
end

function script.FireWeapon1()	
	
end

---death animation
function script.Killed(recentDamage, maxHealth)
	Explode (body, SFX.SHATTER) 
end