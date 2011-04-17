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
	EmitSfx (body, redsmoke)
end

function script.StartMoving ()
	EmitSfx (body, whitesmoke)
end

function script.StopMoving ()
	EmitSfx (body, blacksmoke)
end