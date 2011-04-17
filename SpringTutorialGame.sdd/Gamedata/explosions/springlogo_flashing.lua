--the logo of the spring engine flashing in various colors
return {
  ["springlogo_flashing"] = {
    tpsmallsmoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:springlogo_flashing]],
		airdrag            = 0.9,
        colormap           = [[1 0 0 1  1 1 0 1   0 1 0 1  0 1 1 1]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 100,
        particlelifespread = 0,
        particlesize       = -40,	--negative side: turn the texture upside down
        particlesizespread = 0,
        particlespeed      =  0,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[springlogo]],
      },
    },
  },
}