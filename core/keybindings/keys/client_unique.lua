-- █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀   █░█ █▄░█ █ █▀█ █░█ █▀▀ ▀
-- █▄▄ █▄▄ █ ██▄ █░▀█ ░█░   █▄█ █░▀█ █ ▀▀█ █▄█ ██▄ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"


-- Register client unique keys:
return gears.table.join(
  -- -- -- Close focused client -- -- --
  awful.key(
    {modkey}, "w",
    function (c)
      c:kill()
    end,
    {
      description = "close",
      group = "client"
    }
  ),
  -- -- -- Switch between fullscreen and floating mod focused client -- -- --
  awful.key(
    {modkey}, "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {
      description = "toggle fullscreen",
      group = "client"
    }
  ),
  awful.key(
    {modkey, "Shift"}, "f",
    awful.client.floating.toggle,
    {
      description = "toggle floating",
      group = "client"
    }
  ),
  -- -- -- Move focused client to screen -- -- --
  awful.key(
    {modkey}, "o",
    function (c)
      c:move_to_screen()
    end,
    {
      description = "move to screen",
      group = "client"
    }
  ),
  -- -- -- Stick floating client on top (toggle) -- -- --
  awful.key(
    {modkey}, "t",
    function (c)
      c.ontop = not c.ontop
    end,
    {
      description = "toggle keep on top",
      group = "client"
    }
  ),
  -- -- -- Minimized and restore clients -- -- --
  awful.key(
    {modkey}, "n",
    function (c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end ,
    {
      description = "minimize",
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
  ),
  -- -- -- Move focused client to master -- -- --
  awful.key(
    {modkey, "Control"}, "Return",
    function (c)
      c:swap(awful.client.getmaster())
    end,
    {
      description = "move to master",
      group = "client"
    }
  )
)
