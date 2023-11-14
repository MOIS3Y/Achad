-- ▀█▀ █▀▀ ▀▄▀ ▀█▀ █▀▀ █░░ █▀█ █▀▀ █▄▀ ▀
-- ░█░ ██▄ █░█ ░█░ █▄▄ █▄▄ █▄█ █▄▄ █░█ ▄

-- Imports:
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"


-- Init widget properties: 
local bg_color_calendar = beautiful.textclock.bg_color_calendar
local bg_color_clock    = beautiful.textclock.bg_color_clock
local fg_color          = beautiful.textclock.fg_color
local icon_font         = beautiful.textclock.icon_font
local text_font         = beautiful.textclock.text_font


-- Init row widget:
local calendar = wibox.widget.textclock()
calendar.format = "%a %d %b"

local clock = wibox.widget.textclock()
clock.format = "%H:%M"

-- Init widget btn:

local calendar_btn = wibox.widget {
  {
    {
      {
        text = "󰃭 ",  -- nf-md-calendar
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        font = text_font,
        widget = calendar
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal
  },
  bg = bg_color_calendar,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}

local clock_btn = wibox.widget {
  {
    {
      {
        text = " ",  -- nf-fa-clock_o
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        font = text_font,
        widget = clock
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal
  },
  bg = bg_color_clock,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}


return {
  calendar = calendar_btn,
  clock = clock_btn
}
