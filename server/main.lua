RegisterServerEvent('blinded_veh_keys:givePlayerVehicleKey')
AddEventHandler('blinded_veh_keys:givePlayerVehicleKey', function (plateNumber)
    --First we want to be sure that the plate is associated to a veh in our DB.
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.single('SELECT COUNT(*) as nb FROM `owned_vehicles` WHERE plate = ?', {plateNumber}, function(result)
        if result.nb == 1 then
            --Then we give the key to the player.
            exports.ox_inventory:AddItem(xPlayer.playerId, 'car_key', 1, {label = plateNumber, image = "car_key", weight = 1})
        else
            -- We should implement log system.
        end
    end)
end)

ESX.RegisterCommand('givecarkey', 'admin', function(xPlayer, args, showError)
    MySQL.single('SELECT COUNT(*) as nb FROM `owned_vehicles` WHERE plate = ?', {args.plateNumber}, function(result)
        if result.nb == 1 then
            --Then we give the key to the player.
            exports.ox_inventory:AddItem(args.playerId, 'car_key', 1, {label = args.plateNumber, image = "car_key", weight = 1})
            xPlayer.showNotification(Locales['en']['command_givecarkey_succeed'], false, true, 210)
        else
            xPlayer.showNotification(Locales['en']['plate_notrelated'], false, true, 130)
        end
    end)
  end, true, {help = Locales['en']['command_givecarkey'], validate = true, arguments = {
    {name = 'playerId', Locales['en']['command_playerId'], type = 'number'},
    {name = 'plateNumber', help = Locales['en']['command_platenumber'], type = 'string'}
}})