local unitName = "attackvehiclerocket"

local unitDef = {
name = "Rocker",
Description = "fires a rocket",
objectName = "simpleattackvehicle.s3o",
script = "simpleattackvehicle.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 100,
buildCostEnergy = 0,
buildTime = 5,
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

sightDistance = 1000,

Category = [[LAND]],

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false,

weapons = {
[1]={name  = "rocket",
	onlyTargetCategory = [[LAND AIR]],
	},
},


}

return lowerkeys({ [unitName] = unitDef })