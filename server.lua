ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("harvestzone:giveItem")
AddEventHandler("harvestzone:giveItem", function(item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addInventoryItem(item, amount)
        
    end
end)
