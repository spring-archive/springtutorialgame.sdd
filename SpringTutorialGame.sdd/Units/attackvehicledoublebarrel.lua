local unitName = "attackvehicledoublebarrel"

local unitDef = {
name = "Boomer",
Description = "the turret of this unit has two barrels and alternates firing between them",
objectName = "attackvehicledoublebarrel.s3o",
script = "attackvehicledoublebarrel.lua",

--Health
maxDamage = 300,
idleAutoHeal = 0,

--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
MaxSlope = 15,
MaxVelocity = 5.0,
MaxWaterDepth = 20,
MovementClass = "Default2x2",
TurnRate = 900,

sightDistance = 500,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 

Category = [[LAND]],

--Hitbox
collisionVolumeTest       =  1,	
collisionVolumeOffsets    =  [[0 0 0]],
collisionVolumeType       =  "box",
collisionVolumeScales     =  [[25 25 48]],

weapons = {
[1]={name  = "MachineGun",
	onlyTargetCategory = [[LAND]],
	},
},
}

return lowerkeys({ [unitName] = unitDef })