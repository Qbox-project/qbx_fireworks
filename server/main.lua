lib.versionCheck('Qbox-project/qbx_fireworks')

local fireworks = require 'config.shared'.fireworks

for asset, item in pairs(fireworks) do
    exports.qbx_core:CreateUseableItem(item.itemName, function(source)
        local success = lib.callback.await('qbx_fireworks:client:useFirework', source, asset)
        if not success then return end
        exports.ox_inventory:RemoveItem(source, item.itemName, 1)
    end)
end