local unitName = "hovereffects"

local unitDef = {
name = "Acid King",
Description = "emits colored smoke",
objectName = "simplehover.s3o",
script = "hovereffects.lua",

--Health
maxDamage = 100,
idleAutoHeal = 0,

--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
--MaxSlope = 15,
MaxVelocity = 8.0,
--MaxWaterDepth = 20,
MovementClass = "Default2x2",
TurnRate = 900,

sightDistance = 300,

Category = [[LAND]],

Builder = false,
CanAttack = false,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false,

sfxtypes = {
	explosiongenerators = {
	"custom:whitesmoke",
	"custom:blacksmoke",
	"custom:redsmoke",
	"custom:springlogo_flashing",
		},
	},
}

return lowerkeys({ [unitName] = unitDef })