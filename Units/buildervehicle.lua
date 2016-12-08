local unitName = "buildervehicle"

local unitDef = {
name = "Erector",
Description = "a crane that builds stuff. has heavy armour that prevents damage from maschine guns (see armordefs.lua)",
objectName = "buildervehicle.s3o",
script = "buildervehicle.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 15,
--Health
maxDamage = 800,
idleAutoHeal = 0,
--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
MaxSlope = 15,
MaxVelocity = 3.0,
MaxWaterDepth = 20,
MovementClass = "Default3x3",
TurnRate = 300,

sightDistance = 1000,

CanAttack = false,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 
--building
Builder = true,
ShowNanoSpray = true,
CanBeAssisted = true,	
workerTime = 1,
buildDistance = 400,
terraformSpeed = 9001,
buildoptions = 
	{
	"simplefactory",
	},

Category = [[LAND]],


}

return lowerkeys({ [unitName] = unitDef })