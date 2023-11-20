lib.versionCheck('Qbox-project/qbx_fireworks')

local sharedConfig = require 'config.shared'

RegisterNetEvent('qbx_fireworks:server:placedFirework', function(item)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    
    exports.ox_inventory:RemoveItem(source, item, 1)
end)

for i = 1, #sharedConfig.fireworks do
    local fireworks = sharedConfig.fireworks[i]
    exports.qbx_core:CreateUseableItem(fireworks.itemName, function(source, item)
        TriggerClientEvent('qbx_fireworks:client:usedFirework', source, item.name, fireworks.assetName)
    end)
end
