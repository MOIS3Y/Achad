-- █▀▀ █▀█ █░░ █▀█ █▀█ ▀
-- █▄▄ █▄█ █▄▄ █▄█ █▀▄ ▄

-- Imports:
local colorize    = require "modules.colorize"
local environment = require "environment"

-- Current theme from env:
local current_theme = environment.theme

local color = colorize.Color:new(colorize.colors[current_theme])

-- Register theme:
return color
