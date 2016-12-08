--weapon usage
--get the effects that are defined in the unitDef:
local body = piece "body"

function script.Create()

end

function script.Killed(recentDamage, maxHealth)	

end

function script.StartMoving ()
	Move (body, y_axis, 15, 30)
end

function script.StopMoving ()
	Move (body, y_axis, 0, 10)
end

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