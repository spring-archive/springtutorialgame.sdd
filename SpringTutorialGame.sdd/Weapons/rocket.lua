local weaponName="rocket"
local weaponDef={
name="Red Rocket of Doom",
weaponType=[[MissileLauncher]],

Accuracy=2000,

--Physic/flight path
range=800,
reloadtime=2,
weaponVelocity=1000,
startVelocity=250,
weaponAcceleration=200,
flightTime=2.5,
BurnBlow=0,
FixedLauncher=true,
dance=0,
wobble=0,
tolerance=16000,
tracks=false,
Turnrate=16000,
collideFriendly=true,

----APPEARANCE
model="rocket.s3o",
smokeTrail=true,
--explosionGenerator="custom:redsmoke",
--CegTag="smoketrail",

----TARGETING
turret=true,
CylinderTargetting=true,
avoidFeature=false,
avoidFriendly=false,


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