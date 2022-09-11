fx_version 'cerulean'
game 'gta5'

server_scripts {
	'server.lua'
}


client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client.lua'
}

dependencies { 
  'PolyZone'
}

lua54 'yes'
