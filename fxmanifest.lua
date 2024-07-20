fx_version 'cerulean'
game 'gta5'

description 'qbx_fireworks'
repository 'https://github.com/Qbox-project/qbx_fireworks'
version '1.2.1'

ox_lib 'locale'

shared_script '@ox_lib/init.lua'
client_script 'client/main.lua'
server_script 'server/main.lua'

files {
    'config/shared.lua',
    'locales/*.json'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'