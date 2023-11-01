-- █▀▄▀█ ▄▀█ █ █▄░█   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ █▀█ █ █░▀█   █░▀░█ ██▄ █░▀█ █▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- 

local awful = require "awful"

local awesome_menu = require "core.menu.awesome"
local apps = require "apps"


return awful.menu(
  {
    items = {
      { "awesome", awesome_menu },
      { "terminal", apps.cli.terminal }
    }
  }
)
