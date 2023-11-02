local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local naughty = require "naughty"
local wibox = require "wibox"


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local buttons_example = wibox {
  visible = true,
  bg = '#2E3440',
  ontop = true,
  height = 300,
  width = 500,
  shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 3)
  end
}
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local btn_basic = wibox.widget {
  {
    {
      text = "I'm a button!",
      widget = wibox.widget.textbox
    },
    top = 4, bottom = 4, left = 8, right = 8,
    widget = wibox.container.margin
  },
  bg = '#4C566A', -- basic
  shape_border_width = 1,
  shape = function(cr, width, height) 
      gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local btn_tranparent = wibox.widget {
  {
    {
      text = "I'm a button!",
      widget = wibox.widget.textbox
    },
    top = 4, bottom = 4, left = 8, right = 8,
    widget = wibox.container.margin
  },
  bg = '#00000000', --tranparent
  shape_border_width = 1,
  shape = function(cr, width, height) 
      gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local btn_outline = wibox.widget {
  {
    {
      -- text = "I'm a button!",
      -- widget = mykeyboardlayout
    },
    top = 4, bottom = 4, left = 8, right = 8,
    widget = wibox.container.margin
  },
  shape_border_width = 1,
  shape_border_color = '#4C566A', -- outline
  shape = function(cr, width, height) 
      gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}
buttons_example:setup {
  -- btn_basic,
  -- btn_tranparent,
  btn_outline,
  valigh = 'center',
  layout = wibox.container.place
}
btn_outline:connect_signal("mouse::enter", function(c) c:set_bg("#00000066") end)
btn_outline:connect_signal("mouse::leave", function(c) c:set_bg('#00000000') end)
btn_outline:connect_signal("button::press", function(c) c:set_bg("#000000") end)
btn_outline:connect_signal("button::release", function(c) c:set_bg('#00000066') end)

btn_outline:connect_signal("button::press", function(c, _, _, button)
  if button == 1 then  naughty.notify{text = 'Left click'}
  elseif button == 2 then naughty.notify{text = 'Wheel click'}
  elseif button == 3 then naughty.notify{text = 'Right click'}
  end
end)


awful.placement.top(buttons_example, { margins = {top = 40}, parent = awful.screen.focused()})