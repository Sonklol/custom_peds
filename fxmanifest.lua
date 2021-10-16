--fx_version 'cerulean'
fx_version 'adamant'
game 'gta5'

author 'Discord: Sonk#2333'
description 'Custom Peds to VIPs'
version '0.2 beta'

client_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  'config.lua',
  'client/cl_main.lua'
}

dependencies {
	'es_extended',
	'esx_license'
}