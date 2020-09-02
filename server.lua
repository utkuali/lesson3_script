RegisterServerEvent("printHello")
AddEventHandler("printHello", function(model, serverId)
    --local src = source
    print("^2Hello world!^0")
    TriggerClientEvent("arabaSpawnla", serverId, model, "Aracınız hazır!")
end)