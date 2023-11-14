-- ▄▀█ █░█░█ █▀▀ █▀ █▀█ █▀▄▀█ █▀▀   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █▀█ ▀▄▀▄▀ ██▄ ▄█ █▄█ █░▀░█ ██▄   █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local awful   = require "awful"
local gears   = require "gears"
local hotkeys = require "awful.hotkeys_popup"

local apps    = require "apps"
local color   = require "ui.theme.color"
local paths   = require "ui.theme.path"

local themes  = require "core.menu.themes"

local gcrci   = gears.color.recolor_image  -- recolor images func

-- Set icon dir:
local icon_dir = paths.icons .. "menu/"

-- Init icons:
local icon_color = color.scheme.base0D

local themes_icon  = gcrci(icon_dir ..  "theme_moon.svg", icon_color)
local hotkeys_icon = gcrci(icon_dir .. "command.svg",     icon_color)
local manual_icon  = gcrci(icon_dir .. "book-open.svg",   icon_color)
local restart_icon = gcrci(icon_dir .. "refresh-cw.svg",  icon_color)
local quit_icon    = gcrci(icon_dir .. "log-out.svg",     icon_color)


-- Register awesome menu:
return {
  {
    "Themes", themes, themes_icon
  },
  {
    "Hotkeys",
    function()
      hotkeys.show_help(nil, awful.screen.focused())
    end,
    hotkeys_icon
  },
  {
    "Manual",
    apps.cli.terminal .. " -e man awesome",
    manual_icon
  },
  {
    "Restart",
    awesome.restart,
    restart_icon
  },
  {
    "Quit",
    function()
      awesome.quit()
    end,
    quit_icon
  },
}
