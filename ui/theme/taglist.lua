local xresources = require "beautiful.xresources"
local theme_assets = require "beautiful.theme_assets"

local color_scheme = require "ui.theme.color_scheme"

local dpi = xresources.apply_dpi


-- Generate taglist squares:
local taglist_square_size = dpi(4)


return {
  taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size,
    color_scheme.base04
  ),
  taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    color_scheme.base04
  )
}
