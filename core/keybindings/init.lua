-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀ ▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█ ▄

-- Imports:
local awful = require "awful"
local gears = require "gears"

local keys = require "core.keybindings.keys"

local menu = require "core.menu"


-- Register all keys:
root.keys(
  gears.table.join(
    keys.apps,
    keys.awesome,
    keys.client_misc,
    keys.hardware,
    keys.launcher,
    keys.layout,
    keys.screen,
    keys.tag
  )
)

-- Register root buttons:
root.buttons(
  gears.table.join(
    awful.button(
      {}, 3,
      function ()
        menu:toggle()
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
