include( "shared.lua" )
print("Client Garrys Ghostbusters loaded! ------")

function set_team()
    local Frame = vgui.Create("DFrame");
    local W =300;
    local H =300;
    Frame:SetSize(W,H);
    Frame:SetPos(ScrW()/2 -W/2, ScrH()/2-H/2)
    Frame:ShowCloseButton(false)
    Frame:SetTitle("Change Team")
    Frame:MakePopup( ); 
    local GhostButton = vgui.Create("DImageButton", Frame)
    GhostButton:SetImage("materials/sprites/ghost2.png")
    GhostButton:SetPos(10,30)
    GhostButton:SetSize(120,260)
    function GhostButton:DoClick()
        Frame:SetVisible(false)
        RunConsoleCommand("team_Ghosts") 
    end

    local HumanButton = vgui.Create( "DImageButton", Frame ); 
    HumanButton:SetImage("materials/sprites/human.png")
    HumanButton:SetPos( 160, 30 );
    HumanButton:SizeToContents()
    HumanButton:SetSize(120,260);
    function HumanButton:DoClick()
        Frame:SetVisible( false ); 
        RunConsoleCommand("team_Humans") 
    end
    
end
concommand.Add( "team_menu", set_team )
