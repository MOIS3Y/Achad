-- █▀█ ▄▀█ ▀█▀ █░█ ▀
-- █▀▀ █▀█ ░█░ █▀█ ▄
-- -- -- -- -- -- -

-- Imports:
local gfs = require "gears.filesystem"

-- Set vars:
local assets_dir = gfs.get_configuration_dir() .. "assets/"

-- Register paths:
return {
  icons = assets_dir .. "icons/",
  images = assets_dir .. "images/"
}
