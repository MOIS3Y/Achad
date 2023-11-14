-- ▀█▀ ▄▀█ █▀▀   █▀█ █▀█ █▀▀ █░█ █ █▀▀ █░█░█ ▀
-- ░█░ █▀█ █▄█   █▀▀ █▀▄ ██▄ ▀▄▀ █ ██▄ ▀▄▀▄▀ ▄

-- Imports:
local awful      = require "awful"
local beautiful  = require "beautiful"
local wibox      = require "wibox"

local blinglight = require "modules.blinglight"


-- Enable:
blinglight.tag_preview.enable {
  show_client_content = true,
  -- x = 50,
  -- y = 50,
  scale = 0.26,
  honor_padding = false,
  honor_workarea = false,
  placement_fn = function(c)
    awful.placement.top_left(c, {
      margins = {
        top = 40,
        left = 36
      }
    })
    end,
  -- Set a background image (like a wallpaper) for the widget 
  background_widget = wibox.widget {
      image = beautiful.wallpaper,
      horizontal_fit_policy = "fit",
      vertical_fit_policy   = "fit",
      widget = wibox.widget.imagebox
  }
}
