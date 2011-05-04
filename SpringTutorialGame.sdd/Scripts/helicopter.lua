--***FIXME: sometimes "deactivates" mid-flight
local body = piece "body"
local rotorshaft = piece "rotorshaft"
local rotorblade1 = piece "rotorblade1"
local rotorblade2 = piece "rotorblade2"

function script.Create()
	
end

function script.Killed(recentDamage, maxHealth)
	
end

----take off & landing animation
function script.Activate()
	--take off animation: spin rotor quickly and unfold
    Spin (rotorshaft, y_axis, math.rad(720))	
	Turn (rotorblade1, x_axis, math.rad (0), math.rad (200))
	Turn (rotorblade2, x_axis, math.rad (0), math.rad (200))
end

function script.Deactivate ()
	--landing animation: slow down the the rotor
    Spin (rotorshaft, y_axis, math.rad(360))
end

function script.MoveRate(moveRate)
  if (moveRate == 0 ) then
	Turn (rotorblade1, x_axis, -math.rad (90), math.rad (45))
	Turn (rotorblade2, x_axis, math.rad (90), math.rad (45))
	StopSpin (rotorshaft, y_axis, 0.05)
  end
end


----aiming & firing
----aimining & fire weapon
--returns from which piece the unit aims
function script.AimFromWeapon1() 
	return body 
end

--returns where the weapon projectile will be created
function script.QueryWeapon1() 
	return body
end

--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed
function script.AimWeapon1( heading, pitch )
	return true
end

--called after the weapon has fired
function script.FireWeapon1()	
	
end