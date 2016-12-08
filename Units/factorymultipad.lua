local unitName = "factorymultipad"

local unitDef =
{
-- Internal settings	
	Category = "LAND",
	ObjectName = "factorymultipad.s3o",	
	TEDClass = "PLANT",
	script = "factorymultipad.lua",
	buildPic = "placeholder.png",
-- Unit limitations and properties
	Description = "Factory that builds multiple units at once",
	MaxDamage = 1500,
	Name = "Multi Factory",
	RadarDistance = 0,
	SightDistance = 400,	
	Upright = 1,	
	levelground = 1,
	--cost
	buildCostMetal = 200,
	buildCostEnergy = 0,
	buildTime = 25,
	--economy	
	EnergyStorage = 0,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 0, 
	MakesMetal = 0, 
	MetalMake = 0,	
-- Pathfinding and related
	FootprintX = 5,
	FootprintZ = 5,
	MaxSlope = 10,	
	YardMap ="ccccc ccccc ccccc ccccc ccccc",

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
	"buildervehicle",
	"helicopter",
	"attackvehiclerocket",
	"attackvehiclemultimissile",
	},
}

return lowerkeys({ [unitName] = unitDef })