local unitName = "simplehover"

local unitDef = {
name = "Swoosher",
Description = "a simple, mobile unit. does nothing but drive around.",
objectName = "simplehover.s3o",
script = "simplehover.lua",

maxDamage = 100,

--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
MaxSlope = 15,
MaxVelocity = 8.0,
MaxWaterDepth = 20,
MovementClass = "Default2x2",
TurnRate = 900,

sightDistance = 300,

Builder = 0,
CanAttack = 0,
CanGuard = 1,
CanMove = 1,
CanPatrol = 1,
CanStop = 1,
LeaveTracks = 0, 
}

return lowerkeys({ [unitName] = unitDef })