resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Prison Jobs"

--ui_page('html/index.html')

--[[client_scripts {
  'client/main.lua',
  '@essentialmode/server/player/wrappers.lua',
}
server_scripts {
  'server/main.lua',
  '@mysql-async/lib/MySQL.lua',
  '@essentialmode/server/player/wrappers.lua'
}]]

client_scripts {
	'client/main.lua',
  'js/shared.js',
  'js/client.js'
}

server_scripts {
	'server/main.lua',
  '@mysql-async/lib/MySQL.lua'
}


dependencies {
  'es_extended',
  'essentialmode',
  'mysql-async'
}