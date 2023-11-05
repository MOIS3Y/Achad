local awful = require "awful"
local beautiful = require "beautiful"

local menu = require "core.menu"


local _M = awful.widget.launcher(
  {
    image = beautiful.os_logo,
    menu = menu
  }
)


return _M
