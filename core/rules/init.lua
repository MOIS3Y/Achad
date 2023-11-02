-- █▀█ █░█ █░░ █▀▀ █▀ ▀
-- █▀▄ █▄█ █▄▄ ██▄ ▄█ ▄
-- -- -- -- -- -- -- --

-- Imports:
local awful    = require "awful"
local gears    = require "gears"

local apps     = require "core.rules.apps"
local common   = require "core.rules.common"
local floating = require "core.rules.floating"
local titlebar = require "core.rules.titlebar"

-- Сollect the rules:
local rules = {
  common,
  floating,
  titlebar
}

-- Join application rules with other rules:
rules = gears.table.join(
  rules,
  apps
)

-- Register rules:
awful.rules.rules = rules
