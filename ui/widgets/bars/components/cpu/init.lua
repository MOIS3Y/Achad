-- █▀▀ █▀█ █░█ ▀
-- █▄▄ █▀▀ █▄█ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"


-- Init widget properties: 
local bg_color    = beautiful.cpu.bg_color
local fg_color    = beautiful.cpu.fg_color
local icon_font   = beautiful.cpu.icon_font
local text_font   = beautiful.cpu.text_font


-- Init widget btn:
local cpu_monitor = wibox.widget {
  {
    {
      {
        id = "cpu_icon",
        text = "󰊚 ",  -- nf-md-gauge
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        id = "cpu_value",
        font = text_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    id = "cpu_layout",
    layout = wibox.layout.fixed.horizontal
  },
  id = "cpu_container",
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}

-- Helpers:
local function round (num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

local maincpu = {}

-- Init widget watch:
local cpu_btn = awful.widget.watch(
  [[grep --max-count=1 '^cpu.' /proc/stat]],
  1, -- timeout
  function(widget, stdout)
    -- Parse stdout:
    local _, user, nice, system, idle, iowait, irq, softirq, steal, _, _ =
    stdout:match('(%w+)%s+(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)')
    -- Count total value:
    local total = user + nice + system + idle + iowait + irq + softirq + steal

    local diff_idle = idle - tonumber(maincpu['idle_prev'] == nil and 0 or maincpu['idle_prev'])
    local diff_total = total - tonumber(maincpu['total_prev'] == nil and 0 or maincpu['total_prev'])
    local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10
    -- Save values for future count:
    maincpu['total_prev'] = total
    maincpu['idle_prev'] = idle
    -- Round result:
    diff_usage = tostring(round(diff_usage, 1)) .. "%"
    -- Add value to widget:
    widget:get_children_by_id("cpu_value")[1]:set_text(diff_usage)
  end,
  cpu_monitor  -- watch func will be modify this widget
)


return cpu_btn
