-- █▀▀ █░░ █ ▀
-- █▄▄ █▄▄ █ ▄
-- -- -- -- --

local terminal = "wezterm"
local editor = terminal .. " -e " .. (os.getenv("EDITOR") or "hx")


return {
  ["terminal"] = terminal,
  ["editor"] = editor
}
