-- █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█   █▄▀ █▀▀ █▄█ █▀ ▀
-- ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█   █░█ ██▄ ░█░ ▄█ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"


-- Register screen keys:
return gears.table.join(
  -- -- -- Switch focus between screens -- -- --
  awful.key(
    {modkey, "Control"}, "j",
    function ()
      print("screen J")
      awful.screen.focus_relative(1)
    end,
    {
      description = "focus the next screen",
      group = "screen"
    }
  ),
  awful.key(
    {modkey, "Control"}, "k",
    function ()
      print("screen K")
      awful.screen.focus_relative(-1)
    end,
    {
      description = "focus the previous screen",
      group = "screen"
    }
  )
)
