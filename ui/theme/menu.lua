-- █▀▄▀█ █▀▀ █▄░█ █░█ ▀
-- █░▀░█ ██▄ █░▀█ █▄█ ▄
-- -- -- -- -- -- -- --
local xresources = require "beautiful.xresources"
local theme_assets = require "beautiful.theme_assets"

local color_scheme = require "ui.theme.color_scheme"

local dpi = xresources.apply_dpi


local _M = {
  menu_submenu_icon = "󰁖",  -- nf-md-arrow_right_bold_circle
  menu_height = dpi(30),
  menu_width  = dpi(150),
}

-- Generate Awesome icon:
_M.awesome_icon = theme_assets.awesome_icon(
  _M.menu_height,
  color_scheme.base00,
  color_scheme.base0D
)

return _M
