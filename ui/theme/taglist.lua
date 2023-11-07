-- ▀█▀ ▄▀█ █▀▀   █░░ █ █▀ ▀█▀ ▀
-- ░█░ █▀█ █▄█   █▄▄ █ ▄█ ░█░ ▄
-- -- -- -- -- -- -- -- -- -- -

--Imports:
local gears = require "gears"

local color = require "ui.theme.color"
local font  = require "ui.theme.font"


-- Register taglist colors and properties:
return {
  -- Clolors:
  taglist_fg_focus     = color.scheme.base00,
  taglist_bg_focus     = color.scheme.base05,
  taglist_fg_urgent    = color.scheme.base00,
  taglist_bg_urgent    = color.scheme.base08,
  taglist_bg_occupied  = color.scheme.base0D,
  taglist_fg_occupied  = color.scheme.base00,
  taglist_bg_empty     = color.scheme.base01,
  taglist_fg_empty     = color.scheme.base05,
  taglist_bg_volatile  = color.scheme.base00,
  taglist_fg_volatile  = color.scheme.base0D,
  --Properties:
  taglist_disable_icon = true,
  taglist_font         = font.taglist,
  taglist_spacing      = 10,
  --Shapes:
  taglist_shape = function(cr, width, height )
    gears.shape.rounded_rect(cr, width, height, 5)
  end
}
