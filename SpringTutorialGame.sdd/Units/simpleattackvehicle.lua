local unitName = "simpleattackvehicle"

local unitDef = {
name = "Boomer",
Description = "a simple, mobile attack unit. shoots stuff.",
objectName = "simpleattackvehicle.s3o",
script = "simpleattackvehicle.lua",

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

weapons = {
[1]={name  = "MachineGun",
	onlyTargetCategory = [[LAND]],
	},
},
}

return lowerkeys({ [unitName] = unitDef })