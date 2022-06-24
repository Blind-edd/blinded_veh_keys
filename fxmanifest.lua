fx_version 'cerulean'
game 'gta5'

author 'Blind-ed'
description 'Plugin for vehicle keys'
version '1.0.0'


client_script 'client/main.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'mysql/server.lua',
	'locales/en.lua',
	'server/main.lua'
}

dependencies {
	'oxmysql',
	'es_extended',
	'ox_inventory'	
}

shared_script '@es_extended/imports.lua'