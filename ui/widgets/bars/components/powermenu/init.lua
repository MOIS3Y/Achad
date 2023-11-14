-- █▀█ █▀█ █░█░█ █▀▀ █▀█ █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄ █░▀░█ ██▄ █░▀█ █▄█ ▄

--[[
  Origin:
  Logout Menu Widget for Awesome Window Manager
  https://github.com/streetturtle/awesome-wm-widgets/
  @author Pavel Makhov
  @copyright 2020 Pavel Makhov
--]]

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local wibox     = require "wibox"
local gears     = require "gears"

local color     = require "ui.theme.color"
local power     = require "apps.power"
local icons     = require "ui.widgets.bars.components.powermenu.icons"


-- Init btn properties:
local icon_font       = beautiful.powermenu.icon_font
local text_font       = beautiful.powermenu.text_font
local pm_btn_bg_color = beautiful.powermenu.bg_color
local pm_btn_fg_color = beautiful.bg_normal
local pm_btn_press    = color:saturation(pm_btn_bg_color, 50)


-- Init widget btn:
local logout_menu_widget = wibox.widget {
  {
    {
      text = " ",  -- nf-fa-power_off
      font = icon_font,
      widget = wibox.widget.textbox,
    },
    top = 4, bottom = 4, left = 8, right = 4,
    layout = wibox.container.margin
  },
  bg = pm_btn_bg_color,
  fg = pm_btn_fg_color,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background,
}

-- Init popup form:
local popup = awful.popup {
  ontop = true,
  visible = false,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  border_width = 1,
  border_color = beautiful.bg_focus,
  maximum_width = 400,
  offset = { y = 5 },
  widget = {}
}

-- Init powermenu items:
local rows = { layout = wibox.layout.fixed.vertical }

local menu_items = {
  { name = 'Log out',   icon = icons.logout,    command = power.logout     },
  { name = 'Lock',      icon = icons.lock,      command = power.lock       },
  { name = 'Suspend',   icon = icons.suspended, command = power.suspend    },
  { name = 'Hibernate', icon = icons.hibernate, command = power.hibernate  },
  { name = 'Reboot',    icon = icons.reboot,    command = power.reboot     },
  { name = 'Sutdown',   icon = icons.shutdown,  command = power.shutdown   },
}

for _, item in ipairs(menu_items) do
  local row = wibox.widget {
    {
      {
        {
          image = item.icon,
          resize = true,
          forced_height = 16,
          forced_width = 16,
          widget = wibox.widget.imagebox
        },
        {
          text = item.name,
          font = text_font,
          forced_width = 80,
          widget = wibox.widget.textbox
        },
        spacing = 12,
        layout = wibox.layout.fixed.horizontal
      },
      margins = 8,
      layout = wibox.container.margin
    },
    bg = beautiful.bg_normal,
    widget = wibox.container.background
  }


  -- higlight elements:
  row:connect_signal("mouse::enter", function(c) c:set_fg(beautiful.fg_focus) end)
  row:connect_signal("mouse::enter", function(c) c:set_bg(color.scheme.base01) end)
  row:connect_signal("mouse::leave", function(c) c:set_fg(beautiful.fg_normal) end)
  row:connect_signal("mouse::leave", function(c) c:set_bg(beautiful.bg_normal) end)


  -- replace cusor arrow to hand:
  local old_cursor, old_wibox
  row:connect_signal("mouse::enter", function()
    pcall(function()
      local wb = mouse.current_wibox
      old_cursor, old_wibox = wb.cursor, wb
      wb.cursor = "hand1"
    end)
  end)
  -- replace cusor hand to arrow:
  row:connect_signal("mouse::leave", function()
    if old_wibox then
      old_wibox.cursor = old_cursor
      old_wibox = nil
    end
  end)


  -- hide menu after press:
  row:buttons(
    gears.table.join(
      awful.button(
        {}, 1,
        function()
          popup.visible = not popup.visible
          item.command()
        end
        )
      )
    )
  table.insert(rows, row)
end


-- Init powermenu popup:
popup:setup(rows)


-- Init buttons:
logout_menu_widget:buttons(
  gears.table.join(
    awful.button(
      {}, 1,
      function()
        if popup.visible then
          popup.visible = not popup.visible
          logout_menu_widget:set_bg(pm_btn_bg_color)
        else
          popup:move_next_to(mouse.current_widget_geometry)
          logout_menu_widget:set_bg(pm_btn_press)
        end
      end
    )
  )
)


return logout_menu_widget
