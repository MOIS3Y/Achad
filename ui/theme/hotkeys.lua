-- █░█ █▀█ ▀█▀ █▄▀ █▀▀ █▄█ █▀   █▀█ █▀█ █▀█ █░█ █▀█ ▀
-- █▀█ █▄█ ░█░ █░█ ██▄ ░█░ ▄█   █▀▀ █▄█ █▀▀ █▄█ █▀▀ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Imports:
local gears      = require "gears"
local xresources = require "beautiful.xresources"

local color = require "ui.theme.color"
local font  = require "ui.theme.font"

-- Init vars:
local dpi = xresources.apply_dpi


-- Register Hotkey popup widget colors and properties:
return {
  -- Colors:
  hotkeys_bg           = color.scheme.base00,
  hotkeys_label_bg     = color.scheme.base04,
  hotkeys_fg           = color.scheme.base05,
  hotkeys_label_fg     = color.scheme.base00,
  hotkeys_modifiers_fg = color.scheme.base0D,
  hotkeys_border_color = color.scheme.base0D,
  -- Properties:
  hotkeys_border_width = dpi(1),
  hotkeys_group_margin = dpi(10),
  -- Fonts:
  hotkeys_font             = font.hotkeys,
  hotkeys_description_font = font.hotkeys_description,
}
