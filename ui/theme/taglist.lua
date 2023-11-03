-- ▀█▀ ▄▀█ █▀▀   █░░ █ █▀ ▀█▀ ▀
-- ░█░ █▀█ █▄█   █▄▄ █ ▄█ ░█░ ▄
-- -- -- -- -- -- -- -- -- -- -

--Imports:
local gears = require "gears"

local color = require "ui.theme.color_scheme"
local font  = require "ui.theme.font"


-- Register taglist colors and properties:
return {
  -- Clolors:
  taglist_fg_focus     = color.base00,
  taglist_bg_focus     = color.base05,
  taglist_fg_urgent    = color.base00,
  taglist_bg_urgent    = color.base08,
  taglist_bg_occupied  = color.base0D,
  taglist_fg_occupied  = color.base00,
  taglist_bg_empty     = color.base01,
  taglist_fg_empty     = color.base05,
  taglist_bg_volatile  = color.base00,
  taglist_fg_volatile  = color.base0D,
  --Properties:
  taglist_disable_icon = true,
  taglist_font         = font.taglist,
  taglist_spacing      = 10,
  --Shapes:
  taglist_shape = function(cr, width, height )
    gears.shape.rounded_rect(cr, width, height, 5)
  end
}
