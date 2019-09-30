resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'server.lua'
}

ui_page('nui/index.html')

files({
	--default
    'nui/index.html',
    'nui/script.js',
    'nui/style.css',
	
	--character
	'nui/character/index.html',
    'nui/character/style.css',
	'nui/character/script.js',
	'nui/bg.jpg',
	
	--show id
	'nui/id/index.html',
	'nui/drivers.png',
	
	--items
	'nui/id.png',
	'nui/noid.png'
})