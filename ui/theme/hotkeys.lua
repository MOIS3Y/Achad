-- █░█ █▀█ ▀█▀ █▄▀ █▀▀ █▄█ █▀   █▀█ █▀█ █▀█ █░█ █▀█ ▀
-- █▀█ █▄█ ░█░ █░█ ██▄ ░█░ ▄█   █▀▀ █▄█ █▀▀ █▄█ █▀▀ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Imports:
local gears      = require "gears"
local xresources = require "beautiful.xresources"

local color = require "ui.theme.color_scheme"
local font  = require "ui.theme.font"

-- Init vars:
local dpi = xresources.apply_dpi


-- Register Hotkey popup widget colors and properties:
return {
  -- Colors:
  hotkeys_bg           = color.base00,
  hotkeys_label_bg     = color.base04,
  hotkeys_fg           = color.base05,
  hotkeys_label_fg     = color.base00,
  hotkeys_modifiers_fg = color.base0D,
  hotkeys_border_color = color.base0D,
  -- Properties:
  hotkeys_border_width = dpi(1),
  hotkeys_group_margin = dpi(10),
  -- Fonts:
  hotkeys_font             = font.hotkeys,
  hotkeys_description_font = font.hotkeys_description,
}
