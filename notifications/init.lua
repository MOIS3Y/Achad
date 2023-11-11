-- █▄░█ █▀█ ▀█▀ █ █▀▀ █ █▀▀ ▄▀█ ▀█▀ █ █▀█ █▄░█ █▀ ▀
-- █░▀█ █▄█ ░█░ █ █▀░ █ █▄▄ █▀█ ░█░ █ █▄█ █░▀█ ▄█ ▄

-- Imports:
local awful      = require "awful"
local beautiful  = require "beautiful"
local naughty    = require "naughty"
local xresources = require "beautiful.xresources"

local path       = require "ui.theme.path"


local dpi   = xresources.apply_dpi
local spawn = awful.spawn


local function ring_the_bell(args)
  spawn("paplay " ..  path.sounds .. "bell.mp3", false)
  return args
end


local function gen_icon_dirs (icon_theme)
  local icon_dirs = {}
  -- Fill icon_dirs recursively from the $XDG_DATA_DIRS:
  local xdg_data_dirs = os.getenv("XDG_DATA_DIRS")
  if xdg_data_dirs then
    for xdg_path in string.gmatch(tostring(xdg_data_dirs), '([^:]+)') do
      xdg_path = xdg_path .. "/icons/" .. icon_theme .. "/"
      table.insert(icon_dirs, xdg_path)
    end
  else
    -- Fill icon_dirs from the $HOME if $XDG_DATA_DIRS doesn't exists:
    local home = os.getenv("HOME")
    if os.getenv("HOME") then
      local home_icons_dir = home .. "/.icons/" .. icon_theme .. "/"
      table.insert(icon_dirs, home_icons_dir)
      else
        -- Fill icon_dirs default values if previous doesn't exists:
        table.insert(icon_dirs, "/usr/share/pixmaps/")
        table.insert(icon_dirs, "/usr/share/icons/hicolor/")
    end
  end
  return icon_dirs
end


naughty.config = {
  padding = dpi(8),
  spacing = dpi(8),
  icon_dirs = gen_icon_dirs(beautiful.icon_theme),  -- theme from default.lua
  icon_formats = { "png", "gif", "svg", "jpeg" },
  notify_callback = ring_the_bell,
}


naughty.config.defaults = {
  timeout = 5,
  text = "",
  screen = nil,
  ontop = true,
  margin = dpi(8),
  border_width = dpi(0),
  position = "top_right"
}


naughty.config.presets = beautiful.notification_config.presets
