RegisterCommand( 'car', function(source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Oppsie, '.. vehicleName .. ' is not a vehicle.'}
        })

        return
    end

    TriggerEvent('chat:addMessage', {
        args = { 'Noice, '.. vehicleName .. ' is a vehicle.'}
    })
    
    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local playerVehicle = CreateVehicle(
        vehicleName, 
        playerPos,
        playerHeading,
        true
    )
    -- (-1 Diver)
    SetPedIntoVehicle(playerPed, playerVehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)