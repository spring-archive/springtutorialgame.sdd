local unitName = "hovereffects"

local unitDef = {
name = "Acid King",
Description = "emits colored smoke",
objectName = "simplehover.s3o",
script = "hovereffects.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 100,
buildCostEnergy = 0,
buildTime = 1,
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
MovementClass = "Hover2x2",
canHover = true,
TurnRate = 900,

sightDistance = 300,

Category = [[LAND]],

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false,

weapons = {
[1]={name  = "MachineGun2",
	onlyTargetCategory = [[LAND]],
	},
},
--effects, useable in the animation script
sfxtypes = {
	explosiongenerators = {
	"custom:whitesmoke",
	"custom:blacksmoke",
	"custom:redsmoke",
	"custom:springlogo_flashing",
		},
	},
	explodeAs = "custom:redsmoke", --***FIXME: does not work?
	pieceTrailCEGTag = "stars",
	pieceTrailCEGRange = 3,
}

return lowerkeys({ [unitName] = unitDef })