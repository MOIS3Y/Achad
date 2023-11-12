-- █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀   █▀▄▀█ █ █▀ █▀▀ ▀
-- █▄▄ █▄▄ █ ██▄ █░▀█ ░█░   █░▀░█ █ ▄█ █▄▄ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"


-- Register client misc keys:
return gears.table.join(
  -- -- -- Focus next or previous client by index -- -- --
  awful.key(
    {modkey}, "space",
      function ()
        awful.client.focus.byidx(1)
      end,
    {
      description = "focus next by index",
      group = "client"
    }
  ),
  awful.key(
    {modkey, "Shift"}, "space",
      function ()
        awful.client.focus.byidx(-1)
      end,
    {
      description = "focus previous by index",
      group = "client"
    }
  ),
  -- -- -- Move the focused client clockwise and counterclockwise -- -- --
  awful.key(
    {modkey}, "k",
    function ()
      awful.client.cycle(true)
    end,
    {
      description = "move the focused client clockwise",
      group = "client"
    }
  ),
  awful.key(
    {modkey}, "j",
    function ()
      awful.client.cycle(false)
    end,
    {
      description = "move the focused client counterclockwise",
      group = "client"
    }
  ),
  -- -- -- Swap with next or previous client by index -- -- --
  awful.key(
    {modkey, "Shift"}, "j",
    function ()
      awful.client.swap.byidx(1)
    end,
    {
      description = "swap with next client by index",
      group = "client"
    }
  ),
  awful.key(
    { modkey, "Shift"}, "k",
    function ()
      awful.client.swap.byidx(-1)
    end,
    {
      description = "swap with previous client by index",
      group = "client"
    }
  ),
  -- -- -- Jump to urgent client -- -- --
  awful.key(
    {modkey}, "u",
    awful.client.urgent.jumpto,
    {
      description = "jump to urgent client",
      group = "client"
    }
  )
)
