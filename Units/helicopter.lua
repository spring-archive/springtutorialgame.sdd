---***FIXME: what tags are really needed?

local unitName = "helicopter"

unitDef = {
name                = "Chopper",
description         = "slap chop!",
objectName          = [[helicopter.s3o]],
script              = [[helicopter.lua]],

bmcode              = [[1]],

builder             = false,
buildPic            = [[placeholder.png]],
buildTime           = 10,
canAttack           = true,

----cost
buildCostEnergy     = 0,
buildCostMetal      = 900,
----health
maxDamage           = 500,
idleAutoHeal        = 0,
----movement
maxVelocity         = 4,
acceleration        = 0.2,
brakeRate           = 3.75,
moverate1           = [[3]],
footprintx          = 3,
footprintZ          = 3,
Upright 			= false,
maneuverleashlength = 1280,
collide             = true,
collision 			= true,
steeringmode        = [[1]],
TEDClass            = [[VTOL]],
turnRate            = 500,
turnRadius		  	= 5,
----aircraft related
canFly              = true,
dontLand		 	= false,
cruiseAlt           = 200,
hoverAttack         = true,
airStrafe			= false,
bankscale           = 1,
maxBank				= 0.2,
maxPitch			= 0.2,

sightDistance       = 800,
canGuard            = true,
canMove             = true,
canPatrol           = true,
canstop             = [[1]],
category            = [[AIR]],
mass                = 125,


weapons = {
		[1]={name  = "MachineGun",
		onlyTargetCategory = [[LAND AIR]],
		},
	},


}

return lowerkeys({ [unitName] = unitDef })