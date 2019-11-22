AddCSLuaFile("baristaner/config.lua")

habitatfpsbooster = {}

include("baristaner/config.lua")

local function spawn( ply )
local mcore = vgui.Create( "DFrame" )
mcore:SetPos( 5, 5 )
mcore:SetSize( 300, 120 )
mcore:SetTitle( "  " )
mcore:SetVisible( true )
mcore:SetDraggable( true )
mcore:Center()
mcore:ShowCloseButton( false )
mcore:MakePopup()	

local DScrollPanel2 = vgui.Create( "DScrollPanel", mcore )
DScrollPanel2:Dock( FILL )


local mcorebuton = DScrollPanel2:Add( "DButton" )
mcorebuton:SetText( "Multicore Rendering Aktif Et")
mcorebuton:Dock( TOP )
mcorebuton:SetColor(Color(255, 255, 255))
mcorebuton:DockMargin( 0, 0, 0, 5 )

local mcorebuton2 = DScrollPanel2:Add( "DButton" )
mcorebuton2:SetText( "Hayır Teşekkürler")
mcorebuton2:Dock( TOP )
mcorebuton2:SetColor(Color(255, 255, 255))
mcorebuton2:DockMargin( 0, 0, 0, 5 )

mcore.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,Color(50,50,50,255))
end

mcorebuton.DoClick = function()
   RunConsoleCommand("habitatmcore")
   mcore:Close()
end

mcorebuton2.DoClick = function()
  mcore:Close()
end

mcorebuton.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,habitatfpsbooster.butonrengi)
end

mcorebuton2.Paint = function(s,w,h )
  draw.RoundedBox( 0, 0, 0,w,h,Color(0,0,0,255))
  draw.RoundedBox( 0, 2, 2,w-4,h-4,habitatfpsbooster.butonrengi)
end


end

if habitatfpsbooster.multicorerendering then
hook.Add("InitPostEntity","ekran",function()
spawn()
end)
end