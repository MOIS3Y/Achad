-- █▀▄▀█ ▄▀█ █ █▄░█   █▄▄ ▄▀█ █▀█ ▀
-- █░▀░█ █▀█ █ █░▀█   █▄█ █▀█ █▀▄ ▄

-- Imports:
local awful      = require "awful"
local beautiful  = require "beautiful"
local wibox      = require "wibox"

local components = require "ui.widgets.bars.components"


local dpi = beautiful.xresources.apply_dpi

local _M = {}


_M.init = function (s)
  -- Bind widgets to each screen:
  s.layoutbox = components.layoutbox(s)
  s.taglist   = components.tagslist(s)
  s.tasklist  = components.tasklist(s)
    -- Create the wibox
  local bar = awful.wibar {
    position = "top",
    height = 35,
    screen = s
  }
  -- Add widgets to the wibox:
  bar:setup {
    -- -- -- -- -- Left widgets -- -- -- -- --
    {
      {
        components.launcher,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        s.taglist,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.systray,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        s.layoutbox,
        margins = dpi(8),
        widget = wibox.container.margin
      },
      {
        s.tasklist,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      layout = wibox.layout.fixed.horizontal
    },
    -- -- -- -- -- Center widgets -- -- -- -- --
    {
      {
        margins = dpi(5),
        widget = wibox.container.margin
      },
      layout = wibox.layout.align.horizontal
    },
    -- -- -- -- -- Right widgets -- -- -- -- --
    {
      {
        components.cpu,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.memory,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.microphone,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.volume,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.keyboard_layout,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.textclock.calendar,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.textclock.clock,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      {
        components.powermenu,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      layout = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.align.horizontal
  }
end


return _M
