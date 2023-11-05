-- █▀▄▀█ ▄▀█ █ █▄░█   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ █▀█ █ █░▀█   █░▀░█ ██▄ █░▀█ █▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Imports:
local awful        = require "awful"

local awesome_menu = require "core.menu.awesome"
local apps         = require "apps"
local paths        = require "ui.theme.path"

-- Set icon dir:
local icon_dir     = paths.icons .. "menu/"

-- Register main menu:
return awful.menu(
  {
    items = {
      { "Terminal",  apps.cli.terminal                         },
      { "AwesomeWM", awesome_menu, icon_dir .. "awesomewm.png" }
    }
  }
)
