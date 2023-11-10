-- █▀▄▀█ █ █▀▀ █▀█ █▀█ █▀█ █░█ █▀█ █▄░█ █▀▀ ▀
-- █░▀░█ █ █▄▄ █▀▄ █▄█ █▀▀ █▀█ █▄█ █░▀█ ██▄ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"

local pactl     = require "utils.pactl"

-- Init widget properties: 
local bg_color    = beautiful.microphone.bg_color
local fg_color    = beautiful.microphone.fg_color
local icon_font   = beautiful.microphone.icon_font
local text_font   = beautiful.microphone.text_font
local mute_color  = beautiful.microphone.mute_color
local error_color = beautiful.microphone.error_color


-- Init widget btn:
local microphone_level = wibox.widget {
  {
    {
      {
        id = "microphone_icon",
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8,
      widget = wibox.container.margin
    },
    {
      {
        id = "microphone_value",
        font = text_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    id = "microphone_layout",
    layout = wibox.layout.fixed.horizontal
  },
  id = "microphone_container",
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}


-- Init widget watch:
local microphone_btn = awful.widget.watch(
  "pactl get-source-mute @DEFAULT_SOURCE@",
  1,
  function(widget, stdout)
    if string.find(stdout, "yes") then
      widget:get_children_by_id("microphone_value")[1]:set_text("Mute")
      widget:get_children_by_id("microphone_icon")[1]:set_text(" ")  -- nf-fa-microphone_slash
      widget:set_bg(mute_color)
    else
      awful.spawn.easy_async(
        "pactl get-source-volume @DEFAULT_SOURCE@",
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
            widget:get_children_by_id("microphone_value")[1]:set_text("ERROR")
            widget:get_children_by_id("microphone_icon")[1]:set_text(" ")  -- nf-fa-microphone_slash
            return nil
          end
          -- Count current volume:
          current_vol = volsum / volcnt
          -- Set volume value bg color and icon:
          widget:set_bg(bg_color)
          widget:get_children_by_id("microphone_value")[1]:set_text(current_vol)
          widget:get_children_by_id("microphone_icon")[1]:set_text(" ")  -- nf-fa-microphone
        end
      )
    end
  end,
  microphone_level  -- watch func will be modify this widget
)


-- Init buttons:
microphone_btn:buttons(
  gears.table.join(
    awful.button(
      {}, 1,
      function ()
        pactl.volume_mute_toggle("source", "@DEFAULT_SOURCE@")
      end
    ),
    awful.button(
      {}, 4,
      function ()
        pactl.volume_level_set("source", "@DEFAULT_SOURCE@", "+", 5)
      end
    ),
    awful.button(
      {}, 5,
      function ()
        pactl.volume_level_set("source", "@DEFAULT_SOURCE@", "-", 5)
      end
    )
  )
)

return microphone_btn
