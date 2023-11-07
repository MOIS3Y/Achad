-- ▄▀█ █░█░█   █▀▀ █░█ ▄▀█ █▀▄ ▀
-- █▀█ ▀▄▀▄▀   █▄▄ █▀█ █▀█ █▄▀ ▄
-- -- -- -- -- -- -- -- -- -- --

--[[
  Entrypoint to run the AWchad configuration:
  STANDALONE: awesome -c ./rc.lu
  SDDM: awesome -c $HOME/.config/awesome/rc.lua
--]]

pcall(require, "luarocks.loader")

-- When loaded, this module makes sure that there's always a client
-- that will have focus on events 
-- such as tag switching, client unmanaging, etc:
require "awful.autofocus"

-- Realtime error handler:
require "core.error_handler"

-- Configuration pkgs:
require "ui"
require "core"
require "extensions"
