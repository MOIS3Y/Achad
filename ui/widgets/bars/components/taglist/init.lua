-- ▀█▀ ▄▀█ █▀▀   █░░ █ █▀ ▀█▀ ▀
-- ░█░ █▀█ █▄█   █▄▄ █ ▄█ ░█░ ▄

-- Imports:
local awful       = require "awful"
local wibox       = require "wibox"

local buttons     = require "core.keybindings.buttons"


-- Create a taglist widget
local function taglist(s)
  local widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = buttons.taglist,
    widget_template = {
      {
        {
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left  = 6, right = 6,
        widget = wibox.container.margin
      },
      id     = 'background_role',
      widget = wibox.container.background,
      create_callback = function(self, c3, index, objects)
        self:connect_signal('mouse::enter', function()
          -- BLING: Only show widget when there are clients in the tag
          if #c3:clients() > 0 then
            -- BLING: Update the widget with the new tag
            awesome.emit_signal("bling::tag_preview::update", c3)
            -- BLING: Show the widget
            awesome.emit_signal("bling::tag_preview::visibility", s, true)
          end
        end)
        self:connect_signal('mouse::leave', function()
          -- BLING: Turn the widget off
          awesome.emit_signal("bling::tag_preview::visibility", s, false)
        end)
      end,
    },
    layout  = wibox.layout.fixed.horizontal,
  }
  return widget
end

return taglist
