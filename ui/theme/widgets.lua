-- █░█░█ █ █▀▄ █▀▀ █▀▀ ▀█▀ █▀ ▀
-- ▀▄▀▄▀ █ █▄▀ █▄█ ██▄ ░█░ ▄█ ▄

-- Imports:
local color = require "ui.theme.color"
local font  = require "ui.theme.font"
local theme = require "ui.theme.default"


local _M = {}

-- Bar widgets:
_M.keyboard_layout = {
  bg_color  = color.scheme.base0C,
  fg_color  = theme.bg_normal,
  icon_font = font.bar_widget_icon,
  text_font = font.bar_widget_text
}


_M.powermenu = {
  bg_color  = color.scheme.base0F,
  fg_color  = theme.bg_normal,
  icon_font = font.bar_widget_icon,
  text_font = font.powermenu,
}


_M.textclock = {
  bg_color_calendar = color.scheme.base0D,
  bg_color_clock    = color.scheme.base0E,
  fg_color          = theme.bg_normal,
  icon_font         = font.bar_widget_icon,
  text_font         = font.bar_widget_text,
}


_M.volume = {
  bg_color    = color.scheme.base0B,
  fg_color    = theme.bg_normal,
  icon_font   = font.bar_widget_icon,
  text_font   = font.bar_widget_text,
  mute_color  = color.scheme.base03,
  error_color = color.scheme.base08

}


_M.systray = {
  bg_color    = color.scheme.base01,
  icon_font   = font.bar_widget_icon,
}


-- Register properties:
return _M
