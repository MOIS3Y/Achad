-- ▄▀█ █▀█ █▀█ █▀   █▄▀ █▀▀ █▄█ █▀ ▀
-- █▀█ █▀▀ █▀▀ ▄█   █░█ ██▄ ░█░ ▄█ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"

local apps   = require "apps"


-- Register apps keys:
return gears.table.join(
  awful.key(
    {modkey}, "Return",
    function ()
      awful.spawn(apps.cli.terminal)
    end,
    {
      description = "open a terminal",
      group = "apps"
    }
  ),
  awful.key(
    {modkey}, "b",
    function ()
      awful.spawn(apps.gui.browser)
    end,
    {
      description = "open a browser",
      group = "apps"
    }
  ),
  awful.key(
    {}, "Print",
    function ()
      awful.spawn(apps.gui.screenshot)
    end,
    {
      description = "take a screenshot",
      group = "apps"
    }
  )
)
