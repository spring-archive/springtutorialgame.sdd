local unitName = "simplehover"

local unitDef = {
name = "Swoosher",
Description = "a simple, mobile unit. does nothing but drive around.",
objectName = "simplehover.s3o",
script = "simplehover.lua",
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
}

return lowerkeys({ [unitName] = unitDef })