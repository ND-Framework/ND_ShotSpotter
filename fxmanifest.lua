-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Andyyy#7666, N1K0#0001'
description 'Shot Spotter Script (ND Framework)'
version '2.1.0'

shared_scripts {
    '@ND_Core/init.lua',
    '@ox_lib/init.lua',
    'data/configuration.lua'
} 

server_script 'source/server/main.lua'

client_script 'source/client/main.lua'

dependencies {
    'ND_Core',
    'ND_MDT',
    'ox_lib'
} 