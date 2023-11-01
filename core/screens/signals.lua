-- █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ █▀   █▀ █ █▀▀ █▄░█ ▄▀█ █░░ █▀ ▀
-- ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█ ▄█   ▄█ █ █▄█ █░▀█ █▀█ █▄▄ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

local beautiful = require "beautiful"


-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", beautiful.set_wallpaper)


screen.connect_signal(
  "arrange",
  function (s)
    local max = s.selected_tag.layout.name == "max"
    local floating = s.selected_tag.layout.name == "floating"
    -- use tiled_clients so that other floating windows don't affect the count
    local only_one = #s.tiled_clients == 1
    -- but iterate over clients instead of tiled_clients as tiled_clients 
    -- doesn't include maximized windows
    for _, c in pairs(s.clients) do
      if (max or floating or only_one) and not c.floating or c.maximized then
        c.border_width = 0
      else
        c.border_width = beautiful.border_width
      end
    end
  end
)
