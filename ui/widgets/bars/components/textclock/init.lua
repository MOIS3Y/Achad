-- ▀█▀ █▀▀ ▀▄▀ ▀█▀ █▀▀ █░░ █▀█ █▀▀ █▄▀ ▀
-- ░█░ ██▄ █░█ ░█░ █▄▄ █▄▄ █▄█ █▄▄ █░█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Imports:
local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local color = require "ui.theme.color_scheme"
local theme = require "ui.theme.default"


-- Init btn colors: 
local bg_color_calendar = color.base0D
local bg_color_clock    = color.base0E
local fg_color          = theme.bg_normal

-- Init row widget:
local calendar = wibox.widget.textclock()
calendar.format = "%a %m %b"

local clock = wibox.widget.textclock()
clock.format = "%H:%M"

-- Init widget btn:

local calendar_btn = wibox.widget {
  {
    {
      {
        text = "󰃭 ",  -- nf-md-calendar
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {  widget = calendar },
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
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {  widget = clock },
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
