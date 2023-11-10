-- █▀ █▄█ █▀ ▀█▀ █▀█ ▄▀█ █▄█ ▀
-- ▄█ ░█░ ▄█ ░█░ █▀▄ █▀█ ░█░ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"


-- Init widget properties: 
local bg_color  = beautiful.systray.bg_color
local icon_font = beautiful.systray.icon_font

-- Init row widget:
local systray = wibox.widget.systray()

-- Hide systray by default:
systray.visible = false

-- Init widget btn:
local systray_btn = wibox.widget {
  {
    {
      {
        text   = " ... ",  -- nf-fa-chevron_circle_right
        font   = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 16,
      widget = wibox.container.margin
    },
    {
      { widget = systray },
      top = 6, bottom = 6, left = 2, right = 12,
      widget = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal
  },
  bg = bg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 5)
  end,
  widget = wibox.container.background
}

-- Hover show systray:
systray_btn:connect_signal("mouse::enter", function() systray.visible = true end)
systray_btn:connect_signal("mouse::leave", function() systray.visible = false end)


return systray_btn
