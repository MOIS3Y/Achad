-- █▀▀ █▄░█ █░█ █ █▀█ █▀█ █▄░█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ ▀
-- ██▄ █░▀█ ▀▄▀ █ █▀▄ █▄█ █░▀█ █░▀░█ ██▄ █░▀█ ░█░ ▄

-- Imports:
local initializers = require "environment.initializers"


-- -- -- -- -- GLOBAL ENVIRONMENT VARIABLES -- -- -- -- --

ACHAD_RUNTIME_FILE = initializers.set_default_runtime_conf()

ACHAD_THEME        = initializers.init_theme(ACHAD_RUNTIME_FILE)
ACHAD_WALLPAPER    = initializers.init_theme_wallpaper(ACHAD_RUNTIME_FILE)
ACHAD_ICON_THEME   = initializers.init_theme_icon(ACHAD_RUNTIME_FILE)
ACHAD_OS_LOGO      = initializers.init_theme_os_logo(ACHAD_RUNTIME_FILE)
