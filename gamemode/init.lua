
if SERVER then



else 

end


function team_Humans( ply ) 
    ply:SetTeam(1)
    ply:Spawn()
    ply:SetArmor(0)
    ply:SetRunSpeed(600)
    ply:Give("weapon_shotgun")
    ply:SetHealth(5)
    --ply:SetPos(Vector(1000,1000,0)) --TODO
    ply:GiveAmmo( 20, "Buckshot", true )
	
end 

function set_GhostParameters( ply)
	ply:SetArmor(0)
    ply:SetHealth(1)
    ply:AddEffects(EF_NODRAW)
    ply:Give("weapon_crowbar")
    ply:SetRunSpeed(1800)
end

function team_Ghosts( ply ) 
    ply:SetTeam(2)
    ply:Spawn()
	set_GhostParameters(ply)
    -- ply:SetPos(Vector(1000,1000,0)) --TODO
end 

concommand.Add( "team_Humans", team_Humans )
concommand.Add( "team_Ghosts", team_Ghosts )

function GM:PlayerInitialSpawn( ply )
	ply:ConCommand( "team_menu" ) 
end

function GM:SetupMove( ply, movedata )
end

function GM:PlayerLoadout( ply )
end 

function GM:PlayerDeath(victim, inflictor, attacker )
	if victim:Team() == 1 then
		victim:SetTeam(2)
		print(victim:Team())
	end
end

function GM:PlayerSpawn(player, transition)
	set_GhostParameters(player)
end




