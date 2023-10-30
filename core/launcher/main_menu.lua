local awful = require "awful"
local beautiful = require "beautiful"

local myawesomemenu = require "core.launcher.awesome_menu"
local apps = require "apps"


return awful.menu(
  {
    items = {
      { "awesome", myawesomemenu, beautiful.awesome_icon },
      { "open terminal", apps.cli.terminal }
    }
  }
)
