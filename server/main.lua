lib.versionCheck('Qbox-project/qbx_fireworks')

local sharedConfig = require 'config.shared'

for i = 1, #sharedConfig.fireworks do
    local fireworks = sharedConfig.fireworks[i]
    exports.qbx_core:CreateUseableItem(fireworks.itemName, function(source)
        local success = lib.callback.await('qbx_fireworks:client:usedFirework', source, fireworks.assetName)
        if not success then return end
        exports.ox_inventory:RemoveItem(source, fireworks.itemName, 1)
    end)
end
