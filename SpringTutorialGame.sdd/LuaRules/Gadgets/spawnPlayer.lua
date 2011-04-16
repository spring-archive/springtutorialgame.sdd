function gadget:GetInfo()
	return {
		name = "SpawnPlayer",
		desc = "Simple gadget for spawning a player's initial unit",
		author = "KDR_11k (David Becker)",
		date = "2010-08-30",
		license = "Public Domain",
		layer = -255,
		enabled = true
	}
end

if (gadgetHandler:IsSyncedCode()) then

--SYNCED

function gadget:GameFrame()
	for _,t in ipairs(Spring.GetTeamList()) do
		local _,_,_,ai,faction = Spring.GetTeamInfo(t)
		local unitname = Spring.GetSideData(faction)
		if unitname then
			local sx,sy,sz = Spring.GetTeamStartPosition(t)
			Spring.CreateUnit(unitname,sx,sy,sz,0,t)
		end
	end
	gadgetHandler:RemoveGadget("SpawnPlayer")
end

else

--UNSYNCED

return false

end
