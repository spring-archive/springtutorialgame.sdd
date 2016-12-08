local moveDefs =
{
	{
	name = "Default2x2",
	footprintX = 2,
	maxWaterDepth = 10,
	maxSlope = 20,
	crushStrength = 100,
	},
	
	{
	name = "Default3x3",
	footprintX = 3,
	maxWaterDepth = 10,
	maxSlope = 20,
	crushStrength = 100,
	},
	
	{
	name = "Hover2x2",
	footprintX = 2,
	maxWaterDepth = 5000,
	maxSlope = 20,
	crushStrength = 25,
	hover = true,
	},
}

return moveDefs
