-- █▀█ █░█ █▄░█ ▀█▀ █ █▀▄▀█ █▀▀ ▀
-- █▀▄ █▄█ █░▀█ ░█░ █ █░▀░█ ██▄ ▄

-- Imports:
local path = require "ui.theme.path"


-- Init default runtime config:
local default = {
  device = "pc",
  os = "nixos",
  theme  = {
    color_scheme = "catppuccin_mocha",
    icon_theme = "Papirus",
    os_logo = path.icons .. "logo/" .. "awesomewm.svg",
    wallpaper = {
      auto = true,
      file = path.images .. "wallpapers/" .. "catppuccin_mocha.png"
    }
  },
  apps = {
    cli = {
      terminal = "wezterm",
      editor = "hx",
      explorer = "lf"
    },
    gui = {
      browser = "firefox",
      editor = "code",
      screenshot = "flameshot gui"
    },
    launcher = {
      default = "rofi -show drun"
    },
    power = {
      lock      = "i3lock-run",
      hibernate = "systemctl hibernate",
      reboot    = "reboot",
      suspend   = "systemctl suspend",
      shutdown  = "shutdown now"
    }
  }
}


return default
