-- █▀█ █▀█ █░█░█ █▀▀ █▀█ █▀▄▀█ █▀▀ █▄░█ █░█   █ █▀▀ █▀█ █▄░█ █▀ ▀
-- █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄ █░▀░█ ██▄ █░▀█ █▄█   █ █▄▄ █▄█ █░▀█ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Imports:
local gears = require "gears"

local path  = require "ui.theme.path"
local color = require "ui.theme.color"


-- Set vars:
local icon_dir = path.icons .. "buttons/"
local gcrci    = gears.color.recolor_image  -- recolor images func


-- Register powermenu icons and recolor:
return {
  logout    = gcrci(icon_dir .. "log-out.svg",    color.scheme.base0D),
  lock      = gcrci(icon_dir .. "lock.svg",       color.scheme.base0C),
  suspended = gcrci(icon_dir .. "moon.svg",       color.scheme.base0B),
  hibernate = gcrci(icon_dir .. "loader.svg",     color.scheme.base0A),
  reboot    = gcrci(icon_dir .. "refresh-cw.svg", color.scheme.base09),
  shutdown  = gcrci(icon_dir .. "power.svg",      color.scheme.base08)
}
