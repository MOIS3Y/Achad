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

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"


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
