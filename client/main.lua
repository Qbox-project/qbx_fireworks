local sharedConfig = require 'config.shared'

local function startFirework(asset)
    local particles, time, location
    local coords = GetEntityCoords(cache.ped)

    location = {x = coords.x, y = coords.y, z = coords.z}
    time = sharedConfig.detonationTime

    for i = 1, #sharedConfig.fireworks do
        local fireworks = sharedConfig.fireworks[i]
        lib.requestNamedPtfxAsset(fireworks.assetName, 5000)
        if fireworks.assetName == asset then
            particles = fireworks.particleList
        end
    end
    
    CreateThread(function()
        while time > 0 do
            Wait(1000)
            time -= 1
        end
        
        UseParticleFxAsset('scr_indep_fireworks')

        for _ = 1, math.random(5, 10), 1 do
            local firework = particles[math.random(1, #particles)]
            UseParticleFxAsset(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, location.x, location.y, location.z + 42.5, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            Wait(math.random() * 500)
        end

        location = nil
        particles = nil
    end)
end

RegisterNetEvent('qbx_fireworks:client:usedFirework', function(item, asset)
    if lib.progressBar({
        duration = 3000,
        label = Lang:t('placing'),
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
        },
        prop = {

        },
    }) then
        TriggerServerEvent('qbx_fireworks:server:placedFirework', item)
        startFirework(asset)
    else
        exports.qbx_core:Notify(Lang:t('canceled'), 'error')
    end
end)
