-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█ █▀▀ █▀█ ▀
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█ ██▄ █▀▄ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -

local awful = require "awful"
local gears = require "gears"

local modkey = require "core.keybindings.modkey"
local apps = require "apps"


return gears.table.join(
  awful.key(
    {modkey}, "Return",
    function ()
      awful.spawn(apps.cli.terminal)
    end,
    {
      description = "open a terminal",
      group = "launcher"
    }
  ),
  -- Prompt
  awful.key(
    {modkey}, "r",
    function ()
      awful.screen.focused().mypromptbox:run()
    end,
    {
      description = "run prompt",
      group = "launcher"
    }
  )
)
