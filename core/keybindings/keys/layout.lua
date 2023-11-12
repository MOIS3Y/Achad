-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀   █▄▀ █▀▀ █▄█ █▀ ▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░   █░█ ██▄ ░█░ ▄█ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"


-- Register layout keys:
return gears.table.join(
  -- -- -- Increase and decrise master width factor -- -- --
  awful.key(
    { modkey}, "l",
    function ()
      awful.tag.incmwfact(0.05)
    end,
    {
      description = "increase master width factor",
      group = "layout"
    }
  ),
  awful.key(
    {modkey}, "h",
    function ()
      awful.tag.incmwfact(-0.05)
    end,
    {
      description = "decrease master width factor",
      group = "layout"
    }
  ),
  -- -- -- Increase and decrease the numbers of master clients -- -- --
  awful.key(
    {modkey, "Shift"}, "h",
    function ()
      awful.tag.incnmaster(1, nil, true)
    end,
    {
      description = "increase the number of master clients",
      group = "layout"
    }
  ),
  awful.key(
    {modkey, "Shift"}, "l",
    function ()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {
      description = "decrease the number of master clients",
      group = "layout"
    }
  ),
  -- -- -- Increase and decrease the number of columns -- -- --
  awful.key(
    {modkey, "Control"}, "h",
    function ()
      awful.tag.incncol(1, nil, true)
    end,
    {
      description = "increase the number of columns",
      group = "layout"
    }
  ),
  awful.key(
    {modkey, "Control"}, "l",
    function ()
      awful.tag.incncol(-1, nil, true)
    end,
    {
      description = "decrease the number of columns",
      group = "layout"
    }
  ),
  -- -- -- Switch layouts clockwise and counterclockwise -- -- --
  awful.key(
    {modkey}, "Tab",
    function ()
      awful.layout.inc(1)
    end,
    {
      description = "select next",
      group = "layout"
    }
  ),
  awful.key(
    {modkey, "Shift"}, "Tab",
    function ()
      awful.layout.inc(-1)
    end,
    {
      description = "select previous",
      group = "layout"
    }
  )
)
