exports('car_key', function(data, slot)

    --We get the nearest vehicle from the player.
    local vehicle = ESX.Game.GetClosestVehicle()

    --Deleting whitespace in labels to match pefectly.
    local vehiclePlateName = string.gsub(GetVehicleNumberPlateText(vehicle), "%s+", "")
    local carKeyLabel = string.gsub(slot.metadata.label, "%s+", "")

    -- If the player have key then we proceed, otherwise, nothing happen.
    if(vehiclePlateName == carKeyLabel) then
        local lockState = GetVehicleDoorLockStatus(vehicle)
        if(lockState == 0 or lockState == 1) then
            SetVehicleDoorsLocked(vehicle, 2)
            ESX.ShowNotification('Vehicle locked.', false, true, 140)
        else
            SetVehicleDoorsLocked(vehicle, 1)
            ESX.ShowNotification('Vehicle unlocked.', false, true, 140)
        end
    end
end)