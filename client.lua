local a = true

local DrawTextFormat = function(x, y, text, entry)
    AddTextEntry(entry, text)
    SetTextFont(0) SetTextProportional(0) SetTextScale(0.42, 0.42) SetTextDropShadow(0, 0, 0, 0, 255) SetTextEdge(1, 0, 0, 0, 255) SetTextColour(255, 255, 255, 255)
    BeginTextCommandDisplayText(entry)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while a == true do
        local coords = GetEntityCoords(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        DrawTextFormat(0.01, 0.0, "X: "..tostring(coords[1]), "x-coord")
        DrawTextFormat(0.01, 0.0250, "Y: "..tostring(coords[2]), "y-coord")
        DrawTextFormat(0.01, 0.05, "Z: "..tostring(coords[3]), "z-coord")
        DrawTextFormat(0.01, 0.075, "H: "..tostring(heading), "h-coord")
        Citizen.Wait(1)
    end
end)

-- RegisterCommand("araba", function(source, args, raw)
--     local model = args[1]

--     if model ~= nil then
--         local modelHash = GetHashKey(model)
--         RequestModel(modelHash)
--         local isLoaded = HasModelLoaded(modelHash)
--         while isLoaded == false do
--             Citizen.Wait(100)
--         end
--         local vehicle = CreateVehicle(modelHash, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1, 0)
--         SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
--     end
-- end)

local test = {1, 2 , 3, 4, 5, 6, 7, 8, 9, 10}

RegisterCommand("say", function()
    for i = 1, #test, 1 do
        print(test[i])
        Citizen.Wait(1000) -- 1 saniye
    end
end)

RegisterCommand("araba", function(source, args, raw)
    local model = args[1]
    local serverId = args[2]
    TriggerServerEvent("printHello", model, serverId)
end)

RegisterNetEvent("arabaSpawnla")
AddEventHandler("arabaSpawnla", function(model, mesaj)
    print(mesaj)
    if model ~= nil then
        local modelHash = GetHashKey(model)
        RequestModel(modelHash)
        local isLoaded = HasModelLoaded(modelHash)
        while isLoaded == false do
            Citizen.Wait(100)
        end
        local vehicle = CreateVehicle(modelHash, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1, 0)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
end)