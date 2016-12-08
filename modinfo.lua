--http://springrts.com/wiki/Modinfo.lua
local modinfo = {
	name = "Spring Tutorial Game",
	shortname = "STG",
	game = "STG",
	shortgame = "STG",
	description = "Basic game to help new modders",
	url = "code.google.com/p/springtutorialgame",
	version = "0.1", --when zipping .sdz for releasing make this a full integer like 1,2,3
	modtype = 1,
	depend = {
		"cursors.sdz",
	}
}
return modinfo