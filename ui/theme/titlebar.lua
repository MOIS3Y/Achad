-- ▀█▀ █ ▀█▀ █░░ █▀▀ █▄▄ ▄▀█ █▀█ ▀
-- ░█░ █ ░█░ █▄▄ ██▄ █▄█ █▀█ █▀▄ ▄

-- Imports:
local gears = require "gears"

local path  = require "ui.theme.path"

local color         = require "ui.theme.color"
local default_theme = require "ui.theme.default"

-- Set btn colors:
local normal   = color.scheme.base02
local close    = color.scheme.base08
local minimize = color.scheme.base0A
local maximize = color.scheme.base0B

-- Recolor images func shourtcut: 
local gcrci = gears.color.recolor_image

-- Icon path shourtcut:
local ip = path.icons .. "titlebar/"

-- Recolor buttons:
local btn = {
  -- Close Button icons:
  close_normal       = gcrci(ip .. "normal.svg", normal),
  close_focus        = gcrci(ip .. "close_focus.svg", close),
  close_normal_hover = gcrci(ip .. "close_focus_hover.svg", close),
  close_focus_hover  = gcrci(ip .. "close_focus_hover.svg", close),
  -- Minimize Button icons:
  min_normal         = gcrci(ip .. "normal.svg", normal),
  min_focus          = gcrci(ip .. "minimize_focus.svg", minimize),
  min_normal_hover   = gcrci(ip .. "minimize_focus_hover.svg", minimize),
  min_focus_hover    = gcrci(ip .. "minimize_focus_hover.svg", minimize),
  -- Maximized Button (While Window is Maximized) icons:
  max_normal_active       = gcrci(ip .. "normal.svg", normal),
  max_focus_active        = gcrci(ip .. "maximized_focus.svg", maximize),
  max_normal_active_hover = gcrci(ip .. "maximized_focus_hover.svg", maximize),
  max_focus_active_hover  = gcrci(ip .. "maximized_focus_hover.svg", maximize),
  -- Maximized Button (While Window is not Maximized) icons:
  max_normal_inactive       = gcrci(ip .. "normal.svg", normal),
  max_focus_inactive        = gcrci(ip .. "maximized_focus.svg", maximize),
  max_normal_inactive_hover = gcrci(ip .. "maximized_focus_hover.svg", maximize),
  max_focus_inactive_hover  = gcrci(ip .. "maximized_focus_hover.svg", maximize)
}

-- Register buttons:
return {
  -- Titlebar properties:
  titlebar_fg_normal = default_theme.fg_normal,
  titlebar_bg_normal = default_theme.bg_normal,
  titlebar_fg        = default_theme.fg_normal,
  titlebar_bg        = default_theme.bg_normal,
  -- Close Button icons:
  titlebar_close_button_normal          = btn.close_normal,
  titlebar_close_button_focus           = btn.close_focus,
  titlebar_close_button_normal_hover    = btn.close_normal_hover,
  titlebar_close_button_focus_hover     = btn.close_focus_hover,
  -- Minimize Button icons:
  titlebar_minimize_button_normal       = btn.min_normal,
  titlebar_minimize_button_focus        = btn.min_focus,
  titlebar_minimize_button_normal_hover = btn.min_normal_hover,
  titlebar_minimize_button_focus_hover  = btn.min_focus_hover,
  -- Maximized Button (While Window is Maximized) icons:
  titlebar_maximized_button_normal_active       = btn.max_normal_active,
  titlebar_maximized_button_focus_active        = btn.max_focus_active,
  titlebar_maximized_button_normal_active_hover = btn.max_normal_active_hover,
  titlebar_maximized_button_focus_active_hover  = btn.max_focus_active_hover,
  -- Maximized Button (While Window is not Maximized) icons:
  titlebar_maximized_button_normal_inactive       = btn.max_normal_inactive,
  titlebar_maximized_button_focus_inactive        = btn.max_focus_inactive,
  titlebar_maximized_button_normal_inactive_hover = btn.max_normal_inactive_hover,
  titlebar_maximized_button_focus_inactive_hover  = btn.max_focus_inactive_hover
}
