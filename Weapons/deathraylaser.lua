local weaponName = "deathraylaser"
weaponDef = {
	weaponType              = "BeamLaser",
	name                    = "Laser of Death",
	beamlaser               = 1,
	--physics / aiming--
	beamTime                = 2,
	lineOfSight             = true,
	minIntensity            = 1,      
	range                   = 460,
	reloadtime              = 4,
	sweepfire               = false,
	targetMoveError         = 0.1,
	turret                  = true,
	tolerance               = 5000,
	--damage--
	damage                  = {
		default = 200,        
		},
	areaOfEffect            = 8,
	craterBoost             = 0,
	craterMult              = 0,
	--apperance--	
	thickness               = 5,
	coreThickness           = 0.25,
	explosionGenerator      = [[custom:stars1]],
	largeBeamLaser          = true,
	laserFlareSize          = 2,
	renderType              = 0,
	rgbColor                = [[1 0.2 0.4]],
	--soundStart              = "some sound file",
	--soundTrigger            = true,	
	--texture1                = [[largelaser]],
	--texture2                = [[flare]],
	--texture3                = [[flare]],
	--texture4                = [[smallflare]],		
	}
return lowerkeys({[weaponName] = weaponDef})