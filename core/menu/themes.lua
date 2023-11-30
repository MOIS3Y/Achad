-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀ ▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█ ▄

-- Imports:
local gears   = require "gears"

local color   = require "ui.theme.color"
local json    = require "modules.json"
local paths   = require "ui.theme.path"


local function restart_awesome(color_scheme)
  -- Parse runtime config file:
  local file = io.open(ACHAD_RUNTIME_FILE, "rb")
  if not file then return nil end
  local content = file:read("*a")
  file:close()
  local config = json.serializer.decode(content)
  config.theme.color_scheme = color_scheme
  config = json.prettier:pretty_print(config)
  -- Save new theme to runtime config:
  file = io.open(ACHAD_RUNTIME_FILE, "wb")
  if not file then return nil end
  file:write(config)
  file:close()
  -- add more logic here ...
  -- Finaly restart awesome:
  awesome.restart()
end

local gcrci   = gears.color.recolor_image  -- recolor images func

-- Set icon dir:
local icon_dir = paths.icons .. "menu/"

-- Init icons:
local icon_color = color.scheme.base0D

local dark_icon   = gcrci(icon_dir .. "moon.svg",          icon_color)
local light_icon  = gcrci(icon_dir .. "sun.svg",           icon_color)
local scheme_icon = gcrci(icon_dir .. "color_palette.svg", icon_color)


-- Register themes menu:
return {
  {
    -- █████████████████████████
    -- █▄─▄▄▀██▀▄─██▄─▄▄▀█▄─█─▄█
    -- ██─██─██─▀─███─▄─▄██─▄▀██
    -- ▀▄▄▄▄▀▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀
    "Dark", {
      {
        "aquarium",
        function () restart_awesome("aquarium") end,
        scheme_icon
      },
      { "ashes",
        function () restart_awesome("ashes") end,
        scheme_icon
      },
      {
        "ayu dark",
        function () restart_awesome("ayu_dark") end,
        scheme_icon
      },
      {
        "bearded arc",
        function () restart_awesome("bearded_arc")end,
        scheme_icon
      },
      {
        "catppuccin frappe",
        function () restart_awesome("catppuccin_frappe") end,
        scheme_icon
      },
      {
        "catppuccin macchiato",
        function () restart_awesome("catppuccin_macchiato") end,
        scheme_icon
      },
      {
        "catppuccin mocha",
        function () restart_awesome("catppuccin_mocha") end,
        scheme_icon
      },
      {
        "dracula",
        function () restart_awesome("dracula") end,
        scheme_icon
      },
      {
        "decay",
        function () restart_awesome("decay") end,
        scheme_icon
      },
      {
        "everblush",
        function () restart_awesome("everblush") end,
        scheme_icon
      },
      {
        "everforest dark",
        function () restart_awesome("everforest_dark") end,
        scheme_icon
      },
      {
        "falcon",
        function () restart_awesome("falcon") end,
        scheme_icon
      },
      {
        "gruvbox dark",
        function () restart_awesome("gruvbox_dark") end,
        scheme_icon
      },
      {
        "kanagawa",
        function () restart_awesome("kanagawa") end,
        scheme_icon
      },
      {
        "melange",
        function () restart_awesome("melange") end,
        scheme_icon
      },
      {
        "monokai",
        function () restart_awesome("monokai") end,
        scheme_icon
      },
      {
        "monochrome",
        function () restart_awesome("monochrome") end,
        scheme_icon
      },
      {
        "mountain",
        function () restart_awesome("mountain") end,
        scheme_icon
      },
      {
        "nord",
        function () restart_awesome("nord") end,
        scheme_icon
      },
      {
        "onedark",
        function () restart_awesome("onedark") end,
        scheme_icon
      },
      {
        "rosepine",
        function () restart_awesome("rosepine") end,
        scheme_icon
      },
      {
        "rosepine moon",
        function () restart_awesome("rosepine_moon") end,
        scheme_icon
      },
      {
        "rxyhn",
        function () restart_awesome("rxyhn") end,
        scheme_icon
      },
      {
        "solarized",
        function () restart_awesome("solarized") end,
        scheme_icon
      },
      {
        "sweetpastel",
        function () restart_awesome("sweetpastel") end,
        scheme_icon
      },
      {
        "tokyodark",
        function () restart_awesome("tokyodark") end,
        scheme_icon
      },
      {
        "tokyonight",
        function () restart_awesome("tokyonight") end,
        scheme_icon
      },
      {
        "yoru",
        function () restart_awesome("yoru") end,
        scheme_icon
      }
    }, dark_icon
  },
  {
    -- █▄─▄███▄─▄█─▄▄▄▄█─█─█─▄─▄─█
    -- ██─██▀██─██─██▄─█─▄─███─███
    -- ▀▄▄▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▀▄▀▀▄▄▄▀▀
    "Light", {
      {
        "ayu light",
        function () restart_awesome("ayu_light") end,
        scheme_icon
      },
      {
        "blossom light",
        function () restart_awesome("blossom_light") end,
        scheme_icon
      },
      {
        "catppuccin latte",
        function () restart_awesome("catppuccin_latte") end,
        scheme_icon
      },
      {
        "everforest light",
        function () restart_awesome("everforest_light") end,
        scheme_icon
      },
      {
        "gruvbox light",
        function () restart_awesome("gruvbox_light") end,
        scheme_icon
      },
      {
        "onelight",
        function () restart_awesome("onelight") end,
        scheme_icon
      },
      {
        "rosepine dawn",
        function () restart_awesome("rosepine_dawn") end,
        scheme_icon
      }
    }, light_icon
  }
}
