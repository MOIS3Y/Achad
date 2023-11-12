-- █▀▄▀█ █▀▀ █▀▄▀█ █▀█ █▀█ █▄█ ▀
-- █░▀░█ ██▄ █░▀░█ █▄█ █▀▄ ░█░ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"

local utils     = require "ui.widgets.bars.components.memory.utils"

-- Init widget properties: 
local bg_color    = beautiful.memory.bg_color
local fg_color    = beautiful.memory.fg_color
local icon_font   = beautiful.memory.icon_font
local text_font   = beautiful.memory.text_font


-- Init widget btn:
local memory_monitor = wibox.widget {
  {
    {
      {
        id = "memory_icon",
        text = "󰍛 ",  -- nf-md-memory
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        id = "memory_value",
        font = text_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    id = "memory_layout",
    layout = wibox.layout.fixed.horizontal
  },
  id = "memory_container",
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}


-- Init widget watch:
local memory_btn = awful.widget.watch(
  'bash -c "LANGUAGE=en_US.UTF-8 free -b | grep -z Mem.*Swap.*"', 1, -- timeout
  function(widget, stdout)
    -- Parse stdout:
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap
    total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
    stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')
    -- What we monitoring:
    local value = tonumber(used)  -- RAM
    local format_value = utils.sizyfy(value)
    widget:get_children_by_id("memory_value")[1]:set_text(format_value)
  end,
  memory_monitor  -- watch func will be modify this widget
)


return memory_btn
