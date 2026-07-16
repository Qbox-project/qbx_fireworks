lib.versionCheck('Qbox-project/qbx_fireworks')

local config = require 'config.shared'
local placementTokens = {}

---@param model string
---@param coords vector3
---@param initiate boolean
local function spawnFireworkObject(model, coords, initiate)
    local entity = CreateObject(joaat(model), coords.x, coords.y, coords.z, true, true, false)
    local timeout = GetGameTimer() + 5000
    while not DoesEntityExist(entity) and GetGameTimer() < timeout do
        Wait(0)
    end
    if not DoesEntityExist(entity) then return end

    if initiate then Entity(entity).state:set('qbx_fireworks:initiate', true, true) end
    SetTimeout((config.detonationTime * 1000) + 26000, function()
        if DoesEntityExist(entity) then DeleteEntity(entity) end
    end)
end

for asset, item in pairs(config.fireworks) do
    exports.qbx_core:CreateUseableItem(item.itemName, function(source)
        if config.needLighter then
            local hasLighter = exports.ox_inventory:Search(source, 'count', 'lighter') > 0
            if not hasLighter then
                return exports.qbx_core:Notify(source, locale('need_lighter'), 'error')
            end
        end

        if exports.ox_inventory:GetItemCount(source, item.itemName) < 1 then return end
        placementTokens[source] = {
            item = item.itemName,
            expiresAt = os.time() + 15,
        }
        local success = lib.callback.await('qbx_fireworks:client:useFirework', source, asset)
        if not success then placementTokens[source] = nil end
    end)
end

RegisterNetEvent('qbx_fireworks:server:spawnObject', function(coords)
    local src = source
    local token = placementTokens[src]
    placementTokens[src] = nil
    if not token or token.expiresAt < os.time() or type(coords) ~= 'vector3' then return end

    local ped = GetPlayerPed(src)
    if ped == 0 or #(GetEntityCoords(ped) - coords) > 5.0
        or not exports.ox_inventory:RemoveItem(src, token.item, 1) then return end

    spawnFireworkObject('ind_prop_firework_03', coords, true)
end)

AddEventHandler('qbx_fireworks:server:spawnShowObject', function(model, coords)
    if type(model) ~= 'string' or type(coords) ~= 'vector3' then return end
    spawnFireworkObject(model, vec3(coords.x, coords.y, coords.z - 1), false)
end)

AddEventHandler('playerDropped', function()
    placementTokens[source] = nil
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
