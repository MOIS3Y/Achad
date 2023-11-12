-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█ █▀▀ █▀█ ▀
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█ ██▄ █▀▄ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"
local apps   = require "apps"


-- Register launcher keys:
return gears.table.join(
  awful.key(
    {modkey}, "r",
    function ()
      awful.screen.focused().mypromptbox:run()  -- !broken now
    end,
    {
      description = "run prompt",
      group = "launcher"
    }
  ),
  awful.key(
    {modkey}, "m",
    function ()
      awful.spawn(apps.launcher.rofi)
    end,
    {
      description = "run rofi drun menu",
      group = "launcher"
    }
  )
)
