-- ▀█▀ ▄▀█ █▀▀   █▀█ █▀█ █▀▀ █░█ █ █▀▀ █░█░█ ▀
-- ░█░ █▀█ █▄█   █▀▀ █▀▄ ██▄ ▀▄▀ █ ██▄ ▀▄▀▄▀ ▄

-- Imports:
local color = require "ui.theme.color"


-- Register tag preview properties:
return {
  tag_preview_widget_border_radius = 6,
  tag_preview_client_border_radius = 6,
  tag_preview_client_opacity       = 1,
  tag_preview_client_bg            = color.scheme.base01,
  tag_preview_client_border_color  = color.scheme.base01,
  tag_preview_client_border_width  = 0,
  tag_preview_widget_bg            = color.scheme.base00,
  tag_preview_widget_border_color  = color.scheme.base00,
  tag_preview_widget_border_width  = 4,
  tag_preview_widget_margin        = 4
}
