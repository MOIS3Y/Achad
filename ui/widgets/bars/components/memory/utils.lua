-- █▀▄▀█ █▀▀ █▀▄▀█ █▀█ █▀█ █▄█   █░█ ▀█▀ █ █░░ █▀ ▀
-- █░▀░█ ██▄ █░▀░█ █▄█ █▀▄ ░█░   █▄█ ░█░ █ █▄▄ ▄█ ▄


local _M = {}


_M.round = function (num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end


_M.sizyfy = function (value)
  local ext = "Kb"
  if value < 512000 then
    value = value / 1024.0
  elseif value < 4194304000 then
    value = value / 1048576.0
    ext = "Mb"
  else
    value = value / 1073741824.0
    ext = "Gb"
  end
  local round_value = _M.round(value, 1)
  local result = tostring(round_value) .. ext
  return result
end


return _M
