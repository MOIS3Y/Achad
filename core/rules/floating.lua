-- █▀▀ █░░ █▀█ ▄▀█ ▀█▀ █ █▄░█ █▀▀   █▀█ █░█ █░░ █▀▀ █▀ ▀
-- █▀░ █▄▄ █▄█ █▀█ ░█░ █ █░▀█ █▄█   █▀▄ █▄█ █▄▄ ██▄ ▄█ ▄

-- Floating clients:
return {
  rule_any = {
    instance = {
      "DTA",    -- Firefox addon DownThemAll.
      "copyq",  -- Includes session name in class.
      "pinentry",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin",
      "Sxiv",
      "Tor Browser",
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"
    },
    role = {
      "AlarmWindow",    -- Thunderbird's calendar.
      "ConfigManager",  -- Thunderbird's about:config.
      "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
    }
  },
  properties = {
    floating = true
  }
}
