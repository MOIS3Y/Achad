-- █▀▀ █░░ █   ▄▀█ █▀█ █▀█ █▀ ▀
-- █▄▄ █▄▄ █   █▀█ █▀▀ █▀▀ ▄█ ▄

-- Init commands:
local terminal = "wezterm"
local editor   = terminal .. " -e " .. (os.getenv("EDITOR") or "hx")
local explorer = terminal .. " -e " .. "lf"

-- Register cli apps:
return {
  ["terminal"] = terminal,
  ["editor"]   = editor,
  ["explorer"] = explorer,
}
