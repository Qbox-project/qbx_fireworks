lib.versionCheck('Qbox-project/qbx_fireworks')

local fireworks = require 'config.shared'.fireworks

for k, v in pairs(fireworks) do
    exports.qbx_core:CreateUseableItem(v.itemName, function(source)
        local success = lib.callback.await('qbx_fireworks:client:useFirework', source, k)
        if not success then return end
        exports.ox_inventory:RemoveItem(source, v.itemName, 1)
    end)
end