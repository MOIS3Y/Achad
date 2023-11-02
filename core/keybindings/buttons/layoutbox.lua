-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▄▄ █▀█ ▀▄▀   █▄▄ █░█ ▀█▀ ▀█▀ █▀█ █▄░█ █▀ ▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ █▄█ █▄█ █░█   █▄█ █▄█ ░█░ ░█░ █▄█ █░▀█ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

local awful = require "awful"
local gears = require "gears"


return gears.table.join(
  -- Click left/right:
  awful.button({ }, 1, function () awful.layout.inc( 1) end),
  awful.button({ }, 3, function () awful.layout.inc(-1) end),
  -- Wheel up/down:
  awful.button({ }, 4, function () awful.layout.inc( 1) end),
  awful.button({ }, 5, function () awful.layout.inc(-1) end)
)
