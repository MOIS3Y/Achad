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
local tl_btn_press    = color.scheme.base0B

local btn_icon        = gcrci(icon_dir .. "layers.svg", tl_btn_fg_color)
local btn_icon_press  = gcrci(icon_dir .. "layers.svg", tl_btn_press)


local function tasklist (s)
  local tasklist_widget = awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons  = buttons.tasklist,
    style = {
      bg_normal                 = color.scheme.base01,
      bg_focus                  = color.scheme.base01,
      border_color_focus        = color.scheme.base0D,
      shape_border_color        = color.scheme.base00,
      shape_border_color_focus  = color.scheme.base0B,
      shape_border_color_urgent = color.scheme.base08,
      shape_border_width        = 1,
      align                     = "center",
      shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 4)
      end,
    },
    layout = {
      spacing = 10,
      layout = wibox.layout.grid.horizontal
    },
    widget_template = {
      {
        {
          id     = 'clienticon',
          widget = awful.widget.clienticon,
        },
        top = 4, bottom = 4, left = 7, right = 5,
        widget  = wibox.container.margin,
      },
      id              = 'background_role',
      forced_width    = 32,
      forced_height   = 32,
      visible         = true,
      widget          = wibox.container.background,
      create_callback = function(self, c, index, objects) --luacheck: no unused
        self:get_children_by_id('clienticon')[1].client = c
        local tooltip = awful.tooltip({
          objects = { self },
          timer_function = function()
            return c.name
          end,
        })
        tooltip.align = "left"
        tooltip.mode = "outside"
        tooltip.margins = 8
        tooltip.preferred_positions = {"bottom"}
        tooltip.preferred_alignments = {"middle"}
      end
    },
  }
  local btn = wibox.widget {
    {
      {
        {
          id = "tasklist_icon",
          image = btn_icon,
          resize = true,
          forced_height = 24,
          forced_width = 24,
          widget = wibox.widget.imagebox
        },
        top = 3, bottom = 3, left = 8, right = 8,
        widget = wibox.container.margin
      },
      {
        {
          id = "tasklist_widget",
          widget = tasklist_widget,
          visible = false
        },
        widget = wibox.container.margin
      },
      id = "tasklist_layout",
      layout = wibox.layout.fixed.horizontal
    },
    id = "tasklist_container",
    bg = tl_btn_bg_color,
    fg = tl_btn_fg_color,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 4)
    end,
    widget = wibox.container.background,
  }
  -- Init btn for hide, show tasklist widget:
  btn:get_children_by_id("tasklist_icon")[1]:buttons(
    gears.table.join(
      awful.button(
        {}, 1,
        function()
          local w = btn:get_children_by_id("tasklist_widget")[1]
          if w.visible then
            w.visible = not w.visible
            btn:get_children_by_id("tasklist_icon")[1]:set_image(btn_icon)
          else
            w.visible = true
            btn:get_children_by_id("tasklist_icon")[1]:set_image(btn_icon_press)
          end
        end
      ),
      awful.button(
        {}, 3,
        function ()
          awful.spawn(apps.launcher.default, false)
        end
      )
    )
  )
  return btn
end


return tasklist
