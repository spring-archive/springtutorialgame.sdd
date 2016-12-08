local weaponName="swarmmissile"
local weaponDef={
name="Giant Bee Mega Swarm",
weaponType=[[MissileLauncher]],

Accuracy=2000,

--Physic/flight path
range=1000,
reloadtime=3,
weaponVelocity=500,
startVelocity=500,
weaponAcceleration=50,
flightTime=2.5,
BurnBlow=1,
FixedLauncher=true,
dance=100,--200
wobble=1000,
tolerance=8000,
tracks=true,
Turnrate=1600,
collideFriendly=true,
TrajectoryHeight = 2,

----APPEARANCE
model="rocket.s3o",
smokeTrail=false,
explosionGenerator="custom:redsmoke",
CegTag="smoketrail",

----TARGETING
turret=true,
CylinderTargetting=true,
avoidFeature=false,
avoidFriendly=false,

----BURST
burst                   = 8,--8
burstrate               = 0.1,

--commandfire=true,

----DAMAGE
damage={
default=150,
heavyarmor=150,
},
areaOfEffect=100,
craterMult=0,

--?FIXME***
lineOfSight=true,


--sound
--soundHit=[[kanoba/SabotHitRemake.ogg]],
--soundStart=[[kanoba/RockLit1Remake.ogg]],
}

return lowerkeys ({[weaponName]=weaponDef})