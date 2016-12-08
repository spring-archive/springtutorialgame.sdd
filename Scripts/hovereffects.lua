----demonstrates the EmitSfx function to spawn effects
--get the effects that are defined in the unitDef:
local whitesmoke = SFX.CEG
local blacksmoke = SFX.CEG + 1
local redsmoke = SFX.CEG + 2
local logo = SFX.CEG + 3

local body = piece "body"

function script.Create()
	EmitSfx (body, logo)
end

function script.Killed(recentDamage, maxHealth)	
		Explode (body, SFX.FALL)
end

function script.StartMoving ()
	Move (body, y_axis, 15, 30)
	EmitSfx (body, whitesmoke)
end

function script.StopMoving ()
	Move (body, y_axis, 0, 10)
	EmitSfx (body, blacksmoke)
end

----aimining & fire weapon
function script.AimFromWeapon1() 
	return body 
end

function script.QueryWeapon1() 
	return body
end

function script.AimWeapon1( heading, pitch )
	return true
end

function script.FireWeapon1()	
	
end