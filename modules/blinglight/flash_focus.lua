-- █▀▀ █░░ ▄▀█ █▀ █░█   █▀▀ █▀█ █▀▀ █░█ █▀ ▀
-- █▀░ █▄▄ █▀█ ▄█ █▀█   █▀░ █▄█ █▄▄ █▄█ ▄█ ▄

--Imports:
local gears = require("gears")
local beautiful = require("beautiful")

-- Theme properties:
local op  = beautiful.flash_focus_start_opacity or 0.6
local stp = beautiful.flash_focus_step or 0.01


local _M = {}

function _M.flashfocus (c)
    if c and #c.screen.clients > 1 then
        c.opacity = op
        local q = op
        local g = gears.timer({
            timeout = stp,
            call_now = false,
            autostart = true,
        })
        g:connect_signal("timeout", function()
            if not c.valid then
                return
            end
            if q >= 1 then
                c.opacity = 1
                g:stop()
            else
                c.opacity = q
                q = q + stp
            end
        end)
    end
end


function _M.enable ()
    client.connect_signal("focus", _M.flashfocus)
end


function _M.disable ()
    client.disconnect_signal("focus", _M.flashfocus)
end


return _M
