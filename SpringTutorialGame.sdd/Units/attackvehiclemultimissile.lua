local unitName = "attackvehiclemultimissile"

local unitDef = {
name = "Super Rocker",
Description = "fires a salvo of missiles. scripted with arrays/tables.",
objectName = "attackvehiclemultimissile.s3o",
script = "attackvehiclemultimissile.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 100,
buildCostEnergy = 0,
buildTime = 5,
--Health
maxDamage = 300,
idleAutoHeal = 0,
--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
MaxSlope = 15,
MaxVelocity = 4.0,
MaxWaterDepth = 20,
MovementClass = "Default2x2",
TurnRate = 600,

sightDistance = 1000,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 

Category = [[LAND]],

weapons = {
[1]={name  = "swarmmissile",
	onlyTargetCategory = [[LAND AIR]],
	},
},
}

return lowerkeys({ [unitName] = unitDef })