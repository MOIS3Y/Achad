-- █▄░█ ▄▀█ █░█ █▀▀ █░█ ▀█▀ █▄█ ▀
-- █░▀█ █▀█ █▄█ █▄█ █▀█ ░█░ ░█░ ▄

-- Imports:
local xresources    = require "beautiful.xresources"

local color         = require "ui.theme.color"
local font          = require "ui.theme.font"
local default_theme = require "ui.theme.default"

local dpi = xresources.apply_dpi

local config = {}

config.presets = {
  low = {
    timeout = 5
  },
  normal = {},
  critical = {
    bg = color.scheme.base08,
    fg = color.scheme.base00,
    timeout = 0,
  },
  ok = {
    bg = color.scheme.base0B,
    fg = color.scheme.base00,
    timeout = 5,
  },
  info = {
    bg = color.scheme.base00,
    fg = color.scheme.base05,
    timeout = 5,
  },
  warn = {
    bg = color.scheme.base09,
    fg = color.scheme.base00,
    timeout = 10,
  },
}

return {
  notification_font         = font.naughty,
  notification_bg           = default_theme.bg_normal,
  notification_fg           = default_theme.fg_normal,
  notification_border_width = 1,
  notification_border_color = default_theme.bg_normal,
  notification_shape        = nil,
  notification_opacity      = nil,
  notification_margin       = dpi(50),
  notification_width        = dpi(300),
  notification_height       = nil,
  notification_max_width    = dpi(300),
  notification_max_height   = dpi(500),
  notification_icon_size    = 32,
  notification_config       = config
}
