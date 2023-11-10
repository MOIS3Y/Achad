-- █▀▀ █▄░█ █░█ █ █▀█ █▀█ █▄░█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ ▀
-- ██▄ █░▀█ ▀▄▀ █ █▀▄ █▄█ █░▀█ █░▀░█ ██▄ █░▀█ ░█░ ▄

-- Read runtime conf file return value if exist:
local function read_file(path)
  local file = io.open(path, "rb")
  if not file then return nil end
  local content = file:read()
  file:close()
  return content
end


-- Check if theme set from runtime:
local current_theme = read_file("/tmp/achad_runtime_theme.conf")


-- Set global environment variables:
ACHAD_THEME = current_theme or os.getenv("ACHAD_THEME") or "catppuccin_mocha"
ACHAD_DEVICE = os.getenv("ACHAD_DEVICE") or "computer"
