local unitName = "simplewalker"

local unitDef = {
name = "Walker",
Description = "a walker. demonstrates use of threads in unit scripts.",
objectName = "simplewalker.s3o",
script = "simplewalker.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 100,
buildCostEnergy = 100,
buildTime = 5,
--Health
maxDamage = 100,
idleAutoHeal = 0,

--Movement
Acceleration = 0.2,
MaxVelocity = 3.0,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
MovementClass = "Default2x2",
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
[1]={name  = "deathraylaser",
	onlyTargetCategory = [[LAND]],
	},
},
}

return lowerkeys({ [unitName] = unitDef })