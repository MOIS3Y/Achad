--█▄▄ ▄▀█ ▀█▀ ▀█▀ █▀▀ █▀█ █▄█ ▀
--█▄█ █▀█ ░█░ ░█░ ██▄ █▀▄ ░█░ ▄


-- Imports:
local awful     = require "awful"
local beautiful = require "beautiful"
local gears     = require "gears"
local wibox     = require "wibox"


-- Init widget properties: 
local bg_color    = beautiful.battery.bg_color
local fg_color    = beautiful.battery.fg_color
local icon_font   = beautiful.battery.icon_font
local text_font   = beautiful.battery.text_font


-- Real
local power_supply = "/sys/class/power_supply/"
local battery = power_supply .. ACHAD_HARDWARE.battery.name .. "/uevent"

-- Fake
-- local power_supply = "/tmp/"
-- local battery = power_supply .. "uevent"

-- -- -- -- -- HELPERS -- -- -- -- --

local function split_power_supply_conf(input_str, sep)
  sep = sep or '%s'
  local result = {}
  for field in string.gmatch(input_str, "([^"..sep.."]+)") do
    for key, value in string.gmatch(field, "(.+)=(.+)") do
      result[key] = value
    end
  end
  return result
end


-- -- -- -- -- WIDGET -- -- -- -- --


-- Init widget btn:
local battery_level = wibox.widget {
  {
    {
      {
        id = "battery_icon",
        font = icon_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, left = 8, right = 3,
      widget = wibox.container.margin
    },
    {
      {
        id = "battery_value",
        font = text_font,
        widget = wibox.widget.textbox
      },
      top = 4, bottom = 4, right = 8,
      widget = wibox.container.margin
    },
    id = "battery_layout",
    layout = wibox.layout.fixed.horizontal
  },
  id = "battery_container",
  bg = bg_color,
  fg = fg_color,
  shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
  end,
  widget = wibox.container.background
}

-- cat /sys/class/power_supply/BAT1/uevent

-- POWER_SUPPLY_NAME=BAT1
-- POWER_SUPPLY_TYPE=Battery
-- POWER_SUPPLY_STATUS=Discharging
-- POWER_SUPPLY_PRESENT=1
-- POWER_SUPPLY_TECHNOLOGY=Li-ion
-- POWER_SUPPLY_CYCLE_COUNT=328
-- POWER_SUPPLY_VOLTAGE_MIN_DESIGN=7600000
-- POWER_SUPPLY_VOLTAGE_NOW=7950000
-- POWER_SUPPLY_CURRENT_NOW=97000
-- POWER_SUPPLY_CHARGE_FULL_DESIGN=7410000
-- POWER_SUPPLY_CHARGE_FULL=6519000
-- POWER_SUPPLY_CHARGE_NOW=6467000
-- POWER_SUPPLY_CAPACITY=99
-- POWER_SUPPLY_CAPACITY_LEVEL=Normal
-- POWER_SUPPLY_MODEL_NAME=HB4593R1ECW
-- POWER_SUPPLY_MANUFACTURER=DYNAPACK
-- POWER_SUPPLY_SERIAL_NUMBER=1564


-- Init widget watch:
local battery_btn = awful.widget.watch(
  "cat " .. battery,
  1,
  function(widget, stdout)
    -- Init battery icons:
    local bat_charging       = " "  -- nf-fa-plug
    local bat_full           = " "  -- nf-fa-battery_full
    local bat_three_quarters = " "  -- nf-fa-battery_three_quarters
    local bat_half           = " "  -- nf-fa-battery_half
    local bat_quarter        = " "  -- nf-fa-battery_quarter
    local bat_empty          = " "  -- nf-fa-battery_empty

    -- Get battery properties:
    local battery_props = split_power_supply_conf(stdout, "\n")
    -- Init current battery properties:
    local POWER_SUPPLY_CAPACITY = battery_props["POWER_SUPPLY_CAPACITY"]
    local POWER_SUPPLY_STATUS   = battery_props["POWER_SUPPLY_STATUS"]
    -- Widget elements shortcuts:
    local battery_value = widget:get_children_by_id("battery_value")[1]
    local battery_icon  = widget:get_children_by_id("battery_icon")[1]

    if POWER_SUPPLY_CAPACITY then
      battery_value:set_text(POWER_SUPPLY_CAPACITY .. "%")
      local capacity = tonumber(POWER_SUPPLY_CAPACITY)
      if POWER_SUPPLY_STATUS == "Discharging" then
        if capacity >= 90 then
          battery_icon:set_text(bat_full)
        elseif capacity >= 70 then
          battery_icon:set_text(bat_three_quarters)
        elseif capacity >= 50 then
          battery_icon:set_text(bat_half)
        elseif capacity >= 15 then
          battery_icon:set_text(bat_quarter)
        else
          battery_icon:set_text(bat_empty)
        end
      else
        battery_icon:set_text(bat_charging)
      end
    else
      battery_value:set_text("ACAD")
      battery_icon:set_text(bat_charging)
    end
  end,
  battery_level  -- watch func will be modify this widget
)


return battery_btn
