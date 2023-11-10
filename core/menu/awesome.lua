-- ▄▀█ █░█░█ █▀▀ █▀ █▀█ █▀▄▀█ █▀▀   █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █▀█ ▀▄▀▄▀ ██▄ ▄█ █▄█ █░▀░█ ██▄   █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local awful         = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local apps          = require "apps"
local themes        = require "core.menu.themes"

-- Register awesome menu:
return {
  {
    "Themes", themes
  },
  {
    "Hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end
  },
  {
    "Manual",
    apps.cli.terminal .. " -e man awesome"
  },
  {
    "Restart",
    awesome.restart
  },
  {
    "Quit",
    function()
      awesome.quit()
    end
  },
}
