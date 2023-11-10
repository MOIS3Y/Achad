-- █▄▀ █▀▀ █▄█ █▄▄ █▀█ ▄▀█ █▀█ █▀▄   █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ ▀
-- █░█ ██▄ ░█░ █▄█ █▄█ █▀█ █▀▄ █▄▀   █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄


-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"


-- Init widget properties: 
local bg_color  = beautiful.keyboard_layout.bg_color
local fg_color  = beautiful.keyboard_layout.fg_color
local icon_font = beautiful.keyboard_layout.icon_font
local text_font = beautiful.keyboard_layout.text_font

-- Init row widget:
local keyboard_layout = awful.widget.keyboardlayout()


-- Init widget btn:
local keyboard_layout_btn = wibox.widget {
  {
    {
      {
        text   = " ",  -- nf-fa-keyboard_o
        font   = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        font = text_font,
        widget = keyboard_layout
      },
      top = 4, bottom = 4, right = 4,
      widget = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal
  },
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}


return keyboard_layout_btn
