-- ▀█▀ █ ▀█▀ █░░ █▀▀ █▄▄ ▄▀█ █▀█   █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█ █▀ ▀
-- ░█░ █ ░█░ █▄▄ ██▄ █▄█ █▀█ █▀▄   █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█ ▄█ ▄

-- Imports:
local awful = require "awful"
local gears = require "gears"


-- Generate buttons for each titlebar:
local titlebar_buttons = function (c)
  return gears.table.join(
    awful.button(
      {}, 1,
      function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.move(c)
      end
    ),
    awful.button(
      {}, 3,
      function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
      end
    )
  )
end


return titlebar_buttons
