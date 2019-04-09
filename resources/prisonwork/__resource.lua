resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Prison Jobs"

dependency "essentialmode"
dependency "[sesx]/essentialmode"

client_scripts {
	'prisonwork.lua',
	'config.lua',
	--'@essentialmode/server/player/wrappers.lua',
	'shared.js',
	'client.js'
}
--[[server_scripts {
	'shared.js',
	'server/server.js'
}]]--