local sharedConfig = require 'config.shared'

AddStateBagChangeHandler('qbx_fireworks:initiate', nil, function(bagName, _, value)
    local entity = GetEntityFromStateBagName(bagName)
    if entity == 0 then return end
    if value and NetworkGetEntityOwner(entity) == cache.playerId then
        PlaceObjectOnGroundProperly(entity)
	    FreezeEntityPosition(entity, true)
        Entity(entity).state:set('qbx_fireworks:initiate', false, true)
    end
end)

local function startFirework(asset, entityCoords)
    local time
    local coords = GetEntityCoords(cache.ped)

    time = sharedConfig.detonationTime

    lib.requestNamedPtfxAsset(asset, 5000)
    lib.requestNamedPtfxAsset('core', 5000)


    local particles = sharedConfig.fireworks[asset].particleList
    CreateThread(function()
        while time > 0 do
            Wait(1000)
            time -= 1
        end
        for _ = 1, math.random(10, 15), 1 do
            local firework = particles[math.random(1, #particles)]
            UseParticleFxAsset('core')
            StartNetworkedParticleFxNonLoopedAtCoord('sp_foundry_sparks', entityCoords.x, entityCoords.y, entityCoords.z + 1.2, 0.0, 0.0, 0.0, .5, false, false, false)
            AddExplosion(entityCoords.x, entityCoords.y, entityCoords.z, 45, 0, true, true, 0)
            Wait(750)
            UseParticleFxAsset(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, coords.x, coords.y, coords.z + 50.0, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            AddExplosion(coords.x, coords.y, coords.z + 50, 61, 0, true, true, 0)
            Wait(1000)
        end
    end)
    RemoveNamedPtfxAsset(asset)
    RemoveNamedPtfxAsset('core')
end

lib.callback.register('qbx_fireworks:client:useFirework', function(asset)
    if lib.progressBar({
        duration = 3000,
        label = locale('placing'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true,
        },
        anim = {
            dict = 'anim@mp_fireworks',
            clip = 'place_firework_3_box',
            flag = 0,
            blendIn = 8.0,
        },
        prop = {
            model = 'ind_prop_firework_03',
            pos = vec3(0.07, 0.04, 0.08),
            rot = vec3(-45.0, 220.0, 0.0),
        },
    }) then -- if completed
        local coords = GetOffsetFromEntityInWorldCoords(cache.ped, 0, 0.6, -2.0)
        TriggerServerEvent('qbx_fireworks:server:spawnObject', 'ind_prop_firework_03', coords)
        startFirework(asset, coords)
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('canceled'), 'error')
        return false
    end
end)
