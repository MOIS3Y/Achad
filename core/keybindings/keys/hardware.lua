-- █░█ ▄▀█ █▀█ █▀▄ █░█░█ ▄▀█ █▀█ █▀▀  █▄▀ █▀▀ █▄█ █▀ ▀
-- █▀█ █▀█ █▀▄ █▄▀ ▀▄▀▄▀ █▀█ █▀▄ ██▄  █░█ ██▄ ░█░ ▄█ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"
local pactl  = require "utils.pactl"


-- Register hardware keys:
return gears.table.join(
  awful.key(
    { }, "XF86AudioRaiseVolume",
    function ()
      pactl.volume_level_set("sink", "@DEFAULT_SINK@", "+", 5)
    end,
    {
      description = "Volume raise",
      group = "hardware"
    }
  ),
  awful.key(
    { }, "XF86AudioLowerVolume",
    function ()
      pactl.volume_level_set("sink", "@DEFAULT_SINK@", "-", 5)
    end,
    {
      description = "Volume lower",
      group = "hardware"
    }
  ),
  awful.key(
    { }, "XF86AudioMute",
    function ()
      pactl.volume_mute_toggle("sink", "@DEFAULT_SINK@")
    end,
    {
      description = "Volume muted",
      group = "hardware"
    }
  )
)
