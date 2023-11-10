-- █░█ █▀█ █░░ █░█ █▀▄▀█ █▀▀ ▀
-- ▀▄▀ █▄█ █▄▄ █▄█ █░▀░█ ██▄ ▄
-- -- -- -- -- -- -- -- -- -- 

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"

local color     = require "ui.theme.color"
local pactl     = require "utils.pactl"


-- Init widget properties: 
local bg_color    = beautiful.volume.bg_color
local fg_color    = beautiful.volume.fg_color
local icon_font   = beautiful.volume.icon_font
local text_font   = beautiful.volume.text_font
local mute_color  = beautiful.volume.mute_color
local error_color = beautiful.volume.error_color


-- Init widget btn:
local volume_level = wibox.widget {
  {
    {
      {
        id = "volume_icon",
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        id = "volume_value",
        font = text_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    id = "volume_layout",
    layout = wibox.layout.fixed.horizontal
  },
  id = "volume_container",
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}


-- Init widget watch:
local volume_btn = awful.widget.watch(
  "pactl get-sink-mute @DEFAULT_SINK@",
  1,
  function(widget, stdout)
    if string.find(stdout, "yes") then
      widget:get_children_by_id("volume_value")[1]:set_text("Mute")
      widget:get_children_by_id("volume_icon")[1]:set_text("󰝟 ")  -- nf-md-volume_mute
      widget:set_bg(mute_color)
    else
      awful.spawn.easy_async(
        "pactl get-sink-volume @DEFAULT_SINK@",
        function (out)
          -- Init vars:
          local current_vol
          local volsum, volcnt = 0, 0
          -- Get current volume:
          for vol in string.gmatch(out, "(%d?%d?%d)%%") do
            if vol ~= nil then
              volsum = volsum + tonumber(vol)
              volcnt = volcnt + 1
            end
          end
          if volcnt == 0 then
            widget:set_bg(error_color)
            widget:get_children_by_id("volume_value")[1]:set_text("ERROR")
            widget:get_children_by_id("volume_icon")[1]:set_text("󰖁 ")  -- nf-md-volume_mute
            return nil
          end
          -- Count current volume:
          current_vol = volsum / volcnt
          -- Set volume value bg color and icon:
          widget:set_bg(bg_color)
          widget:get_children_by_id("volume_value")[1]:set_text(current_vol)
          if current_vol >= 60 then
            widget:get_children_by_id("volume_icon")[1]:set_text("󰕾 ")  -- nf-md-volume_high
          elseif current_vol > 60 or current_vol >= 30 then
            widget:get_children_by_id("volume_icon")[1]:set_text("󰖀 ")  -- nf-md-volume_medium
          else
            widget:get_children_by_id("volume_icon")[1]:set_text("󰕿 ")  -- nf-md-volume_low
          end
        end
      )
    end
  end,
  volume_level  -- watch func will be modify this widget
)


-- Init buttons:
volume_btn:buttons(
  gears.table.join(
    awful.button(
      {}, 1,
      function ()
        pactl.volume_mute_toggle("sink", "@DEFAULT_SINK@")
      end
    ),
    awful.button(
      {}, 4,
      function ()
        pactl.volume_level_set("sink", "@DEFAULT_SINK@", "+", 5)
      end
    ),
    awful.button(
      {}, 5,
      function ()
        pactl.volume_level_set("sink", "@DEFAULT_SINK@", "-", 5)
      end
    )
  )
)

return volume_btn
