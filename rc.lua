-- ▄▀█  █▀▀ █░█ ▄▀█ █▀▄ ▀
-- █▀█  █▄▄ █▀█ █▀█ █▄▀ ▄

--[[
  Entrypoint to run the Achad configuration:
  STANDALONE: awesome -c ./rc.lua
  SDDM: awesome -c $HOME/.config/awesome/rc.lua
]]

pcall(require, "luarocks.loader")

-- Imports:
local beautiful = require "beautiful"
local gears     = require "gears"

-- Realtime error handler:
require "core.error_handler"

-- Require top:
require "environment"

-- When loaded, this module makes sure that there's always a client
-- that will have focus on events 
-- such as tag switching, client unmanaging, etc:
require "awful.autofocus"

-- Register theme:
beautiful.init(gears.filesystem.get_configuration_dir() .. "ui/theme/init.lua")

-- Configuration pkgs:
require "core"
require "extensions"
require "notifications"
