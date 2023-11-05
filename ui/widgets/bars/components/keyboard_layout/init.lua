-- █▄▀ █▀▀ █▄█ █▄▄ █▀█ ▄▀█ █▀█ █▀▄   █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ ▀
-- █░█ ██▄ ░█░ █▄█ █▄█ █▀█ █▀▄ █▄▀   █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Imports:
local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local color = require "ui.theme.color_scheme"
local theme = require "ui.theme.default"


-- Init btn colors: 
local bg_color = color.base0B
local fg_color = theme.bg_normal

-- Init row widget:
local keyboard_layout = awful.widget.keyboardlayout()


-- Init widget btn:
local keyboard_layout_btn = wibox.widget {
  {
    {
      {
        text = " ",  -- nf-fa-keyboard_o
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {  widget = keyboard_layout },
      top = 4, bottom = 4, right = 8,
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
