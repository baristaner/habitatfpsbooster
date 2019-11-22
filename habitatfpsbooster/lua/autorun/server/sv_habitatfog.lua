--[[

Sis Ekler

--]]

AddCSLuaFile("baristaner/config.lua")

habitatfpsbooster = {}

include("baristaner/config.lua")

if habitatfpsbooster.enableserverfog then
    entFog = false

    function DedrussFPSfix()
        for k, v in ipairs(ents.GetAll()) do
            if v:GetClass() == "env_fog_controller" then
                v:SetKeyValue("fogend", 2000)
                v:SetKeyValue("fogstart", 500)
                v:SetKeyValue("farz", 2000)
                entFog = v
                break
            end
        end

        if not entFog then
            v = ents.Create("env_fog_controller")
            v:SetKeyValue("fogend", 2000)
            v:SetKeyValue("fogstart", 500)
            v:SetKeyValue("farz", 2000)
            v:Spawn()
            entFog = v
        end
    end

    hook.Add("Initialize", "dedrussfpsfix", DedrussFPSfix)

    function SetFpsFix(size)
        entFog:SetKeyValue("farz", size)
    end
else
    return
end
