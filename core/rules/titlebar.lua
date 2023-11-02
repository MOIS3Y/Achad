-- ▀█▀ █ ▀█▀ █░░ █▀▀ █▄▄ ▄▀█ █▀█   █▀█ █░█ █░░ █▀▀ █▀ ▀
-- ░█░ █ ░█░ █▄▄ ██▄ █▄█ █▀█ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Add titlebars to normal clients and dialogs:
return {
  rule_any = {
    type = {"normal", "dialog"}
  },
  properties = {
    titlebars_enabled = true
  }
}
