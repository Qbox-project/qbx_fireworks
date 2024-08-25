lib.versionCheck('Qbox-project/qbx_fireworks')

local config = require 'config.shared'

for asset, item in pairs(config.fireworks) do
    exports.qbx_core:CreateUseableItem(item.itemName, function(source)
        if config.needLighter then
            local hasLighter = exports.ox_inventory:Search(source, 'count', 'lighter') > 0
            if not hasLighter then
                return exports.qbx_core:Notify(source, locale('need_lighter'), 'error')
            end
        end

        local success = lib.callback.await('qbx_fireworks:client:useFirework', source, asset)
        if not success then return end
        exports.ox_inventory:RemoveItem(source, item.itemName, 1)
    end)
end

RegisterNetEvent('qbx_fireworks:server:spawnObject', function(model, coords)
    local hash = joaat(model)
    local entity = CreateObject(hash, coords.x, coords.y, coords.z, true, true, false)
    while not DoesEntityExist(entity) do
        Wait(0)
    end
    Entity(entity).state:set('qbx_fireworks:initiate', true, true)
    SetTimeout((config.detonationTime * 1000) + 26000, function()
        DeleteEntity(entity)
    end)
end)

RegisterNetEvent('qbx_fireworks:server:spawnShowObject', function(model, coords)
    local hash = joaat(model)
    local entity = CreateObject(hash, coords.x, coords.y, coords.z - 1, true, true, false)
    while not DoesEntityExist(entity) do
        Wait(0)
    end
    SetTimeout((config.detonationTime * 1000) + 26000, function()
        DeleteEntity(entity)
    end)
end)

local function startShow(showName)
    local show = config.shows[showName]
    if not show then return end
    for i = 1, #show.fireworks do -- Sequences
        local firework = show.fireworks[i]
        local particles = config.fireworks[firework.asset].particleList
        local fireworkEffects = {}
        for _ = 1, math.random(10,15), 1 do
            fireworkEffects[#fireworkEffects+1] = {
                particle = particles[math.random(1, #particles)]
            }
        end
        TriggerEvent('qbx_fireworks:server:spawnShowObject', 'ind_prop_firework_03', firework.coords)
        TriggerClientEvent('qbx_fiureworks:client:startShow', -1, firework.asset, firework.coords, firework.height, fireworkEffects)
        Wait(firework.wait)
    end
end

exports('StartShow', startShow)

lib.addCommand('startshow', {
    help = locale('start_show_desc'),
    params = {
        { name = "Location", help = locale('start_show_param_hint'), type = 'string' }
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    startShow(args.Location)
end)