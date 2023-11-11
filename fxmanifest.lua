fx_version 'cerulean'
game 'gta5'

description 'QBX_Fireworks'
repository 'https://github.com/Qbox-project/qbx_fireworks'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/import.lua',
    '@qbx_core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_script 'server/main.lua'
client_script 'client/main.lua'

modules {
    'qbx_core:utils'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'