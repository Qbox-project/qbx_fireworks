fx_version 'cerulean'
game 'gta5'

description 'qbx_fireworks'
repository 'https://github.com/Qbox-project/qbx_fireworks'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/modules/utils.lua',
    '@qbx_core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

file 'config/shared.lua'

lua54 'yes'
use_experimental_fxv2_oal 'yes'