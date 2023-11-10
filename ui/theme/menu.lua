-- █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ ██▄ █░▀█ █▄█ ▄

-- Imports:
local xresources = require "beautiful.xresources"

local color      = require "ui.theme.color"

-- Set vars:
local dpi = xresources.apply_dpi

-- Register awesome main menu color and properties:
return {
  -- Properties:
  menu_font         = "",
  menu_submenu      = " ",  -- nf-cod-triangle_right
  menu_height       = dpi(30),
  menu_width        = dpi(160),
  menu_border_width = dpi(1),
  --Colors:
  menu_border_color = color.scheme.base00,
  menu_fg_focus     = color.scheme.base0D,
  menu_bg_focus     = color.scheme.base00,
  menu_fg_normal    = color.scheme.base05,
  menu_bg_normal    = color.scheme.base00
}
