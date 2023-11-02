local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local wibox = require "wibox"

local buttons = require "core.keybindings.buttons"
local mylauncher = require "ui.widgets.launcher"

local dpi = beautiful.xresources.apply_dpi


-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()


awful.screen.connect_for_each_screen(
  function(s)
    -- Wallpaper
    beautiful.set_wallpaper(s)
    -- Each screen has its own tag table.
    awful.tag(
      { " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " },
      s,
      awful.layout.layouts[1]
    )

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(buttons.layoutbox)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = buttons.taglist
    }
    -- Create the wibox
    s.mywibox = awful.wibar(
      {
        position = "top",
        height = 35,
        screen = s
      }
    )
    -- Add widgets to the wibox
    s.mywibox:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        { 
          mylauncher,
          margins = dpi(5),
          widget = wibox.container.margin
        },
        s.mypromptbox,
        { 
          s.mytaglist,
          margins = dpi(5),
          widget = wibox.container.margin
        },
        {
          s.mylayoutbox,
          margins = dpi(7),
          widget = wibox.container.margin
        }
      },
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
      },
    }
  end
)
