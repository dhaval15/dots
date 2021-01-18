local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local TagList = require('widget.tag-list')
local gears = require('gears')
local LayoutBox = require('layout.mode-panel')

local dpi = require('beautiful').xresources.apply_dpi
local command = require('command')
local volume = require('command.volume')
local brightness = require('command.brightness')
local expose = require('command.expose')
-- local battery = require('command.battery')
local browser = require('apps').commands.browser

local WorkspacePanel = function(s, offset)
    s.myprompt = awful.widget.prompt {
    		prompt = '            Run:   '
    }
    s.browser_prompt = awful.widget.prompt {
    		prompt = '            Browse:   ',
		exe_callback = function (input)
			awful.spawn(browser .. ' ' .. '"' .. input .. '"')
		end
    }
    local offsetx = 0
    if offset == true then
        offsetx = dpi(32)
        offsety = dpi(0)
    end
    local panel = wibox({
        ontop = false,
        screen = s,
        height = dpi(32),
        width = s.geometry.width,	
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = true,
        bg = beautiful.primary.hue_900,
	fg = beautiful.fg_normal,
        struts = {top = dpi(32),}
    })

    panel:struts({left = dpi(0), top = dpi(32)})

    panel:setup{
	layout  = wibox.layout.align.horizontal,
	wibox.widget {
	    layout = wibox.layout.fixed.horizontal,
	    expose(),
	    TagList(s),
	    s.myprompt,
	    s.browser_prompt,
    	},
	wibox.widget {
	    layout = wibox.layout.fixed.horizontal,
    	},
	wibox.widget {
	    layout = wibox.layout.fixed.horizontal,
	    brightness,
	    wibox.widget.textbox(' | '),
	    volume,
	    wibox.widget.textbox(' | '),
	    command('dwm_wifi', 5),
	    wibox.widget.textbox(' | '),
	    command('dwm_memory',2),
	    wibox.widget.textbox(' | '),
	    command('dwm_battery',30),
	    wibox.widget.textbox(' | '),
	    command('dwm_time', 30),
	    wibox.widget.textbox(' | '),
	    LayoutBox(s),
    	}
    }

    return panel
end

return WorkspacePanel
