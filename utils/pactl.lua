-- █▀█ ▄▀█ █▀▀ ▀█▀ █░░ ▀
-- █▀▀ █▀█ █▄▄ ░█░ █▄▄ ▄

-- Imports:
local spawn = require "awful.spawn"

-- Init pactl table:
local _M = {}


function _M.parse_current_volume (stdout)
  local volsum, volcnt = 0, 0
  for vol in string.gmatch(stdout, "(%d?%d?%d)%%") do
    if vol ~= nil then
      volsum = volsum + tonumber(vol)
      volcnt = volcnt + 1
    end
  end
  if volcnt == 0 then
    return nil
  end
  return volsum / volcnt
end


function _M.is_mute (stdout)
  if string.find(stdout, "yes") then
    return true
  end
  return false
end


function _M.adjust_step_in_range (direction, current_volume, step)
  -- Init vars:
  local increase_volume
  local decrease_volume
  local out_of_range
  -- Init range:
  local MAX_VOL = 100
  local MIN_VOL = 0
  -- Correct step:
  if direction == "+" then
    increase_volume = current_volume + step
    if increase_volume >= MAX_VOL then
      out_of_range = increase_volume - MAX_VOL
      step = step - out_of_range
    end
  end
  if direction == "-" then
    decrease_volume = current_volume - step
    if decrease_volume <= MIN_VOL then
      step = step - math.abs(decrease_volume)
    end
  end
  return step
end


function _M.emit_signal_set_sink_volume(direction, current_volume, step)
  if direction == "+" then
    awesome.emit_signal("module::volume_osd", (current_volume + step))
    awesome.emit_signal("module::volume_osd:show", true)
  end
  if direction == "-" then
    awesome.emit_signal("module::volume_osd", (current_volume - step))
    awesome.emit_signal("module::volume_osd:show", true)
  end
end


function _M.volume_level_set(sink_or_source, device, direction, step, popup)
  -- Init CMD:
  local CMD_GET = "pactl get-" .. sink_or_source .. "-volume "
  local CMD_SET = "pactl set-" .. sink_or_source .. "-volume "
  -- Get current volume level and clean data to number:
  spawn.easy_async(CMD_GET .. device, function (stdout)
    -- Parse current volume value:
    local current_volume = _M.parse_current_volume(stdout)
    -- Abort if current_volume is empty:
    if not current_volume then
      return nil
    end
    -- Correct step:
    step = _M.adjust_step_in_range(direction, current_volume, step)
    -- Set volume from popup widget if popup true:
    if popup and sink_or_source == "sink" then
      _M.emit_signal_set_sink_volume(direction, current_volume, step)
      return nil
    end
    -- Set volume from this func if popup false:
    if step == 0 then
      return nil
    end
    spawn(CMD_SET .. device .. " " .. direction .. step .. "%", false)
  end)
end


function _M.volume_mute_toggle(sink_or_source, device)
  spawn("pactl set-" .. sink_or_source .. "-mute " .. device .. " toggle", false)
end


return _M
