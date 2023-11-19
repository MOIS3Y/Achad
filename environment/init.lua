-- █▀▀ █▄░█ █░█ █ █▀█ █▀█ █▄░█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ ▀
-- ██▄ █░▀█ ▀▄▀ █ █▀▄ █▄█ █░▀█ █░▀░█ ██▄ █░▀█ ░█░ ▄

-- Imports:
local json         = require "modules.json"
local initializers = require "environment.initializers"


-- Init runtime file path:
local runtime_file = initializers.init_runtime_file()

-- Write default runtime config if runtime file does not exist:
initializers.set_default_runtime_conf(runtime_file)

-- Parse config from runtime config file:
local row_config   = initializers.read_file(runtime_file)  -- JSON str
local runtime_conf = json.decode(row_config)               -- Lua table

-- -- -- -- -- GLOBAL ENVIRONMENT VARIABLES -- -- -- -- --

ACHAD_RUNTIME_FILE = runtime_file

ACHAD_THEME        = initializers.init_theme(runtime_conf)
ACHAD_WALLPAPER    = initializers.init_theme_wallpaper(runtime_conf)
ACHAD_ICON_THEME   = initializers.init_theme_icon(runtime_conf)
ACHAD_OS_LOGO      = initializers.init_theme_os_logo(runtime_conf)
ACHAD_APPS         = initializers.init_default_apps(runtime_conf)
