-- █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ ██▄ █░▀█ █▄█ ▄
-- -- -- -- -- -- -- --

-- Imports:
local xresources   = require "beautiful.xresources"
local theme_assets = require "beautiful.theme_assets"

local color_scheme = require "ui.theme.color_scheme"

-- Set vars:
local dpi = xresources.apply_dpi


-- Init menu properties and colors:
local _M = {
  -- Properties:
  menu_font         = "",
  menu_submenu      = " ",  -- nf-cod-triangle_right
  menu_height       = dpi(30),
  menu_width        = dpi(160),
  menu_border_width = dpi(1),
  --Colors:
  menu_border_color = color_scheme.base00,
  menu_fg_focus     = color_scheme.base0D,
  menu_bg_focus     = color_scheme.base00,
  menu_fg_normal    = color_scheme.base05,
  menu_bg_normal    = color_scheme.base00
}

-- Generate Awesome icon:
_M.awesome_icon = theme_assets.awesome_icon(
  dpi(100),
  color_scheme.base02,
  color_scheme.base0D
)

-- Register awesome main menu color and properties:
return _M
