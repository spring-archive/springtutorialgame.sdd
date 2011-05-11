---http://springrts.com/wiki/Weapon_Variables#Cannon_.28Plasma.29_Visuals
local weaponName = "MachineGun"
local weaponDef = {
	      name                    = "Machine Gun",
	      weaponType              = [[Cannon]],
	      --damage
		  damage = {
				default = 10,
				HeavyArmor = 1,
				},	      
	      areaOfEffect            = 8,
		  --physics
		  weaponVelocity          = 500,
		  reloadtime              = 0.2,
		  range                   = 350,
		  sprayAngle              = 300,
	      tolerance               = 8000,
		  lineOfSight             = true,	      
	      turret                  = true,
		  craterMult              = 0,	      
		  --apperance
		  rgbColor                = [[1 0.95 0.4]],		  	      
          size                    = 4,
	      stages                  = 20,
		  separation              = 1,
		  }
		
return lowerkeys({[weaponName] = weaponDef})