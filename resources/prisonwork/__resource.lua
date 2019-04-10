resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Prison Jobs"

client_scripts {
	'client.lua',
	'teleport.lua',
	'@essentialmode/server/player/wrappers.lua',
	'shared.js',
	'client.js'
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