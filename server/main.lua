-- Events
RegisterNetEvent('qbx_fireworks:server:placedFirework', function(item)
    local fireworkItems = {
        'firework1',
        'firework2',
        'firework3',
        'firework4',
    }
local sharedConfig = require 'config.shared'

    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    local foundItem = nil

    for i = 1, #fireworkItems do
        if fireworkItems[i] == item then
            foundItem = fireworkItems[i]
            break
        end
    end

    if not foundItem then return end
    player.Functions.RemoveItem(foundItem, 1)
end)

-- Items
exports.qbx_core:CreateUseableItem('firework1', function(source, item)
    TriggerClientEvent('qbx_fireworks:client:usedFirework', source, item.name, 'proj_indep_firework')
end)

exports.qbx_core:CreateUseableItem('firework2', function(source, item)
    TriggerClientEvent('qbx_fireworks:client:usedFirework', source, item.name, 'proj_indep_firework_v2')
end)

exports.qbx_core:CreateUseableItem('firework3', function(source, item)
    TriggerClientEvent('qbx_fireworks:client:usedFirework', source, item.name, 'proj_xmas_firework')
end)

exports.qbx_core:CreateUseableItem('firework4', function(source, item)
    TriggerClientEvent('qbx_fireworks:client:usedFirework', source, item.name, 'scr_indep_fireworks')
end)
