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


function _M.set_default_runtime_conf()
  -- Get runtime file:
  local runtime_file = _M.init_runtime_file()
  -- Do not set default value if runtime file exists:
  if gfs.file_readable(runtime_file) then return runtime_file end
  -- Set default config values if runtime file does not exist:
  local file = io.open(runtime_file, "wb")
  assert(file, "ERROR when trying to open " .. runtime_file .. "in wb mode")
  file:write(
    json.encode(conf)  -- from runtime.lua module
  )
  file:close()
  return runtime_file
end


function _M.init_theme(runtime_file)
  -- Init reserve default value:
  local default = "catppuccin_mocha"
  local environ = os.getenv("ACHAD_THEME")
  -- Return value from environ:
  if environ then
    return environ
  end
  -- Return value from runtime:
  local config = _M.read_file(runtime_file)
  if not config then
    return default
  end
  config = json.decode(config)
  local runtime = config.theme.color_scheme
  return runtime
end


function _M.init_theme_wallpaper(runtime_file)
  local wallpaper_path = path.images .. "wallpapers/"
  -- Init reserve default vslue:
  local default = wallpaper_path .. "catppuccin_mocha.png"
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_WALLPAPER")
  if environ and type(environ) == "string" then
    if gfs.file_readable(environ) then
      return environ
    end
    return runtime
  end
  -- Return value from runtime:
  local config = _M.read_file(runtime_file)
  if not config then
    return runtime
  end
  config = json.decode(config)
  if config.theme.wallpaper.auto then
    runtime = wallpaper_path .. config.theme.color_scheme .. ".png"
  else
    runtime = config.theme.wallpaper.file
  end
  if gfs.file_readable(runtime) then
    return runtime
  else
    return default
  end
end


function _M.init_theme_os_logo(runtime_file)
  local icon_path = path.icons
  -- Init reserve default vslue:
  local default = icon_path .. "logo/" .. "awesomewm.svg"
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_OS_LOGO")
  if environ and type(environ) == "string" then
    if gfs.file_readable(environ) then
      return environ
    end
    return runtime
  end
  -- Return value from runtime:
  local config = _M.read_file(runtime_file)
  if not config then
    return runtime
  end
  config = json.decode(config)
  runtime = config.theme.os_logo
  if gfs.file_readable(runtime) then
    return runtime
  else
    return default
  end
end


function _M.init_theme_icon(runtime_file)
  -- Init reserve default vslue:
  local default = "Papirus"
  local runtime = default
  -- Return value from environ:
  local environ = os.getenv("ACHAD_ICON_THEME")
  if environ then
    return environ
  end
  -- Return value from runtime:
  local config = _M.read_file(runtime_file)
  if not config then
    return runtime
  end
  config = json.decode(config)
  runtime = config.theme.icon_theme
  return runtime
end


return _M
