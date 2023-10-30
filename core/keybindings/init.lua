local awful = require "awful"
local gears = require "gears"

local keys = require "core.keybindings.keys"

local mymainmenu = require "core.launcher.main_menu"


root.keys(
    gears.table.join(
    keys.awesome,
    keys.client_misc,
    keys.launcher,
    keys.layout,
    keys.screen,
    keys.tag
  )
)

root.buttons(
  gears.table.join(
    awful.button(
      {}, 3,
      function ()
        mymainmenu:toggle()
      end
    ),
    awful.button(
      {}, 4,
      awful.tag.viewnext
    ),
    awful.button(
      {}, 5,
      awful.tag.viewprev
    )
  )
)
