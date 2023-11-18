-- █░█░█ ▄▀█ █░░ █░░ █▀█ ▄▀█ █▀█ █▀▀ █▀█ ▀
-- ▀▄▀▄▀ █▀█ █▄▄ █▄▄ █▀▀ █▀█ █▀▀ ██▄ █▀▄ ▄

-- Imports:
local beautiful = require "beautiful"
local gears     = require "gears"


-- Register wallpaper init function and properties:
return {
    wallpaper = ACHAD_WALLPAPER,
    set_wallpaper = function (s)
      gears.wallpaper.maximized(beautiful.wallpaper, s)
    end
}
