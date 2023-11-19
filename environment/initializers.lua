-- █ █▄░█ █ ▀█▀ █ ▄▀█ █░░ █ ▀█ █▀▀ █▀█ █▀ ▀
-- █ █░▀█ █ ░█░ █ █▀█ █▄▄ █ █▄ ██▄ █▀▄ ▄█ ▄

-- Imports:
local gears = require "gears"

local json  = require "modules.json"
local path  = require "ui.theme.path"
local conf  = require "environment.runtime"


local _M = {}


-- -- -- -- -- HELPERS -- -- -- -- --

-- Filesystem help functions:
local gfs = gears.filesystem


-- Read runtime conf file return value if exist:
function _M.read_file(runtime_file)
  local file = io.open(runtime_file, "rb")
  if not file then return nil end
  local content = file:read("*a")
  file:close()
  return content
end


-- -- -- -- -- INITIALIZERS -- -- -- -- --

function _M.init_runtime_file()
  -- Init variables:
  local xdg_cache_home = gfs.get_xdg_cache_home()
  local achad_conf_dir = gfs.get_configuration_dir()
  local environ        = os.getenv("ACHAD_RUNTIME_FILE")
  local filename       = "achad_runtime_conf.json"
  local runtime        = achad_conf_dir .. filename  -- default path
  -- Use user cache dir if exists: 
  if xdg_cache_home then
    runtime = xdg_cache_home .. filename
  end
  -- Use file from environ:
  if environ then
    runtime = environ
  end
  return runtime
end


function _M.set_default_runtime_conf(runtime_file)
  -- Do not set default value if runtime file exists:
  if gfs.file_readable(runtime_file) then return runtime_file end
  -- Set default config values if runtime file does not exist:
  local file = io.open(runtime_file, "wb")
  assert(file, "ERROR when trying to open " .. runtime_file .. "in wb mode")
  file:write(
    json.encode(conf)  -- from runtime.lua module
  )
  file:close()
end


function _M.init_theme(runtime_config)
  -- Init reserve default value:
  local default = conf.theme.color_scheme
  local environ = os.getenv("ACHAD_THEME")
  -- Return value from environ:
  if environ then return environ end
  -- Return value from runtime:
  if not runtime_config then return default end
  return runtime_config.theme.color_scheme
end


function _M.init_theme_wallpaper(runtime_config)
  local wallpaper_path = path.images .. "wallpapers/"
  -- Init reserve default vslue:
  local default = conf.theme.wallpaper.file
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_WALLPAPER")
  if environ and type(environ) == "string" then
    if gfs.file_readable(environ) then return environ end
    return runtime
  end
  -- Return value from runtime:
  if not runtime_config then return runtime end
  if runtime_config.theme.wallpaper.auto then
    runtime = wallpaper_path .. runtime_config.theme.color_scheme .. ".png"
  else
    runtime = runtime_config.theme.wallpaper.file
  end
  if gfs.file_readable(runtime) then
    return runtime
  else
    return default
  end
end


function _M.init_theme_os_logo(runtime_config)
  -- Init reserve default vslue:
  local default = conf.theme.os_logo
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_OS_LOGO")
  if environ and type(environ) == "string" then
    if gfs.file_readable(environ) then return environ end
    return runtime
  end
  -- Return value from runtime:
  if not runtime_config then return runtime end
  runtime = runtime_config.theme.os_logo
  if gfs.file_readable(runtime) then
    return runtime
  else
    return default
  end
end


function _M.init_theme_icon(runtime_config)
  -- Init reserve default vslue:
  local default = conf.theme.icon_theme
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_ICON_THEME")
  if environ then return environ end
  -- Return value from runtime:
  if not runtime_config then return runtime end
  runtime = runtime_config.theme.icon_theme
  return runtime
end


function _M.init_default_apps(runtime_config)
  local default = conf.apps
  if not runtime_config then return default end
  return runtime_config.apps
end


return _M
