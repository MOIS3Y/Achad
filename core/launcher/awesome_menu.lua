local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local apps = require "apps"

return {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused()) 
    end
  },
  {
    "manual",
    apps.cli.terminal .. " -e man awesome"
  },
  {
    "edit config",
    apps.cli.editor .. " " .. awesome.conffile
  },
  {
    "restart",
    awesome.restart
  },
  {
    "quit",
    function()
      awesome.quit()
    end
  },
}
