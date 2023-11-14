-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀ ▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█ ▄

-- Imports:
local awful   = require "awful"
local gears   = require "gears"
local spawn = require "awful.spawn"

local apps    = require "apps"
local color   = require "ui.theme.color"
local paths   = require "ui.theme.path"


-- Async restart awesome may be modified in the future:
local function restart_awesome(stdout, stderr, exitreason, exitcode)
  if exitcode == 0 then
    awesome.restart()
  end
end

-- Init file stored current runtime theme:
local runtime_tmp_file = "/tmp/achad_runtime_theme.conf"


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
        function ()
          spawn.easy_async_with_shell(
            "echo aquarium > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "ashes",
        function ()
          spawn.easy_async_with_shell(
            "echo ashes > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "ayu dark",
        function ()
          spawn.easy_async_with_shell(
            "echo ayu_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "bearded arc",
        function ()
          spawn.easy_async_with_shell(
            "echo bearded_arc > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "catppuccin frappe",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_frappe > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "catppuccin macchiato",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_macchiato > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "catppuccin mocha",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_mocha > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "dracula",
        function ()
          spawn.easy_async_with_shell(
            "echo dracula > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "decay",
        function ()
          spawn.easy_async_with_shell(
            "echo decay > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "everblush",
        function ()
          spawn.easy_async_with_shell(
            "echo everblush > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "everforest dark",
        function ()
          spawn.easy_async_with_shell(
            "echo everforest_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "falcon",
        function ()
          spawn.easy_async_with_shell(
            "echo falcon > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "gruvbox dark",
        function ()
          spawn.easy_async_with_shell(
            "echo gruvbox_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "kanagawa",
        function ()
          spawn.easy_async_with_shell(
            "echo kanagawa > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "melange",
        function ()
          spawn.easy_async_with_shell(
            "echo melange > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "monokai",
        function ()
          spawn.easy_async_with_shell(
            "echo monokai > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "monochrome",
        function ()
          spawn.easy_async_with_shell(
            "echo monochrome > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "mountain",
        function ()
          spawn.easy_async_with_shell(
            "echo mountain > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "nord",
        function ()
          spawn.easy_async_with_shell(
            "echo nord > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "onedark",
        function ()
          spawn.easy_async_with_shell(
            "echo onedark > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "rosepine",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "rosepine moon",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine_moon > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "rxyhn",
        function ()
          spawn.easy_async_with_shell(
            "echo rxyhn > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "solarized",
        function ()
          spawn.easy_async_with_shell(
            "echo solarized > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "sweetpastel",
        function ()
          spawn.easy_async_with_shell(
            "echo sweetpastel > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "tokyodark",
        function ()
          spawn.easy_async_with_shell(
            "echo tokyodark > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "tokyonight",
        function ()
          spawn.easy_async_with_shell(
            "echo tokyonight > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "yoru",
        function ()
          spawn.easy_async_with_shell(
            "echo yoru > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
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
        function ()
          spawn.easy_async_with_shell(
            "echo ayu_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "blossom light",
        function ()
          spawn.easy_async_with_shell(
            "echo blossom_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "catppuccin latte",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_latte > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "everforest light",
        function ()
          spawn.easy_async_with_shell(
            "echo everforest_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "gruvbox light",
        function ()
          spawn.easy_async_with_shell(
            "echo gruvbox_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "onelight",
        function ()
          spawn.easy_async_with_shell(
            "echo onelight > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
      {
        "rosepine dawn",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine_dawn > " .. runtime_tmp_file,
            restart_awesome
          )
        end,
        scheme_icon
      },
    }, light_icon
  }
}
