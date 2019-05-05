resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Prison Jobs"

client_scripts {
	'client/main.lua',
	'client/props.lua'
}

server_scripts {
	'server/main.lua',
  '@mysql-async/lib/MySQL.lua'
}

dependencies {
  'pNotify',
  'es_extended',
  'essentialmode',
  'mysql-async'
}