-- █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀   █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█ █▀ ▀
-- █▄▄ █▄▄ █ ██▄ █░▀█ ░█░   █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█ ▄█ ▄

-- Imports:
local awful  = require "awful"
local gears  = require "gears"

local modkey = require "core.keybindings.modkey"


-- Register client buttons:
return gears.table.join(
  -- -- -- Focus client -- -- --
  awful.button(
    {}, 1,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
    end
  ),
  -- -- -- Move focus client -- -- --
  awful.button(
    {modkey}, 1,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.move(c)
    end
  ),
  -- -- -- Resize client(s) -- -- --
  awful.button(
    {modkey}, 3,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.resize(c)
    end
  )
)
