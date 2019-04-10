resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Prison Jobs"

ui_page('html/index.html')

client_scripts {
  'client.lua',
  '@essentialmode/server/player/wrappers.lua',
  'js/shared.js',
  'js/client.js'
}
server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@essentialmode/server/player/wrappers.lua'
}
dependencies {
  'es_extended',
  'essentialmode',
  'mysql-async'
}