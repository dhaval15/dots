local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

function show_desktop()
	local flag = false
    	for _, c in ipairs(mouse.screen.selected_tag:clients()) do
        	if c.minimized == true then flag = true end
        	c.minimized = true
    	end
    	for _, c in ipairs(mouse.screen.selected_tag:clients()) do
        	if flag == true then c.minimized = false end
    	end
end

function move_to_next_window()
    	awful.client.focus.byidx(1)
    	if _G.client.focus then _G.client.focus:raise() end
end 

function move_to_prev_window()
	awful.client.focus.byidx(-1)
    	if _G.client.focus then _G.client.focus:raise() end
end

function show_help()
	hotkeys_popup.new({
		width = 700,
		height = 500,
	})
	hotkeys_popup.show_help()
end

return {
	show_desktop = show_desktop,
	show_help = show_help,
	next_window = move_to_next_window,
	prev_window = move_to_prev_window,
}
