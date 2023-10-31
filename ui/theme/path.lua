-- █▀█ ▄▀█ ▀█▀ █░█ ▀
-- █▀▀ █▀█ ░█░ █▀█ ▄
-- -- -- -- -- -- -

local gfs = require "gears.filesystem"
local assets_dir = gfs.get_configuration_dir() .. "assets/"


return {
  icons = assets_dir .. "icons/",
  images = assets_dir .. "images/"
}
