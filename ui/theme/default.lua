-- █▀▄ █▀▀ █▀▀ ▄▀█ █░█ █░░ ▀█▀ ▀
-- █▄▀ ██▄ █▀░ █▀█ █▄█ █▄▄ ░█░ ▄

-- Imports:
local xresources = require "beautiful.xresources"

local color      = require "ui.theme.color"
local path       = require "ui.theme.path"
local font       = require "ui.theme.font"

-- Init vars:
local icon_path  = path.icons
local dpi        = xresources.apply_dpi

-- load from ~/.Xresources:
-- theme.color0  = "#1e1e2e"
-- theme.color1  = "#f38ba8"
-- theme.color2  = "#a6e3a1"
-- theme.color3  = "#fab387"
-- theme.color4  = "#89b4fa"
-- theme.color5  = "#cba6f7"
-- theme.color6  = "#94e2d5"
-- theme.color7  = "#e4e6e7"
-- theme.color8  = "#6c7086"
-- theme.color9  = "#f38ba8"
-- theme.color10 = "#a6e3a1"
-- theme.color11 = "#fab387"
-- theme.color12 = "#89b4fa"
-- theme.color13 = "#cba6f7"
-- theme.color14 = "#94e2d5"
-- theme.color15 = "#f2f4f5"

-- Register default colors and properties:
return {
  font          = font.default,
  -- Background colors:
  bg_normal     = color.scheme.base00,
  bg_focus      = color.scheme.base00,
  bg_urgent     = color.scheme.base00,
  bg_minimize   = color.scheme.base00,
  bg_systray    = color.scheme.base00,
  -- Foreground colors:
  fg_normal     = color.scheme.base05,
  fg_focus      = color.scheme.base0D,
  fg_urgent     = color.scheme.base08,
  fg_minimize   = color.scheme.base05,
  -- Client colors:
  border_normal = color.scheme.base00,
  border_focus  = color.scheme.base0D,
  border_marked = color.scheme.base09,
  -- Client properties:
  useless_gap   = dpi(4),
  border_width  = dpi(1),
  -- Icon theme:
  icon_theme    = nil,
  -- OS logo:
  os_logo       = icon_path .. "logo/os.png"
}
