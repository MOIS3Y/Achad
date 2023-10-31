-- ▀█▀ █ ▀█▀ █░░ █▀▀ █▄▄ ▄▀█ █▀█ ▀
-- ░█░ █ ░█░ █▄▄ ██▄ █▄█ █▀█ █▀▄ ▄
-- -- -- -- -- -- -- -- -- -- -- -

local font = require "ui.theme.font"
local path = require "ui.theme.path"

local icons_path = path.icons .. "titlebar/"


return {
  -- Titlebar client name font:
  font_title = font.titlebar,
  -- Close Button icons:
  titlebar_close_button_normal = icons_path  .. "normal.svg",
  titlebar_close_button_focus = icons_path  .. "close_focus.svg",
  titlebar_close_button_normal_hover = icons_path  .. "close_focus_hover.svg",
  titlebar_close_button_focus_hover = icons_path  .. "close_focus_hover.svg",
  -- Minimize Button icons:
  titlebar_minimize_button_normal = icons_path  .. "normal.svg",
  titlebar_minimize_button_focus = icons_path  .. "minimize_focus.svg",
  titlebar_minimize_button_normal_hover = icons_path  .. "minimize_focus_hover.svg",
  titlebar_minimize_button_focus_hover = icons_path  .. "minimize_focus_hover.svg",
  -- Maximized Button (While Window is Maximized) icons:
  titlebar_maximized_button_normal_active = icons_path  .. "normal.svg",
  titlebar_maximized_button_focus_active = icons_path  .. "maximized_focus.svg",
  titlebar_maximized_button_normal_active_hover = icons_path  .. "maximized_focus_hover.svg",
  titlebar_maximized_button_focus_active_hover = icons_path  .. "maximized_focus_hover.svg",
  -- Maximized Button (While Window is not Maximized) icons:
  titlebar_maximized_button_normal_inactive = icons_path  .. "normal.svg",
  titlebar_maximized_button_focus_inactive = icons_path  .. "maximized_focus.svg",
  titlebar_maximized_button_normal_inactive_hover = icons_path  .. "maximized_focus_hover.svg",
  titlebar_maximized_button_focus_inactive_hover = icons_path  .. "maximized_focus_hover.svg"
}
