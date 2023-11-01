-- █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀   █▀ █ █▀▀ █▄░█ ▄▀█ █░░ █▀ ▀
-- █▄▄ █▄▄ █ ██▄ █░▀█ ░█░   ▄█ █ █▄█ █░▀█ █▀█ █▄▄ ▄█ ▄
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"
local wibox = require "wibox"

local dpi = beautiful.xresources.apply_dpi


-- Signal function to execute when a new client appears.
client.connect_signal(
  "manage",
  function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
  end
)


-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
  "request::titlebars",
  function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
      awful.button(
        {}, 1,
        function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.move(c)
        end
      ),
      awful.button(
        {}, 3,
        function()
          c:emit_signal("request::activate", "titlebar", {raise = true})
          awful.mouse.client.resize(c)
        end
      )
    )
    awful.titlebar(
      c,
      {
        position = "top",
        size = dpi(32),
        font = beautiful.font_title,
        bg = beautiful.transparent
      }
    ):setup {
      {-- Left
        {
          awful.titlebar.widget.closebutton(c),
          awful.titlebar.widget.minimizebutton(c),
          awful.titlebar.widget.maximizedbutton(c),
          spacing = dpi(7),
          layout = wibox.layout.fixed.horizontal()
        },
        margins = dpi(8),
        widget = wibox.container.margin
      },
      { -- Middle
        { -- Title
          align  = "center",
          widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
      },
      layout = wibox.layout.align.horizontal
    }
  end
)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  "mouse::enter",
  function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
  end
)


client.connect_signal(
  "focus",
  function(c)
    c.border_color = beautiful.border_focus
  end
)


client.connect_signal(
  "unfocus",
  function(c)
    c.border_color = beautiful.border_normal
  end
)

-- Show titlebar only when window is floating
-- https://www.reddit.com/r/awesomewm/comments/bki1md/show_titlebar_only_when_window_is_floating/
client.connect_signal("property::floating", function(c)
  local b = false;
  if c.first_tag ~= nil then
      b = c.first_tag.layout.name == "floating"
  end
  if c.floating or b then
      awful.titlebar.show(c)
  else
      awful.titlebar.hide(c)
  end
end)


client.connect_signal("manage", function(c)
  if c.floating or c.first_tag.layout.name == "floating" then
    awful.titlebar.show(c)
  else
    awful.titlebar.hide(c)
  end
end)


tag.connect_signal("property::layout", function(t)
  local clients = t:clients()
  for _, c in pairs(clients) do
      if c.floating or c.first_tag.layout.name == "floating" then
        awful.titlebar.show(c)
      else
        awful.titlebar.hide(c)
      end
  end
end)
