local function split(input_str, sep)
  sep = sep or '%s'
  local result = {}
  for field in string.gmatch(input_str, "([^"..sep.."]+)") do
    for key, value in string.gmatch(field, "(.+)=(.+)") do
      result[key] = value
    end
  end
  return result
end


local test_str = [[
POWER_SUPPLY_NAME=hidpp_battery_0
POWER_SUPPLY_TYPE=Battery
POWER_SUPPLY_ONLINE=1
POWER_SUPPLY_STATUS=Discharging
POWER_SUPPLY_SCOPE=Device
POWER_SUPPLY_MODEL_NAME=K370s/K375s Multi-Device Wireless Keyboard
POWER_SUPPLY_MANUFACTURER=Logitech
POWER_SUPPLY_SERIAL_NUMBER=79-dd-b9-4f
POWER_SUPPLY_CAPACITY_LEVEL=Normal
]]


local result = split(test_str, "\n")

for key, value in pairs(result) do
  print(key, value)
end