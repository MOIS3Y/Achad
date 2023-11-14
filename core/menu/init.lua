-- █▀▄▀█ ▄▀█ █ █▄░█   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ █▀█ █ █░▀█   █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local awful        = require "awful"
local beautiful    = require "beautiful"
local gears        = require "gears"

local awesome_menu = require "core.menu.awesome"
local apps         = require "apps"
local color        = require "ui.theme.color"
local paths        = require "ui.theme.path"

local gcrci    = gears.color.recolor_image  -- recolor images func

-- Set icon dir:
local icon_dir       = paths.icons .. "menu/"

-- Init icons:
local icon_color = color.scheme.base0D

local apps_icon      = gcrci(icon_dir .. "search.svg",    icon_color)
local terminal_icon  = gcrci(icon_dir .. "terminal.svg",  icon_color)
local browser_icon   = gcrci(icon_dir .. "globe.svg",     icon_color)
local explorer_icon  = gcrci(icon_dir .. "folder.svg",    icon_color)
local editor_icon    = gcrci(icon_dir .. "edit.svg",      icon_color)
local awesome_icon   = gcrci(icon_dir .. "awesomewm.svg", icon_color)


-- Init main menu:
local menu = awful.menu(
  {
    items = {
      { "Applications",   apps.launcher.rofi, apps_icon     },
      { "Terminal",       apps.cli.terminal,  terminal_icon },
      { "Browser",        apps.gui.browser,   browser_icon  },
      { "Explorer",       apps.cli.explorer,  explorer_icon },
      { "Editor",         apps.gui.editor,    editor_icon   },
      { "Awesome WM",     awesome_menu,       awesome_icon  }
    }
  }
)


-- Register main menu:
return menu
