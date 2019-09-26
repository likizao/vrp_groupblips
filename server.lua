local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","vrp_groupblips")

blips = {
    ["police.base"] = {['x'] = 62.78, ['y'] = 51.22, ['z'] = 1712.25, ["blipid"] = 456, ["idcolor"] = 2, ["text"] = "Ilegal Local"},
    ["trafico.base"] = {['x'] = 1578.56, ['y'] = 895.52, ['z'] = 3223.154, ["blipid"] = 52, ["idcolor"] = 2, ["text"] = "Colheita de Erva"},
}

-- Blip quando logar.
AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
    if first_spawn then 
        for k,v in pairs(blips) do 
            if vRP.hasPermission({user_id,k}) then 
                vRPclient.addBlip(source,{v.x,v.y,v.z,v.blipid,v.idcolor,v.text})
            end
        end
    end
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
    local player = vRP.getUserSource({user_id})
        for k,v in pairs(blips) do 
            -- Blip quando entrar em algum outro grupo.
            if vRP.hasPermission({user_id,k}) then 
                vRPclient.addBlip(player,{v.x,v.y,v.z,v.blipid,v.idcolor,v.text})
            end
    end
end)