--a smaller smoke cloud by knorke
return {
  ["stars2"] = {
    stars2 = {
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
        explosiongenerator = [[custom:stars2]],
		airdrag            = 1,
        colormap           = [[0 0 0 0   0.4 1 1 1  0 0 0 0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 30,
        particlelifespread = 30,
        particlesize       = 20,
        particlesizespread = 0,
        particlespeed      = 5,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = -1,
        sizemod            = 1.0,
        texture            = [[star]],
      },
    },
  },

}