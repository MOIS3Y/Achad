-- █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ ██▄ █░▀█ █▄█ ▄
-- -- -- -- -- -- -- --
local xresources = require "beautiful.xresources"
local theme_assets = require "beautiful.theme_assets"

local color_scheme = require "ui.theme.color_scheme"

local dpi = xresources.apply_dpi


local _M = {
  -- Properties:
  menu_font = "",
  menu_submenu = " ",  -- nf-cod-triangle_right
  menu_height = dpi(30),
  menu_width  = dpi(150),
  menu_border_width = dpi(1), 	-- The menu item border width.
  --Colors:
  menu_border_color = color_scheme.base00, 	-- The menu item border color.
  menu_fg_focus = color_scheme.base0D, 	    -- The default focused item foreground (text) color.
  menu_bg_focus = color_scheme.base00, 	    -- The default focused item background color.
  menu_fg_normal = color_scheme.base04, 	    -- The default foreground (text) color.
  menu_bg_normal = color_scheme.base00 	    -- The default background color.
}

-- Generate Awesome icon:
_M.awesome_icon = theme_assets.awesome_icon(
  _M.menu_height,
  color_scheme.base00,
  color_scheme.base0D
)

return _M
