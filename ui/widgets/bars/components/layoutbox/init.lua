-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀   █▄▄ █▀█ ▀▄▀ ▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░   █▄█ █▄█ █░█ ▄

-- Imports:
local awful       = require "awful"

local buttons     = require "core.keybindings.buttons"


local function layoutbox(s)
  local layoutbox_widget = awful.widget.layoutbox(s)
  layoutbox_widget:buttons(buttons.layoutbox)
  return layoutbox_widget
end


return layoutbox
