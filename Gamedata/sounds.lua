local Sounds = {
	SoundItems = {
		--- RESERVED FOR SPRING, DON'T REMOVE
		IncomingChat = {
			file = "sounds/incoming_chat.wav",
			 rolloff = 0.1, 
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		MultiSelect = {
			file = "sounds/multiselect.wav",
			 rolloff = 0.1, 
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		MapPoint = {
			file = "sounds/mappoint.wav",
			rolloff = 0.1,
			maxdist = 10000,
			priority = 100, --- higher numbers = less chance of cutoff
			maxconcurrent = 1, ---how many maximum can we hear?
		},
		--- END RESERVED

--WEAPONS
--[[
		gclaser2_fire = { 
            file = "sounds/gclaser2_fire.wav", 
			rolloff=3, dopplerscale = 0, maxdist = 6000,


			priority = 10, --- higher numbers = less chance of cutoff
			maxconcurrent = 2, ---how many maximum can we hear?
		},
]]--
		--[[DefaultsForSounds = { -- this are default settings
			file = "ThisEntryMustBePresent.wav",
			gain = 1.0,
			pitch = 1.0,
			priority = 0,
			maxconcurrent = 16, --- some reasonable limits
			--maxdist = FLT_MAX, --- no cutoff at all
		},
		--- EXAMPLE ONLY!
		MyAwesomeSound = {			
			file = "sounds/booooom.wav",
			preload, -- put in memory!
			loop,  -- loop me!
			looptime=1000, --- milliseconds!
			gain = 2.0, --- for uber-loudness
			pitch = 0.2, --- bass-test
			priority = 15, --- very high
			maxconcurrent = 1, ---only once
			--maxdist = 500, --- only when near
		},]]
	},
}

return Sounds
