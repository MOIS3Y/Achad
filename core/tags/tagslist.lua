-- ▀█▀ ▄▀█ █▀▀ █▀   █░░ █ █▀ ▀█▀ ▀
-- ░█░ █▀█ █▄█ ▄█   █▄▄ █ ▄█ ░█░ ▄

-- Imports:
local awful = require "awful"


-- Init tags generator func:
local generate_tags = function (s)  -- s as screen
  awful.tag.add(" 1 ", {
    index              = 1,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
    selected           = true,
  })
  awful.tag.add(" 2 ", {
    index              = 2,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 3 ", {
    index              = 3,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 4 ", {
    index              = 4,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 5 ", {
    index              = 5,
    layout             = awful.layout.suit.floating,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 6 ", {
    index              = 6,
    layout             = awful.layout.suit.floating,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 7 ", {
    index              = 7,
    layout             = awful.layout.suit.floating,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 8 ", {
    index              = 8,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
  awful.tag.add(" 9 ", {
    index              = 9,
    layout             = awful.layout.suit.max,
    gap_single_client  = true,
    gap                = 4,
    screen             = s,
  })
end

-- Register tags generator func:
return generate_tags
