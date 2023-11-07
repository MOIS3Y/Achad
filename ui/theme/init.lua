-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ ▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄
-- -- -- -- -- -- -- -- --

-- Imports:
local gears     = require "gears"

local default   = require "ui.theme.default"
local hotkeys   = require "ui.theme.hotkeys"
local layouts   = require "ui.theme.layouts"
local menu      = require "ui.theme.menu"
local titlebar  = require "ui.theme.titlebar"
local taglist   = require "ui.theme.taglist"
local wallpaper = require "ui.theme.wallpaper"


-- Register all ui colors and properties:
return gears.table.join(
  default,
  hotkeys,
  layouts,
  menu,
  titlebar,
  taglist,
  wallpaper
)
