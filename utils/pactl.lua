-- █▀█ ▄▀█ █▀▀ ▀█▀ █░░ ▀
-- █▀▀ █▀█ █▄▄ ░█░ █▄▄ ▄

-- Imports:
local spawn = require "awful.spawn"

-- Init pactl table:
local _M = {}


function _M.volume_level_set(sink_or_source, device, direction, step)
  -- Init vars:
  local CMD_GET = "pactl get-" .. sink_or_source .. "-volume "
  local CMD_SET = "pactl set-" .. sink_or_source .. "-volume "
  local MAX_VOL = 100
  local MIN_VOL = 0
  local increase_vol
  local decrease_vol
  local current_vol
  local out_range
  local volsum, volcnt = 0, 0
  -- 1) Get current volume level and clean data to number:
  spawn.easy_async(CMD_GET .. device, function (stdout)
    -- Get current volume:
    for vol in string.gmatch(stdout, "(%d?%d?%d)%%") do
      if vol ~= nil then
        volsum = volsum + tonumber(vol)
        volcnt = volcnt + 1
      end
    end
    if volcnt == 0 then
      return nil
    end
    -- Count current volume:
    current_vol = volsum / volcnt
    -- Correct step:
    if direction == "+" then
      increase_vol = current_vol + step
      if increase_vol >= MAX_VOL then
        out_range = increase_vol - MAX_VOL
        step = step - out_range
      end
    end
    if direction == "-" then
      decrease_vol = current_vol - step
      if decrease_vol <= MIN_VOL then
        step = step - math.abs(decrease_vol)
      end
    end
    -- Not need run cmd if step eq 0:
    if step == 0 then
      return nil
    end
    -- 2) Run CMD increase or decrease volume:
    spawn(CMD_SET .. device .. " " .. direction .. step .. "%", false)
  end)
end


function _M.volume_mute_toggle(sink_or_source, device)
  spawn("pactl set-" .. sink_or_source .. "-mute " .. device .. " toggle", false)
end


return _M
