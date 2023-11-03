-- █░█░█ ▄▀█ █░░ █░░ █▀█ ▄▀█ █▀█ █▀▀ █▀█ ▀
-- ▀▄▀▄▀ █▀█ █▄▄ █▄▄ █▀▀ █▀█ █▀▀ ██▄ █▀▄ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Imports:
local beautiful = require "beautiful"
local gears     = require "gears"

local path      = require "ui.theme.path"


-- Register wallpaper init function and properties:
return {
    wallpaper = path.images .. "cat_leaves.png",
    set_wallpaper = function (s)
      gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
}
