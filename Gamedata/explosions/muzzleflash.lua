--a muzzle flash effect, looks like an explosive flame or something
return {
	["muzzleflash"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[1 1 1 0.01	    1 0.8 0 0.01     0 0 0 0.01]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				frontoffset        = 0,
				fronttexture       = [[muzzleflash_front]],
				length             = 35,
				sidetexture        = [[muzzleflash_side]],
				size               = 2,
				sizegrowth         = 1,
				ttl                = 5,
			},
		},
	},
}
