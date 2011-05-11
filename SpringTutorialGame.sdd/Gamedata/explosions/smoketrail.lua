--uses fewer particles so it can be used as trail for rockets
return {
  ["smoketrail"] = {
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
        explosiongenerator = [[custom:smoketrail]],
		airdrag            = 0.8,
        colormap           = [[0 0 0 1   0.2 0.2 0.2 0.8  0.8 0.8 0.8 0]], --fade out a bit
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 15,
        particlelifespread = 3,
        particlesize       = 8,
        particlesizespread = 3,
        particlespeed      =  1,
        particlespeedspread = 3,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1,
        texture            = [[cartooncloud]],
      },
    },
  },

}