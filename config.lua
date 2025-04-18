Config = {}

Config.Notify = function(msg)
    TriggerEvent('okokNotify:Alert', "Harvest", msg, 5000, 'info')
end

Config.Progress = function(time, text, cb)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "harvest_action",
        duration = time,
        label = text,
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(cancelled)
        cb(not cancelled)
    end)
end

Config.HarvestZones = {
    {
        name = "Iron Mine",
        coords = {
            vector3(2947.0, 2780.0, 40.0),
            vector3(2950.0, 2782.0, 40.0),  -- another coordinate
            vector3(2949.8157, 2777.1643, 39.3397)   -- another coordinate
        },
        markerColor = {r = 0, g = 102, b = 255},
        item = "iron",
        amount = 1,
        time = 5000,
        cooldown = 10,
        animation = {dict = "amb@world_human_gardener_plant@male@enter", name = "enter"}
    },
    {
        name = "Scrap Area",
        coords = {
            vector3(2350.0, 3130.0, 48.0),
            vector3(2353.0, 3135.0, 48.0)  -- another coordinate
        },
        markerColor = {r = 0, g = 102, b = 255},
        item = "scrapmetal",
        amount = 2,
        time = 6000,
        cooldown = 15,
        animation = {dict = "amb@world_human_gardener_plant@male@enter", name = "enter"}
    }
}
