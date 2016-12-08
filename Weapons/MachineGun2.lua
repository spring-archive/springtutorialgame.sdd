---http://springrts.com/wiki/Weapon_Variables#Cannon_.28Plasma.29_Visuals
local weaponName = "MachineGun2"
local weaponDef = {
	     name                    = "Machine Gun with effects",
	     weaponType              = [[Cannon]],
	     --damage
		 damage = {
			default = 10,
			},
	     areaOfEffect            = 8,
		 --physics
		 weaponVelocity          = 500,
		 reloadtime              = 0.5,
		 range                   = 350,
		 sprayAngle              = 0,
	     tolerance               = 8000,
		 lineOfSight             = true,	      
	     turret                  = true,
		 craterMult              = 0,	      
		 --apperance
		 rgbColor                = [[1 0.1 0.1]],		  	      
         size                    = 4,
	     stages                  = 20,
		 separation              = 1,
		 --effects
		 explosionGenerator      = [[custom:redsmoke]],
		 }
		
return lowerkeys({[weaponName] = weaponDef})