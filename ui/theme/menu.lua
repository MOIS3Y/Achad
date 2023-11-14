-- █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local beautiful  = require "beautiful"
local gears      = require "gears"
local xresources = require "beautiful.xresources"

local color      = require "ui.theme.color"
local font       = require "ui.theme.font"
local path       = require "ui.theme.path"

-- Help functions:
local gcrci    = gears.color.recolor_image  -- recolor images func
local dpi      = xresources.apply_dpi

-- Set vars:
local icon_dir = path.icons .. "menu/"
local sub_icon = gcrci(icon_dir .. "chevrons-right.svg", color.scheme.base05)


-- Register awesome main menu color and properties:
return {
  -- Properties:
  menu_font         = font.menu,
  menu_submenu_icon = sub_icon,
  menu_height       = dpi(33),
  menu_width        = dpi(200),
  menu_border_width = dpi(1),
  --Colors:
  menu_border_color = color.scheme.base00,
  menu_fg_focus     = color.scheme.base0D,
  menu_bg_focus     = color.scheme.base01,
  menu_fg_normal    = color.scheme.base05,
  menu_bg_normal    = color.scheme.base00
}
