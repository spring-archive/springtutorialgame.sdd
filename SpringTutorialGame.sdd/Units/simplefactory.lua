local unitName = "simplefactory"

local unitDef =
{
-- Internal settings	
	Category = "BUILDING",
	ObjectName = "factory.s3o",	
	TEDClass = "PLANT",
	script = "simplefactory.lua",
	
-- Unit limitations and properties
	Description = "a simple factory that builds mobile units",
	MaxDamage = 1500,
	Name = "Simple Factory",
	RadarDistance = 0,
	SightDistance = 400,	
	Upright = 1,	
	levelground = 1,
	--cost
	buildCostMetal = 200,
	buildCostEnergy = 0,
	buildTime = 5,
	--economy	
	EnergyStorage = 0,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 0, 
	MakesMetal = 0, 
	MetalMake = 0,	
-- Pathfinding and related
	FootprintX = 4,
	FootprintZ = 4,
	MaxSlope = 10,	
	YardMap ="oooo occo occo occo",

-- Building	
	Builder = true,
    Reclaimable = false,
	ShowNanoSpray = true,
	CanBeAssisted = false,	
	workerTime = 1,
	buildoptions = 
	{
		"simplehover",
		"hoverweapon",
		"simpleattackvehicle",
		"attackvehicledoublebarrel",
		"hovereffects",
		"simplewalker",
	},
}

return lowerkeys({ [unitName] = unitDef })