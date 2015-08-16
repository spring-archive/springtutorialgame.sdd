# What is this? #
---enter text here---
this the unitdef.lua file that explain all data of what made this unit to the engine :
for resume its the only unit in the game : that is the base unit for the complete basic mod :
this unit list all tags existing

but only the mandatory are enabled

for this gameplay concept :

> the unit self replicate ,

and is a kamikaze ,
have  no visibility
but only radar & sonar ,

, can "roll" on the ground and the deep underwater ground ,

> 3d model(.s3o) is an empty ,

> own selfdestruct if needed for kamikaz and explod is big enought for make chain reaction ,

> no sounds ,

build menu picture ,

,empty script anim ,



unitdefs for single unit mod playable :
```
unitDef = {
  
 -- files & data links
unitname="singleunit0",--filename
BuildPic = "singleunit0.jpg",--menupicture
ObjectName = "singleunit0",--3dmodel
script = "singleunit0anim3d.lua",--3d animation file
movementclass = "roler1",--map movement file
	 
-- Unit properties
 Name = "buildm00",--name at screen ingame	
Description = "armored & weaponed Constructer",--description at screen inn game

BuildTime = 1,--time for being build(milliseconde)
levelground = 0,--is the ground is flated under unit when being build
MaxWaterDepth = 255,--max water deep where can being build
MaxSlope = 25,--38,	--max slope where ca being build

-- Energy and metal related
BuildCostEnergy = 1,--energy spend for build this unit
BuildCostMetal = 1,--metal spend for build this unit
EnergyMake = 200, --make energy when switch on onoffable is on or if not exist then always

MetalMake = 200,--	make metal when switch on onoffable is on or if not exist then always
--Hitbox
mass=799,	--mass of the unit related to the gravity and the size x & y (unknow calculation)
Upright = 0,--is the unit always vertical 
FootprintX = 3,--large of the unit (mobile unit found dificultly a way when 3 or 4 (worst a t 5or more)
FootprintZ = 3,--lenghtof the unit (mobile unit found dificultly a way when 3 or 4 (worst a t 5or more)
collisionVolumeOffsets    =  "0 -5 0",--location of the hit shere or volume related to the center of the root 3d
collisionVolumeScales     =  "41 33 41",--lenght of the edge of the hit volume (maybe 10 per footprint)
--collisionVolumeTest       =  1,--unknow
  -- collisionVolumeType       =  "box",--volume of the hit geometry sphere box cylinder
   
-- Pathfinding and related
CanMove = 1,--is a static or mobile
Acceleration = 0.9,--time for being at max speed or speed gain per second ?
BrakeRate = 1,	--time for being at stop or speed loose per second ?
MaxVelocity = 4.0,--max speed (10= 1map =512pixel per second)
TurnRate = 333,--milliradian per second or so

--sensor & detectability (ingame must use L key for show zones of detection )

--RadarDistance = 200,--show some plot at the range of this unit where are the ennemy ground & air(with randomness if not isatargetupgrad=1 unit in team)not subwater
--sonarDistance       = 100,--show some plot at the range of this unit where are the ennemy subwater(with randomness if not isatargetupgrad=1 unit in team)not ground & air
SightDistance = 0,--show ennemy at this unit range
SeismicSignature=1,--notwork--to verify --show this size of plot at the range of the unit having seismicdistance (unit dont atack automaiticly the plot) 
Seismicdistance=1000,--not work--to verify --distance from the unit where the ennemy show a plot if the have a seismic signature

--builder Abilities
	Builder = 1,--the unit build some static or mobile units
	BuildDistance = 40,	--the unit build or repair or reclaim or restore or capture or resurect at this distance
	WorkerTime = 555,	--amount per second can be spent in build metal or energy max
	buildoptions = {   "hexarot5"}
		
 MaxDamage = 2222,--life count of the unit when 0 the unit replaced per a corpse or nothing but stop to being team controled weapon will substract it and capture must upsize it
kamikaze=1,--the unit automaticly selfdestruckt when ennemy is at kamikazedistance
kamikazedistance=160,--distance when less the unit will selfdestruct
ExplodeAs ="litleexplod",--when the unit die (not by reclaim or capture)this weapon effect at the root of the unit
	SelfDestructAs =  "bigexplod",--when kamikaz or self destruct key is done CanAttack = 1,--unit is  warrior

    },

   
}			
return lowerkeys({ singleunit0 = unitDef })

```

lets discuss about unmandatory lines if can be removed : if build cost can be =0

knorke:
there is lots of unmandatory lines, too much to list now.
ill start uploading game files later and then we can edit these.
also please use commit log and formating