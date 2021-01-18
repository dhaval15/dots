local beautiful = require('beautiful')
local assault = require('command.assault')

local battery = assault({
   battery = "BAT0", -- battery ID to get data from
   adapter = "AC", -- ID of the AC adapter to get data from
   width = 18, -- width of battery
   height = 8, -- height of battery
   bolt_width = 14, -- width of charging bolt
   bolt_height = 6, -- height of charging bolt
   stroke_width = 1, -- width of battery border
   peg_top = 2, -- distance from the top of the battery to the start of the peg
   peg_height = 6, -- height of the peg
   peg_width = 1, -- width of the peg
   font = 'Hack 0', -- font to use
   critical_level = 0.10, -- battery percentage to mark as critical (between 0 and 1, default is 10%)
   normal_color = beautiful.fg_normal, -- color to draw the battery when it's discharging
   critical_color = "#FF4A4C", -- color to draw the battery when it's at critical level
   charging_color = "#4AFF4C" -- color to draw the battery when it's charging
})

return battery
