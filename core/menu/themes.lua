-- ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀ ▀
-- ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█ ▄

-- Imports:
local spawn = require "awful.spawn"


-- Async restart awesome may be modified in the future:
local function restart_awesome(stdout, stderr, exitreason, exitcode)
  if exitcode == 0 then
    awesome.restart()
  end
end

-- Init file stored current runtime theme:
local runtime_tmp_file = "/tmp/achad_runtime_theme.conf"


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
        end
      },
      {
        "ashes",
        function ()
          spawn.easy_async_with_shell(
            "echo ashes > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "ayu dark",
        function ()
          spawn.easy_async_with_shell(
            "echo ayu_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "bearded arc",
        function ()
          spawn.easy_async_with_shell(
            "echo bearded_arc > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "catppuccin frappe",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_frappe > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "catppuccin macchiato",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_macchiato > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "catppuccin mocha",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_mocha > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "dracula",
        function ()
          spawn.easy_async_with_shell(
            "echo dracula > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "decay",
        function ()
          spawn.easy_async_with_shell(
            "echo decay > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "everblush",
        function ()
          spawn.easy_async_with_shell(
            "echo everblush > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "everforest dark",
        function ()
          spawn.easy_async_with_shell(
            "echo everforest_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "falcon",
        function ()
          spawn.easy_async_with_shell(
            "echo falcon > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "gruvbox dark",
        function ()
          spawn.easy_async_with_shell(
            "echo gruvbox_dark > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "kanagawa",
        function ()
          spawn.easy_async_with_shell(
            "echo kanagawa > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "melange",
        function ()
          spawn.easy_async_with_shell(
            "echo melange > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "monokai",
        function ()
          spawn.easy_async_with_shell(
            "echo monokai > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "monochrome",
        function ()
          spawn.easy_async_with_shell(
            "echo monochrome > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "mountain",
        function ()
          spawn.easy_async_with_shell(
            "echo mountain > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "nord",
        function ()
          spawn.easy_async_with_shell(
            "echo nord > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "onedark",
        function ()
          spawn.easy_async_with_shell(
            "echo onedark > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "rosepine",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "rosepine moon",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine_moon > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "rxyhn",
        function ()
          spawn.easy_async_with_shell(
            "echo rxyhn > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "solarized",
        function ()
          spawn.easy_async_with_shell(
            "echo solarized > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "sweetpastel",
        function ()
          spawn.easy_async_with_shell(
            "echo sweetpastel > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "tokyodark",
        function ()
          spawn.easy_async_with_shell(
            "echo tokyodark > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "tokyonight",
        function ()
          spawn.easy_async_with_shell(
            "echo tokyonight > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "yoru",
        function ()
          spawn.easy_async_with_shell(
            "echo yoru > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      }
    }
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
        end
      },
      {
        "blossom light",
        function ()
          spawn.easy_async_with_shell(
            "echo blossom_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "catppuccin latte",
        function ()
          spawn.easy_async_with_shell(
            "echo catppuccin_latte > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "everforest light",
        function ()
          spawn.easy_async_with_shell(
            "echo everforest_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "gruvbox light",
        function ()
          spawn.easy_async_with_shell(
            "echo gruvbox_light > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "onelight",
        function ()
          spawn.easy_async_with_shell(
            "echo onelight > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
      {
        "rosepine dawn",
        function ()
          spawn.easy_async_with_shell(
            "echo rosepine_dawn > " .. runtime_tmp_file,
            restart_awesome
          )
        end
      },
    }
  }
}
