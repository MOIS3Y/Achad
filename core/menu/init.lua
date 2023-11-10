-- █▀▄▀█ ▄▀█ █ █▄░█   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ █▀█ █ █░▀█   █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local awful        = require "awful"

local awesome_menu = require "core.menu.awesome"
local apps         = require "apps"
local paths        = require "ui.theme.path"

-- Set icon dir:
local icon_dir     = paths.icons .. "menu/"

-- Init main menu:
local menu = awful.menu(
  {
    items = {
      { "Terminal",   apps.cli.terminal },
      { "Browser",    apps.gui.browser  },
      { "Explorer",   apps.cli.explorer },
      { "Awesome WM", awesome_menu      }
    }
  }
)


-- Register main menu:
return menu
