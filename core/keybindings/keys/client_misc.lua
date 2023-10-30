-- █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀   █▀▄▀█ █ █▀ █▀▀ ▀
-- █▄▄ █▄▄ █ ██▄ █░▀█ ░█░   █░▀░█ █ ▄█ █▄▄ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local awful = require "awful"
local gears = require "gears"

local modkey = require "core.keybindings.modkey"


return gears.table.join(
  awful.key(
    {modkey}, "j",
      function ()
        awful.client.focus.byidx(1)
      end,
    {
      description = "focus next by index",
      group = "client"
    }
  ),
  awful.key(
    {modkey}, "k",
      function ()
        awful.client.focus.byidx(-1)
      end,
    {
      description = "focus previous by index",
      group = "client"
    }
  ),
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
  awful.key(
    {modkey}, "u",
    awful.client.urgent.jumpto,
    {
      description = "jump to urgent client",
      group = "client"
    }
  ),
  awful.key(
    {modkey}, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {
      description = "go back",
      group = "client"
    }
  ),
  awful.key(
    {modkey, "Control"}, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal("request::activate", "key.unminimize", {raise = true})
      end
    end,
    {
      description = "restore minimized",
      group = "client"
    }
  )
)
