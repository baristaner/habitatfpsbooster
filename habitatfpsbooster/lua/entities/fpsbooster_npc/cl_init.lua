include("shared.lua")



surface.CreateFont( "trebuchet50", {
    font = "Trebuchet MS", 
    size = ScreenScale(17),
    weight = 500,
    antialias = true,
})

surface.CreateFont( "trebuchet35", {
    font = "Trebuchet MS", 
    size = ScreenScale(10),
    weight = 500,
    antialias = true,
})

surface.CreateFont( "trebuchet20", {
    font = "Trebuchet MS", 
    size = ScreenScale(7.5),
    weight = 500,
    antialias = true,
})

local function fpsboostermenu()
local fps = vgui.Create( "DFrame" )
fps:SetPos( 5, 5 )
fps:SetSize( 300, 120 )
fps:SetTitle( "  " )
fps:SetVisible( true )
fps:SetDraggable( true )
fps:Center()
fps:ShowCloseButton( false )
fps:MakePopup()

local DScrollPanel = vgui.Create( "DScrollPanel", fps )
DScrollPanel:Dock( FILL )


local fpsbuton = DScrollPanel:Add( "DButton" )
fpsbuton:SetText( "FPS Arttır")
fpsbuton:Dock( TOP )
fpsbuton:SetColor(Color(255, 255, 255))
fpsbuton:DockMargin( 0, 0, 0, 5 )

local fpsbuton2 = DScrollPanel:Add( "DButton" )
fpsbuton2:SetText( "FPS Arttırmayı Geri Al")
fpsbuton2:SetColor(Color(255, 255, 255))
fpsbuton2:Dock( TOP )
fpsbuton2:DockMargin( 0, 0, 0, 5 )

local fpsbuton3 = DScrollPanel:Add( "DButton" )
fpsbuton3:SetText( "İnterneti Optimize Et")
fpsbuton3:SetColor(Color(255, 255, 255))
fpsbuton3:Dock( TOP )
fpsbuton3:DockMargin( 0, 0, 0, 5 )


fps.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,Color(50,50,50,255))
end

local kapat2 = vgui.Create( "DButton", fps ) 
kapat2:SetText( "X" )         
kapat2:SetPos( 270, 0 )
kapat2:SetColor(Color(255, 255, 255))         
kapat2:SetSize( 30, 25 )          
kapat2.DoClick = function()       
  fps:Close()  
end

fpsbuton.DoClick = function()
   RunConsoleCommand("habitatfpsboost")
end

fpsbuton2.DoClick = function()
  RunConsoleCommand("habitatfpsboostgerial")
end

fpsbuton3.DoClick = function()
  RunConsoleCommand("habitatfpsboostinternet")
end



kapat2.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,Color(139,0,0,255))
end

fpsbuton.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,habitatfpsbooster.butonrengi)
end

fpsbuton2.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,habitatfpsbooster.butonrengi)
end

fpsbuton3.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,habitatfpsbooster.butonrengi)
end


end


function ENT:Draw()

    self:DrawModel()

    if ( IsValid( self ) && LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 ) then

         local ang = Angle( 0, ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "yaw" ], ( LocalPlayer():GetPos() - self:GetPos() ):Angle()[ "pitch" ] ) + Angle( 0, 90, 90 )

        cam.IgnoreZ( false )
        cam.Start3D2D( self:GetPos() + Vector( 2, 0, 78 ), ang, .1 )

            draw.RoundedBox(0,-80,-20,146,40, Color(0,170,204,255))
            draw.SimpleTextOutlined( self:GetNWString( "HeaderText", "FPS Arttirici" ), "trebuchet50", -10, 0, Color( 2361, 666, 650, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, .5, Color( 0, 0, 0, 255 ) )
        cam.End3D2D()
    end
end

net.Receive("ShopNPCUsed3",function()
	fpsboostermenu()
end)
