--[[------------------------------------------------------
---- Do not edit if you do not know what you"re doing ----
--]]------------------------------------------------------

game "gta5"
lua54 "yes"
fx_version "cerulean"
use_experimental_fxv2_oal "yes"

author "Marfia Studioa"
version "1.0.0"
license "GPL-v3"
name "Radio Animation Command"
description "Marfia Studios - Radio Animation Command"
repository "https://github.com/MarfiaStudios/RadioAnimationCommand"

client_debug_mode "false"
server_debug_mode "false"
experimental_features_enabled "0"

client_script "client/main.lua"

export "animation"

escrow_ignore {
	"client/*.lua",
	"stream/*",
	"server/*.lua"
}
