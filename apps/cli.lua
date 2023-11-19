-- █▀▀ █░░ █   ▄▀█ █▀█ █▀█ █▀ ▀
-- █▄▄ █▄▄ █   █▀█ █▀▀ █▀▀ ▄█ ▄

-- Init apps:
local terminal = ACHAD_APPS.cli.terminal
local editor   = terminal .. " -e " .. (os.getenv("EDITOR") or ACHAD_APPS.cli.editor)
local explorer = terminal .. " -e " .. ACHAD_APPS.cli.explorer


-- Register cli apps:
return {
  ["terminal"] = terminal,
  ["editor"]   = editor,
  ["explorer"] = explorer,
}
