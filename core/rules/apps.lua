-- ▄▀█ █▀█ █▀█ █▀   █▀█ █░█ █░░ █▀▀ █▀ ▀
-- █▀█ █▀▀ █▀▀ ▄█   █▀▄ █▄█ █▄▄ ██▄ ▄█ ▄

return {
  -- Firefox: set always map on the tag named " 1 " on screen 1
  {
    rule = {class = "firefox"},
    properties = {
      screen = 1,
      tag = " 1 "
    }
  },
  -- Mattermost: set always map on the tag named " 3 " on screen 1
  {
    rule = {class = "Mattermost"},
    properties = {
      screen = 1,
      tag = " 3 "
    }
  },
  -- Telegram: set always map on the tag named " 3 " on screen 1
  {
    rule = {class = "TelegramDesktop"},
    properties = {
      screen = 1,
      tag = " 3 "
    }
  },
  -- VScode: set always map on the tag named " 4 " on screen 1
  {
    rule = {class = "Code"},
    properties = {
      screen = 1,
      tag = " 4 "
    }
  },
  -- Steam: set always map on the tag named " 5 " on screen 1
  {
    rule = {class = "steam"},
    properties = {
      floating = true,
      screen = 1,
      tag = " 5 "
    }
  },
  -- Zoom: set always map on the tag named " 6 " on screen 1
  {
    rule = {class = "zoom"},
    properties = {
      floating = true;
      screen = 1,
      tag = " 6 "
    }
  },
  -- Linphone: set always map on the tag named " 6 " on screen 1
  {
    rule = {class = "linphone"},
    properties = {
      floating = true,
      screen = 1,
      tag = " 6 "
    }
  },
  -- Inkscape: set always map on the tag named " 7 " on screen 1
  {
    rule = {class = "Inkscape"},
    properties = {
      floating = true,
      screen = 1,
      tag = " 7 "
    }
  },
  -- add more rules here ... {},
}
