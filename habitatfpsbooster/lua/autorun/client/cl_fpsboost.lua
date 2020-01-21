AddCSLuaFile("baristaner/config.lua")

habitatfpsbooster = {}

include("baristaner/config.lua")


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

hook.Add("OnPlayerChat", "fpsmenu", function(ply, strText)
    if (ply ~= LocalPlayer()) then return end
    strText = string.lower(strText) -- 
    if (strText == habitatfpsbooster.fpsboostercommand) then
    fpsboostermenu()
    end
  end)

concommand.Add( "habitatfpsboost", function( ply )
		ply:ChatPrint( habitatfpsbooster.fpsboosteractivemsg )
		RunConsoleCommand( "mat_antialias", "0" )
		RunConsoleCommand( "cl_detaildist", "0" )
		RunConsoleCommand( "cl_detailfade", "0" )
		RunConsoleCommand( "cl_drawmonitors", "0" )
		RunConsoleCommand( "cl_ejectbrass", "0" )
		RunConsoleCommand( "mat_envmapsize", "8" )
		RunConsoleCommand( "mat_envmaptgasize", "8" )
		RunConsoleCommand( "mat_hdr_level", "0" )
		RunConsoleCommand( "mat_max_worldmesh_vertices", "512" )
		RunConsoleCommand( "mat_motion_blur_enabled", "0" )
		RunConsoleCommand( "mat_parallaxmap", "0" )
		RunConsoleCommand( "mat_picmip", "2" )
		RunConsoleCommand( "mat_reduceparticles", "1" )
		RunConsoleCommand( "mp_decals", "1" )
		RunConsoleCommand( "r_propsmaxdist", "0" )
		RunConsoleCommand( "r_waterdrawreflection", "0" )
		RunConsoleCommand( "gmod_mcore_test", "1" )
		RunConsoleCommand( "mat_queue_mode", "-1" )
		RunConsoleCommand( "cl_threaded_bone_setup", "1" )
		RunConsoleCommand( "cl_detailfade", "800" )
		RunConsoleCommand( "cl_smooth", "0" )
		RunConsoleCommand( "m9kgaseffect", "0" )
		RunConsoleCommand( "mat_bloom_scalefactor_scalar", "1" )
    RunConsoleCommand( "cl_detaildist", "2" )
    RunConsoleCommand( "cl_detailfade", "1" )	
		RunConsoleCommand( "r_WaterDrawReflection", "0" )
    RunConsoleCommand( "r_waterforceexpensive", "0" )
    RunConsoleCommand( "r_shadows", "0" )
    RunConsoleCommand( "mat_disable_bloom", "1" )
		RunConsoleCommand( "r_threaded_client_shadow_manager", "1" )
    RunConsoleCommand( "r_threaded_particles", "1" )
    RunConsoleCommand( "r_threaded_renderables", "1" )
    RunConsoleCommand( "r_queued_ropes", "1" )
    RunConsoleCommand( "r_drawmodeldecals", "0" )
    RunConsoleCommand( "mat_queue_mode", "-1" )
    RunConsoleCommand( "studio_queue_mode", "1" )	
    --TFA GUNS
    if habitatfpsbooster.tfaguns then
    RunConsoleCommand("cl_tfa_fx_impact_enabled","0")
    RunConsoleCommand("cl_tfa_fx_gasblur", "0")
    RunConsoleCommand("cl_tfa_fx_muzzlesmoke", "0")
  end
end)

concommand.Add( "habitatfpsboostgerial", function( ply )
		RunConsoleCommand( "mat_antialias", "1" )
		RunConsoleCommand( "cl_detaildist", "1" )
		RunConsoleCommand( "cl_detailfade", "1" )
		RunConsoleCommand( "cl_drawmonitors", "1" )
		RunConsoleCommand( "cl_ejectbrass", "1" )
		RunConsoleCommand( "mat_envmapsize", "8" )
		RunConsoleCommand( "mat_envmaptgasize", "8" )
		RunConsoleCommand( "mat_hdr_level", "1" )
		RunConsoleCommand( "mat_max_worldmesh_vertices", "512" )
		RunConsoleCommand( "mat_motion_blur_enabled", "1" )
		RunConsoleCommand( "mat_parallaxmap", "1" )
		RunConsoleCommand( "mat_picmip", "2" )
		RunConsoleCommand( "mat_reduceparticles", "1" )
		RunConsoleCommand( "mp_decals", "1" )
		RunConsoleCommand( "r_propsmaxdist", "1" )
		RunConsoleCommand( "r_waterdrawreflection", "1" )
		RunConsoleCommand( "gmod_mcore_test", "0" )
		RunConsoleCommand( "mat_queue_mode", "-1" )
		RunConsoleCommand( "cl_threaded_bone_setup", "0" )
		RunConsoleCommand( "cl_detailfade", "800" )
		RunConsoleCommand( "cl_smooth", "1" )
		RunConsoleCommand( "m9kgaseffect", "1" )
        --TFA GUNS
      if habitatfpsbooster.tfaguns then
    RunConsoleCommand("cl_tfa_fx_impact_enabled","1")
    RunConsoleCOmmand("cl_tfa_fx_gasblur", "1")
    RunConsoleCOmmand("cl_tfa_fx_muzzlesmoke", "1")
  end
end)

concommand.Add( "habitatfpsboostinternet", function( ply ) 
		ply:ChatPrint( habitatfpsbooster.fpsboosterinternetmsg )
		RunConsoleCommand( "cl_interp", "0" )
		RunConsoleCommand( "cl_interp_ratio", "2" )
		RunConsoleCommand( "cl_lagcompensation", "1" )
		RunConsoleCommand( "cl_pred_optimize", "2" )
		RunConsoleCommand( "cl_smooth", "0" )
		RunConsoleCommand( "cl_smoothtime", "0.1" )
end)

concommand.Add( "habitatmcore", function( ply ) 
    LocalPlayer():ConCommand("gmod_mcore_test 1")
    LocalPlayer():ConCommand("mat_queue_mode -1")
    LocalPlayer():ConCommand("cl_threaded_bone_setup 1")
    LocalPlayer():ConCommand("cl_threaded_client_leaf_system 1")
    LocalPlayer():ConCommand("r_threaded_particles 1")
    LocalPlayer():ConCommand("r_threaded_renderables 1")
    LocalPlayer():ConCommand("r_queued_ropes 1")
    LocalPlayer():ConCommand("studio_queue_mode 1")
end)

if habitatfpsbooster.enablefog then
hook.Add("SetupWorldFog", "habitatfpsbooster", function()
if globalFogDed then
render.FogMode(1)
render.FogStart(globalFogDed - 600)
render.FogEnd(globalFogDed - 200)
render.FogMaxDensity(1)
local col = Vector(0.8, 0.8, 0.8)
render.FogColor(col.x * 255, col.y * 255, col.z * 255)

return true
end
end)

if habitatfpsbooster.enablefog then
hook.Add("SetupSkyboxFog", "habitatfpsboostersis", function()
if globalFogDed then
render.FogMode(MATERIAL_FOG_LINEAR)
render.FogStart((globalFogDed - 600) / 16 - (200 / 16))
render.FogEnd(globalFogDed / 16 - (200 / 16))
render.FogMaxDensity(1)
local col = Vector(0.8, 0.8, 0.8)
render.FogColor(col.x * 255, col.y * 255, col.z * 255)

return true
end
end)
else
return
end
else
return
end




