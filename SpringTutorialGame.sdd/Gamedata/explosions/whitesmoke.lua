--a smaller smoke cloud by knorke
return {
  ["whitesmoke"] = {
    tpsmallsmoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 3,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:whitesmoke]],
		airdrag            = 0.9,
        colormap           = [[1 1 1 0.75   1 1 1 0]], --fade out
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 30,
        particlelifespread = 30,
        particlesize       = 5,
        particlesizespread = 10,
        particlespeed      =  1.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },

}