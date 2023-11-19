-- █▀█ █▀█ █░█░█ █▀▀ █▀█ ▀
-- █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄ ▄

-- Imports:
local awful = require "awful"


-- Init lock command:
local lock = ACHAD_APPS.power.lock
if lock == "i3lock-run" then
  lock = lock .. " --scheme " .. ACHAD_THEME
end


-- Init power command:
local suspend   = ACHAD_APPS.power.suspend
local hibernate = ACHAD_APPS.power.hibernate
local reboot    = ACHAD_APPS.power.reboot
local shutdown  = ACHAD_APPS.power.shutdown


-- Register command:
return {
  ["logout"]    = function () awesome.quit()                    end,
  ["lock"]      = function () awful.spawn.with_shell(lock)      end,
  ["hibernate"] = function () awful.spawn.with_shell(hibernate) end,
  ["reboot"]    = function () awful.spawn.with_shell(reboot)    end,
  ["suspend"]   = function () awful.spawn.with_shell(suspend)   end,
  ["shutdown"]  = function () awful.spawn.with_shell(shutdown)  end
}
