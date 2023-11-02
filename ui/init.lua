-- █░█ █▀ █▀▀ █▀█   █ █▄░█ ▀█▀ █▀▀ █▀█ █▀▀ ▄▀█ █▀▀ █▀▀ ▀
-- █▄█ ▄█ ██▄ █▀▄   █ █░▀█ ░█░ ██▄ █▀▄ █▀░ █▀█ █▄▄ ██▄ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- imports:
local gears = require "gears"
local beautiful = require "beautiful"

-- init current interface theme:
beautiful.init(gears.filesystem.get_configuration_dir() .. "ui/theme/init.lua")
