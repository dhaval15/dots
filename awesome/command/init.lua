local awful = require('awful')
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')

function widget(command, duration) 
     local textbox = wibox.widget.textbox()
     textbox.align = 'center'
     textbox.valign = 'center'
     textbox.font = 'Icons 10'

     function update_text()
	if (duration > 0)
	then
        	awful.widget.watch(command, duration, function(widget, stdout)
             		textbox.text = stdout
             	end)
	else
        	awful.spawn.easy_async(command, function(stdout)
             		textbox.text = stdout
             	end)
	end
     end
     
     update_text()
     
     local container = wibox.widget {
             textbox,
             widget = wibox.container.background,
     }
    
     return container
end

return widget
