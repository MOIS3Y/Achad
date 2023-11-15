-- █▀▄▀█ █ █▀▀ █▀█ █▀█ █▀█ █░█ █▀█ █▄░█ █▀▀   █▀█ █▀ █▀▄ ▀
-- █░▀░█ █ █▄▄ █▀▄ █▄█ █▀▀ █▀█ █▄█ █░▀█ ██▄   █▄█ ▄█ █▄▀ ▄

-- Imports:
local awful      = require "awful"
local beautiful  = require "beautiful"
local gears      = require "gears"
local wibox      = require "wibox"
local xresources = require "beautiful.xresources"

local color      = require "ui.theme.color"
local font       = require "ui.theme.font"
local path       = require "ui.theme.path"

local icon_dir   = path.icons .. "buttons/"

-- Help functions:
local dpi        = xresources.apply_dpi
local gcrci      = gears.color.recolor_image  -- recolor images func

--Init widget properties:
local vol_icon   = gcrci(icon_dir .. "mic.svg", color.scheme.base05)

local microphone_osd_height   = dpi(220)
local microphone_osd_width    = dpi(220)
local microphone_osd_font     = font.microphone_osd

local osd_overlay_bg      = color.scheme.base00
local bar_color           = color.scheme.base01
local handle_color        = color.scheme.base05
local handle_border_color = color.scheme.base00


local icon = wibox.widget({
	{
		image  = vol_icon,
		resize = true,
		widget = wibox.widget.imagebox,
	},
	forced_height = dpi(100),
	top           = dpi(12),
	bottom        = dpi(12),
	widget  = wibox.container.margin,
})


local osd_header = wibox.widget({
	text   = "Volume",
	font   = microphone_osd_font,
	align  = "left",
	valign = "center",
	widget = wibox.widget.textbox,
})


local osd_value = wibox.widget({
	text   = "0%",
	font   = microphone_osd_font,
	align  = "center",
	valign = "center",
	widget = wibox.widget.textbox,
})


local slider_osd = wibox.widget({
	nil,
	{
		id = "micro_osd_slider",
		bar_shape           = gears.shape.rounded_rect,
		bar_height          = dpi(24),
		bar_color           = bar_color,
		handle_color        = handle_color,
        handle_border_color = handle_border_color,
		handle_shape        = gears.shape.circle,
		handle_width        = dpi(24),
        handle_border_width = dpi(1),
		maximum             = 100,
		widget = wibox.widget.slider,
	},
	nil,
	expand = "none",
	layout = wibox.layout.align.vertical,
})


local micro_osd_slider = slider_osd.micro_osd_slider


micro_osd_slider:connect_signal("property::value", function()
	local volume_level = micro_osd_slider:get_value()
    awful.spawn(
    "pactl set-source-volume " .. "@DEFAULT_SOURCE@ " .. volume_level .. "%", false
    )

	-- Update textbox widget text
	osd_value.text = volume_level .. "%"

	-- Update the volume slider if values here change
	awesome.emit_signal("widget::volume:update", volume_level)

	if awful.screen.focused().show_vol_osd then
		awesome.emit_signal("module::microphone_osd:show", true)
	end
end)


micro_osd_slider:connect_signal("button::press", function()
	awful.screen.focused().show_vol_osd = true
end)


micro_osd_slider:connect_signal("mouse::enter", function()
	awful.screen.focused().show_vol_osd = true
end)


-- The emit will come from the volume-slider
awesome.connect_signal("module::microphone_osd", function(volume)
	micro_osd_slider:set_value(volume)
end)


awful.screen.connect_for_each_screen(function(s)
	s = s or {}
	s.show_vol_osd = false

	s.microphone_osd_overlay = awful.popup({
		type                = "notification",
		screen              = s,
		height              = microphone_osd_height,
		width               = microphone_osd_width,
		maximum_height      = microphone_osd_height,
		maximum_width       = microphone_osd_width,
		bg                  = osd_overlay_bg,
		offset              = dpi(5),
		ontop               = true,
		visible             = false,
		preferred_anchors   = "middle",
		preferred_positions = { "left", "right", "top", "bottom" },
		widget = {
			{
				{
					layout = wibox.layout.fixed.vertical,
					{
						{
							layout = wibox.layout.align.horizontal,
							expand = "none",
							nil,
							icon,
							nil,
						},
						{
							layout  = wibox.layout.fixed.vertical,
							spacing = dpi(5),
							{
								layout = wibox.layout.align.horizontal,
								expand = "none",
								osd_header,
								nil,
								osd_value,
							},
							slider_osd,
						},
						spacing = dpi(10),
						layout = wibox.layout.fixed.vertical,
					},
				},
                left   = dpi(24),
				right  = dpi(24),
				widget = wibox.container.margin,
			},
			bg = beautiful.bg_normal,
			shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
		},
	})
	-- Reset timer on mouse hover
	s.microphone_osd_overlay:connect_signal("mouse::enter", function()
		awful.screen.focused().show_vol_osd = true
		awesome.emit_signal("module::microphone_osd:rerun")
	end)
end)


local hide_osd = gears.timer({
	timeout = 2,
	autostart = true,
	callback = function()
		local focused = awful.screen.focused()
		focused.microphone_osd_overlay.visible = false
		focused.show_vol_osd = false
	end,
})


awesome.connect_signal("module::microphone_osd:rerun", function()
	if hide_osd.started then
		hide_osd:again()
	else
		hide_osd:start()
	end
end)


local placement_placer = function()
	local focused = awful.screen.focused()
	local microphone_osd = focused.microphone_osd_overlay
	awful.placement.centered(microphone_osd)
end


awesome.connect_signal("module::microphone_osd:show", function(bool)
	placement_placer()
	awful.screen.focused().microphone_osd_overlay.visible = bool
	if bool then
		awesome.emit_signal("module::microphone_osd:rerun")
		awesome.emit_signal("module::brightness_osd:show", false)
	else
		if hide_osd.started then
			hide_osd:stop()
		end
	end
end)
