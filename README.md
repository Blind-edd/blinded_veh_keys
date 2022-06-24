# Blinded - Vehicle lock system
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/GeD5iBq.png">
  <source media="(prefers-color-scheme: light)" srcset="hhttps://i.imgur.com/lWAQ0t1.png">
  <img alt="Blind-ed logo fivem." src="https://i.imgur.com/lWAQ0t1.png">
</picture>

## Introduction
This is my first resource sharing, I am still a beginner in LUA and with FIVEM, it may be that for some more experienced people, there are inconsistencies or things to improve. Keep in mind that for the moment this is only a draft that I am sharing with you and that it will probably be subject to modifications.
The link between vehicles and car keys is made by the plate number, that's why the car key label is the plate number.

I've also created an admin command that allows admin to generate and give keys to player of their choices, the only condition is that the plate exist and is stored in DB *(this verification is also made when players buy cars, we dont want to give them key that are not related to vehicles stored in db.)* *(the db tabled related is : owned_vehicles)*.

Also, the plugin is related to ox_inventory, so when you lock your vehicle, noone can open the trunk or anything *(example in the video)*.

## Dependencies
This plugin require that you're using the following ressources:
* oxmysql
* ox_inventory
* es_extended

## Installation
It's rather simple to install this plugin, you have to:
* Add **"ensure blinded_veh_keys"** at the end of your CFG editor.
* Add the following code to the **ox_inventory/data/items.lua**
```lua
['car_key'] = {
		label = 'Car key',
		weight = 1,
		stack = true,
		close = true,
		description = nil,
		client = {
			export = 'blinded_veh_keys.car_key'
		},
	}
```
* Add the image of your choice in the rapository **"ox_inventory/web/images"** and call it **"car_key.png"**

### Optional
This plugin is fully compatible with ESX, so you can add events to ESX scripts, for exemple, if you want to add key to player inventory just when he bought a vehicle from the vehicle shop, you just have to add:
```lua
TriggerServerEvent('blinded_veh_keys:givePlayerVehicleKey', plateNumberVar) 
```
Around the line **238 in the file: esx_vehicleshop/client/main.lua** *(see the screen below for an example of my using)*
![This is an image](https://i.imgur.com/EyGCQ2W.png)
## For next
I plan to make other additions later, including a logging system (text or sql) to record bugs (non-generated keys in particular) and also logged the admin command that allows to give a set of keys to a player.
I also think to create more admin command to make easier the actions related to this plugin.
There are other things I'm thinking about that will maybe see the light of day so don't hesitate to follow this topic. :)