fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'krs_carcontrol'
author 'Karos#7804'
version "1.0.0"

client_script {
    'client/*.lua'
}

server_script {
    'server/*.lua'
}

shared_scripts {

	'@ox_lib/init.lua',
    'config.lua'
}

files {
    'locales/*.json'
}

dependencies {

	'ox_lib'
}