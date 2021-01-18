local awful = require('awful')
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')

local textbox = wibox.widget.textbox()
textbox.align = 'center'
textbox.valign = 'center'
textbox.font = 'Icons 10'

function update_brightness()
   	awful.spawn.easy_async('dwm_brightness', function(stdout)
        		textbox.text = stdout
        	end)
end

update_brightness()

local brightness_container = wibox.widget {
        textbox,
        widget = wibox.container.background,
}
    

return brightness_container
