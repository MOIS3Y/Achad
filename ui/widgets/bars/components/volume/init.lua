-- █░█ █▀█ █░░ █░█ █▀▄▀█ █▀▀ ▀
-- ▀▄▀ █▄█ █▄▄ █▄█ █░▀░█ ██▄ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"

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
    local volume_value = widget:get_children_by_id("volume_value")[1]
    local volume_icon  = widget:get_children_by_id("volume_icon")[1]
    -- Check mute status:
    if pactl.is_mute(stdout) then
      widget:set_bg(mute_color)
      volume_value:set_text("Mute")
      volume_icon:set_text("󰝟 ")  -- nf-md-volume_mute
      return nil
    end
    awful.spawn.easy_async(
      "pactl get-sink-volume @DEFAULT_SINK@",
      function (out)
        -- Get current volume or show error label:
        local current_volume = pactl.parse_current_volume(out)
        if not current_volume then
          widget:set_bg(error_color)
          volume_value:set_text("ERROR")
          volume_icon:set_text("󰖁 ")  -- nf-md-volume_mute
          return nil
        end
        -- Set volume value bg color and icon:
        widget:set_bg(bg_color)
        volume_value:set_text(current_volume)
        if current_volume >= 60 then
          volume_icon:set_text("󰕾 ")  -- nf-md-volume_high
        elseif current_volume < 60 and current_volume >= 30 then
          volume_icon:set_text("󰖀 ")  -- nf-md-volume_medium
        else
          volume_icon:set_text("󰕿 ")  -- nf-md-volume_low
        end
      end
    )
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
        pactl.volume_level_set("sink", "@DEFAULT_SINK@", "+", 5, "popup")
      end
    ),
    awful.button(
      {}, 5,
      function ()
        pactl.volume_level_set("sink", "@DEFAULT_SINK@", "-", 5, "popup")
      end
    )
  )
)

return volume_btn
