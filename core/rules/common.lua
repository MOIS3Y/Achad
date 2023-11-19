-- █▀▀ █▀█ █▀▄▀█ █▀▄▀█ █▀█ █▄░█   █▀█ █░█ █░░ █▀▀ █▀ ▀
-- █▄▄ █▄█ █░▀░█ █░▀░█ █▄█ █░▀█   █▀▄ █▄█ █▄▄ ██▄ ▄█ ▄

-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local buttons   = require "core.keybindings.buttons"
local keys      = require "core.keybindings.keys"


-- A common set of rules that applies to all clients:
return {
  rule = {},
  properties = {
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus        = awful.client.focus.filter,
    raise        = true,
    keys         = keys.client_unique,
    buttons      = buttons.client,
    screen       = awful.screen.preferred,
    placement    = awful.placement.centered
  },
  callback = awful.client.setslave
}
