local awful = require "awful"
local beautiful = require "beautiful"

local mymainmenu = require "core.launcher.main_menu"


local _M = awful.widget.launcher(
  {
    image = beautiful.awesome_icon,
    menu = mymainmenu
  }
)


return _M
