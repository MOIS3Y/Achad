-- █▄▀ █▀▀ █▄█ █▀  ▄▀█ █░█░█ █▀▀ █▀ █▀█ █▀▄▀█ █▀▀ ▀
-- █░█ ██▄ ░█░ ▄█  █▀█ ▀▄▀▄▀ ██▄ ▄█ █▄█ █░▀░█ ██▄ ▄

-- Imports:
local awful         = require "awful"
local gears         = require "gears"
local hotkeys_popup = require "awful.hotkeys_popup"

local modkey        = require "core.keybindings.modkey"


-- Register awesome keys:
return gears.table.join(
  awful.key(
    {modkey}, "s",
    hotkeys_popup.show_help,
    {
      description = "show keybindings map",
      group = "awesome"
    }
  ),
  awful.key(
    {modkey, "Control"}, "r",
    awesome.restart,
    {
      description = "reload awesome",
      group = "awesome"
    }
  ),
  awful.key(
    {modkey, "Control"}, "q",
    awesome.quit,
    {
      description = "quit awesome",
      group = "awesome"
    }
  )
)
