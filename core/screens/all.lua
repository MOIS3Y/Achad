-- ▄▀█ █░░ █░░   █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ █▀ ▀
-- █▀█ █▄▄ █▄▄   ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█ ▄█ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"

local tags    = require "core.tags"
local widgets = require "ui.widgets"

local bars = widgets.bars

-- Init UI:
awful.screen.connect_for_each_screen(
  function(s)
    -- Init wallpaper for each screen:
    beautiful.set_wallpaper(s)
    -- Init taglist for each screen:
    tags.generate_tags(s)
    -- Init bar for each screen:
    bars.main.init(s)
  end
)
