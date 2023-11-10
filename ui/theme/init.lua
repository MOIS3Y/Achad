-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ ▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄
-- -- -- -- -- -- -- -- --

-- Imports:
local gears     = require "gears"

local default   = require "ui.theme.default"
local hotkeys   = require "ui.theme.hotkeys"
local layouts   = require "ui.theme.layouts"
local menu      = require "ui.theme.menu"
local systray   = require "ui.theme.systray"
local titlebar  = require "ui.theme.titlebar"
local taglist   = require "ui.theme.taglist"
local tooltip   = require "ui.theme.tooltip"
local wallpaper = require "ui.theme.wallpaper"
local widgets   = require "ui.theme.widgets"


-- Register all ui colors and properties:
return gears.table.join(
  default,
  hotkeys,
  layouts,
  menu,
  systray,
  titlebar,
  taglist,
  tooltip,
  wallpaper,
  widgets
)
