-- ▀█▀ ▄▀█ █▀ █▄▀   █░░ █ █▀ ▀█▀ ▀
-- ░█░ █▀█ ▄█ █░█   █▄▄ █ ▄█ ░█░ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"

local apps      = require "apps"
local buttons   = require "core.keybindings.buttons"
local color     = require "ui.theme.color"
local path      = require "ui.theme.path"


local icon_dir = path.icons .. "buttons/"
local gcrci    = gears.color.recolor_image  -- recolor images func

-- Init btn properties:
local tl_btn_bg_color = beautiful.tasklist.bg_color
local tl_btn_fg_color = beautiful.tasklist.fg_color
local tl_btn_press    = color:saturation(tl_btn_fg_color, 45)

local btn_icon       = gcrci(icon_dir .. "layers.svg", tl_btn_fg_color)
local btn_icon_press = gcrci(icon_dir .. "layers.svg", tl_btn_press)


-- Init tasklist widget:
local tasklist = awful.widget.tasklist {
  screen   = screen[1],
  filter   = awful.widget.tasklist.filter.allscreen,
  buttons  = buttons.tasklist,
  style = {
    shape = gears.shape.rounded_rect,
  },
  layout = {
    spacing         = 5,
    forced_num_rows = 2,
    layout = wibox.layout.grid.horizontal
  },
  widget_template = {
    {
      {
        id     = 'clienticon',
        widget = awful.widget.clienticon,
      },
      margins = 4,
      widget  = wibox.container.margin,
    },
    id              = 'background_role',
    forced_width    = 42,
    forced_height   = 42,
    widget          = wibox.container.background,
    create_callback = function(self, c, index, objects) --luacheck: no unused
        self:get_children_by_id('clienticon')[1].client = c
    end,
  },
}


-- Init widget btn:
local tasklist_btn = wibox.widget {
  {
    {
      id = "tasklist_icon",
      image = btn_icon,
      resize = true,
      forced_height = 24,
      forced_width = 24,
      widget = wibox.widget.imagebox
    },
    id = "tasklist_layout",
    top = 4, bottom = 4, left = 4, right = 4,
    layout = wibox.container.margin
  },
  id = "tasklist_container",
  bg = tl_btn_bg_color,
  fg = tl_btn_fg_color,
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background,
}


-- Init popup client icons:
local popup = awful.popup {
  widget       = tasklist,
  border_color = color.scheme.base00,
  border_width = 1,
  ontop        = true,
  visible      = false,
  offset       = { y = 5 },
  shape        = gears.shape.rounded_rect,
}


-- Init hide, show toggle popup btn:
tasklist_btn:buttons(
  gears.table.join(
    awful.button(
      {}, 1,
      function()
        if popup.visible then
          popup.visible = not popup.visible
          tasklist_btn:get_children_by_id("tasklist_icon")[1]:set_image(btn_icon)
        else
          popup:move_next_to(mouse.current_widget_geometry)
          tasklist_btn:get_children_by_id("tasklist_icon")[1]:set_image(btn_icon_press)
        end
      end
    ),
    awful.button(
      {}, 3,
      function ()
        awful.spawn(apps.launcher.rofi, false)
      end
    )
  )
)

-- replace cusor arrow to hand:
local old_cursor, old_wibox
popup:connect_signal("mouse::enter", function()
  pcall(function()
    local wb = mouse.current_wibox
    old_cursor, old_wibox = wb.cursor, wb
    wb.cursor = "hand1"
  end)
end)
-- replace cusor hand to arrow:
popup:connect_signal("mouse::leave", function()
  if old_wibox then
    old_wibox.cursor = old_cursor
    old_wibox = nil
  end
end)


return tasklist_btn
