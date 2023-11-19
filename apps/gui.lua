-- █▀▀ █░█ █   ▄▀█ █▀█ █▀█ █▀ ▀
-- █▄█ █▄█ █   █▀█ █▀▀ █▀▀ ▄█ ▄

-- Init apps:
local browser    = ACHAD_APPS.gui.browser
local editor     = ACHAD_APPS.gui.editor
local screenshot = ACHAD_APPS.gui.screenshot


-- Register gui apps:
return {
  ["browser"]    = browser,
  ["editor"]     = editor,
  ["screenshot"] = screenshot
}
