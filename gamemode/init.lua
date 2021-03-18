
if SERVER then

else 

    positionX = 0
	positionY = 0
	positionZ = 0
end

local function killAll_Players()
	for k,v in pairs (player.GetAll()) do 
		v:Kill() 
	end

	for k,v in pairs (ents.GetAll()) do 
		v:RemoveEffects(EF_NODRAW)
	end
end

local function CreateeTimer( )
	timer.Create( "endGame", 1200, 1, killAll_Players )
end
hook.Add( "Initialize", "Timer Example", CreateeTimer )

function team_Humans( ply ) 
    ply:SetTeam(1)
    ply:Spawn()
    ply:SetArmor(5000) --TODO
    ply:SetRunSpeed(600)
    ply:Give("weapon_shotgun")
    ply:SetHealth(100)
    --ply:SetPos(Vector(1000,1000,0)) --TODO
    ply:GiveAmmo( 20, "Buckshot", true )
    ply:RemoveEffects(EF_NODRAW)
end 

function set_GhostParameters( ply)
	ply:SetArmor(0)
    ply:SetHealth(100)
    ply:AddEffects(EF_NODRAW)
    local weapon = ply:Give("weapon_crowbar")
    weapon:AddEffects(EF_NODRAW)--TODO corregir error de script
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

function GM:SetupMove(ply, movedata)
    if ply:Team() == 1 then
        return
    end

    if ply:Team() == 2 then
        local position = Vector(positionX, positionY, positionZ)
        local weapons = ply:GetWeapons()

        if (position:Distance(ply:GetPos()) > 0) then--si hay movimiento
            ply:RemoveEffects(EF_NODRAW)
            --weapons[1]:RemoveEffects(EF_NODRAW)
        else
            ply:AddEffects(EF_NODRAW)
            --weapons[1]:AddEffects(EF_NODRAW)
        end

        positionX = ply:GetPos()[1]
        positionY = ply:GetPos()[2]
        positionZ = ply:GetPos()[3]
    end

end

function GM:PlayerTick(ply, mv)

    for k,v in pairs (player:GetAll()) do 
        if v:Team() == 1 then -- si es humano
           return
        end
    end

    for k,v in pairs (player.GetAll()) do 
		v:RemoveEffects(EF_NODRAW)
	end

    --TODO falta llamar a la funcion end game
end

function GM:EntityTakeDamage(target, dmg)
    if target:Team() == 1 then 
        print("***************---------------------EntityTakeDamage")
        target:SetHealth(target:Health() - 50)
    end
end
