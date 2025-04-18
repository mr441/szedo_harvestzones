ESX = exports['es_extended']:getSharedObject()

local playerPed = nil
local cooldowns = {}

-- Player entity update
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        playerPed = PlayerPedId()
    end
end)

-- Marker and interactions
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(playerPed)

        for i, zone in ipairs(Config.HarvestZones) do
            -- Iterate over all coordinates of the zone
            for j, coord in ipairs(zone.coords) do
                local dist = #(coords - coord)

                -- If the marker has a cooldown and the cooldown has not expired, it should not appear
                if not cooldowns[i] or not cooldowns[i][j] or GetGameTimer() > cooldowns[i][j] then
                    if dist < 20.0 then
                        -- Marker drawing
                        DrawMarker(1, coord.x, coord.y, coord.z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.0,
                            zone.markerColor.r, zone.markerColor.g, zone.markerColor.b, 100, false, true, 2, false, nil, nil, false)

                        -- Interaction and farming
                        if dist < 1.5 then
                            ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to farm ~b~" .. zone.item)
                            if IsControlJustReleased(0, 38) then
                                HarvestItem(zone, i, j)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Farming management + notify + cooldown + animation
function HarvestItem(zone, index, coordIndex)
    -- load and start animation, if specified
    if zone.animation then
        local dict = zone.animation.dict
        local anim = zone.animation.name
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
        TaskPlayAnim(playerPed, dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    end

    -- progress bar
    Config.Progress(zone.time, "Collection: " .. zone.item, function(success)
        -- stop animation
        ClearPedTasks(playerPed)

        if success then
            -- Sending an object via a server
            TriggerServerEvent("harvestzone:giveItem", zone.item, zone.amount)

            -- Set cooldown for given coordinate
            local cooldownMs = (zone.cooldown or 10) * 1000
            if not cooldowns[index] then
                cooldowns[index] = {}
            end
            cooldowns[index][coordIndex] = GetGameTimer() + cooldownMs

            -- OKOKNOTIFY notification
            Config.Notify("You have successfully collected " .. zone.amount .. "x " .. zone.item .. " object.")
        end
    end)
end
