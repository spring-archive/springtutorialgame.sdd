---http://springrts.com/wiki/Weapon_Variables#Cannon_.28Plasma.29_Visuals
local weaponDef = {
	      name                    = "MachineGun",
	      weaponType              = [[Cannon]],
	      --damage
		  damage = {
				Normal = 10,
				},	      
	      areaOfEffect            = 8,
		  --physics
		  weaponVelocity          = 750,
		  reloadtime              = 0.2,
		  range                   = 350,
		  sprayAngle              = 300,
	      tolerance               = 8000,
		  lineOfSight             = true,	      
	      turret                  = true,
		  craterMult              = 0,	      
		  --apperance
		  rgbColor                = [[1 0.95 0.4]],		  
	      separation              = 2,
          size                    = 3,
	      stages                  = 50,
		  }
		
return lowerkeys({["MachineGun"] = weaponDef}) -- ["MachineGun"] not so nice***