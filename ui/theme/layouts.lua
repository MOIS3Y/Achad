-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀ ▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -

local gears = require "gears"
local gfs = require "gears.filesystem"

local default_colors = require "ui.theme.default"

local fcn = default_colors.fg_normal  -- fg_normal color
local tp = gfs.get_themes_dir()       -- theme path
local gcrci = gears.color.recolor_image  -- recolor images func


return {
  layout_fairh =      gcrci(tp .. "default/layouts/fairhw.png", fcn),
  layout_fairv =      gcrci(tp .. "default/layouts/fairvw.png", fcn),
  layout_floating  =  gcrci(tp .. "default/layouts/floatingw.png", fcn),
  layout_magnifier =  gcrci(tp .. "default/layouts/magnifierw.png", fcn),
  layout_max =        gcrci(tp .. "default/layouts/maxw.png", fcn),
  layout_fullscreen = gcrci(tp .. "default/layouts/fullscreenw.png", fcn),
  layout_tilebottom = gcrci(tp .. "default/layouts/tilebottomw.png", fcn),
  layout_tileleft   = gcrci(tp .. "default/layouts/tileleftw.png", fcn),
  layout_tile =       gcrci(tp .. "default/layouts/tilew.png", fcn),
  layout_tiletop =    gcrci(tp .. "default/layouts/tiletopw.png", fcn),
  layout_spiral  =    gcrci(tp .. "default/layouts/spiralw.png", fcn),
  layout_dwindle =    gcrci(tp .. "default/layouts/dwindlew.png", fcn),
  layout_cornernw =   gcrci(tp .. "default/layouts/cornernww.png", fcn),
  layout_cornerne =   gcrci(tp .. "default/layouts/cornernew.png", fcn),
  layout_cornersw =   gcrci(tp .. "default/layouts/cornersww.png", fcn),
  layout_cornerse =   gcrci(tp .. "default/layouts/cornersew.png", fcn),
}
