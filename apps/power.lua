-- █▀█ █▀█ █░█░█ █▀▀ █▀█ ▀
-- █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄ ▄

-- Imports:
local awful = require "awful"


-- Init power command:
local lock      = "i3lock-run"
local suspend   = "systemctl suspend"
local hibernate = "systemctl hibernate"
local reboot    = "reboot"
local shutdown  = "shutdown now"

-- Register command:
return {
  ["logout"]    = function () awesome.quit()                    end,
  ["lock"]      = function () awful.spawn.with_shell(lock)      end,
  ["hibernate"] = function () awful.spawn.with_shell(hibernate) end,
  ["reboot"]    = function () awful.spawn.with_shell(reboot)    end,
  ["suspend"]   = function () awful.spawn.with_shell(suspend)   end,
  ["shutdown"]  = function () awful.spawn.with_shell(shutdown)  end
}
