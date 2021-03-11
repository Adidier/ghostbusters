if SERVER then
 	AddCSLuaFile()
 	AddCSLuaFile('cl_garrysGhostbusters.lua')
 	AddCSLuaFile('sh_garrysGhostbusters.lua')

    include('sh_garrysGhostbusters.lua')
 	print("Garrys Ghostbusters loaded! ------")
end

if CLIENT then
	include('cl_garrysGhostbusters.lua')
end

function GM:PlayerInitialSpawn( ply )
end

function GM:SetupMove( ply, movedata )
end

function GM:PlayerLoadout( ply )
end 




