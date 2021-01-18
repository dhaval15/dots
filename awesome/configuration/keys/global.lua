local awful = require('awful')
require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('apps')
local poppin = require('poppin')
local revelation = require('revelation')
local commands = require('configuration.keys.commands')

-- Key bindings
local globalKeys = awful.util.table.join( 

	-- Help
	awful.key({}, 'ISO_Level3_Shift', revelation,
          	{description = 'Expose View', group = 'Awesome'}), -- Tag browsing

	awful.key({modkey}, 'h', commands.show_help,
          	{description = 'show help', group = 'Awesome'}), -- Tag browsing
	awful.key({modkey, 'Shift'}, 'r', _G.awesome.restart,
          	{description = 'reload awesome', group = 'Awesome'}),
	
	-- Tag Management	
	
	awful.key({modkey}, 'Left', awful.tag.viewprev,
          	{description = 'view previous', group = 'Tag'}),
	awful.key({modkey}, 'Right', awful.tag.viewnext,
	          {description = 'view next', group = 'Tag'}),
	awful.key({}, 'Control_R', awful.tag.history.restore,
          	{description = 'go back', group = 'Tag'}), -- Default client focus
	
	-- Client Management
	
	awful.key({modkey}, 'u', awful.client.urgent.jumpto,
          	{description = 'jump to urgent client', group = 'Client'}),
	awful.key({modkey}, '`', commands.show_desktop,
		{description = 'minimize all clients', group = 'Client'}),
	awful.key({altkey}, 'Tab', commands.next_window,
		{description = 'Switch to next window', group = 'Client'}),
	awful.key({altkey, 'Shift'}, 'Tab', commands.prev_window, 
		{description = 'Switch to previous window', group = 'Client'}),
	
	-- Layout Management
	
	awful.key({modkey}, 'j', function() awful.tag.incnmaster(1, nil, true) end, 
		{description = 'increase the number of master clients',group = 'Layout'}), 
	awful.key({modkey}, 'k', function() awful.tag.incnmaster(-1, nil, true) end, 
		{description = 'decrease the number of master clients',group = 'Layout'}), 
	-- awful.key({modkey}, 'space', function() awful.layout.inc(1) end,
	-- 	{description = 'select next', group = 'layout'}),
	-- awful.key({modkey, 'Shift'}, 'space', function() awful.layout.inc(-1) end,
          	-- {description = 'select previous', group = 'Layout'}),
	
	-- Screen Management
	
	-- awful.key({modkey}, 'o', awful.client.movetoscreen,
          	-- {description = 'move window to next screen', group = 'Screen'}))
	
	-- Prompts
	
	awful.key({modkey}, 'r', function() awful.screen.focused().myprompt:run() end,
          	{description = 'Run Prompt', group = 'Prompt'}),
	awful.key({modkey}, 'w', function() awful.screen.focused().browser_prompt:run() end,
          	{description = 'Browse Prompt', group = 'Browse'}),
	awful.key({modkey}, 'space', function() awful.spawn(apps.rofi.apps)  end,
          	{description = 'Rofi Apps', group = 'Prompt'}),
	awful.key({modkey}, 'l', function() _G.exit_screen_show() end,
          	{description = 'Exit Prompt', group = 'Prompt'}),

	-- Apps
	
	awful.key({modkey}, 'b', function() awful.util.spawn(apps.apps.browser) end,
          	{description = 'Browser', group = 'Apps'}),
	awful.key({modkey}, 'Return',function() awful.util.spawn(apps.apps.terminal) end,
          {description = 'Terminal', group = 'Apps'}),

	awful.key({modkey}, 'z', function() 
		poppin.pop("terminal", apps.apps.terminal, "center", { width = 500, height = 300 })
	end,
          	{description = 'Terminal', group = 'Apps'}),
	
	-- System
	
	awful.key({modkey}, 'Print', function() awful.util.spawn(apps.commands.screenshot) end, 
		{description = 'Take a screenshot',group = 'System'}),
	awful.key({}, 'XF86MonBrightnessUp', function() 
		awful.spawn.easy_async('xbacklight -inc 10',function() 
			_G.update_brightness() 
		end) 
	end,
          	{description = '+10%', group = 'System'}),
	awful.key({}, 'XF86MonBrightnessDown', function() 
		awful.spawn.easy_async('xbacklight -dec 10', _G.update_brightness) 
	end,
          	{description = '-10%', group = 'System'}), -- ALSA volume control
	awful.key({}, 'XF86AudioRaiseVolume', function()
    		awful.spawn.easy_async(apps.commands.volume_up, _G.update_volume)
	end,
		{description = 'volume up', group = 'System'}),
	awful.key({}, 'XF86AudioLowerVolume', function()
    		awful.spawn.easy_async(apps.commands.volume_down, _G.update_volume)
	end, 
		{description = 'volume down', group = 'System'}),
	awful.key({}, 'XF86AudioMute', function()
    		awful.spawn.easy_async(apps.commands.volume_toggle, _G.update_volume)
	end, 
		{description = 'toggle mute', group = 'System'}),
	awful.key({}, 'XF86AudioNext', function() end, 
		{description = 'toggle mute', group = 'System'}),
	awful.key({}, 'XF86PowerDown', function() end,
		{description = 'toggle mute', group = 'System'}),
	awful.key({}, 'XF86PowerOff', function() _G.exit_screen_show() end,
          	{description = 'toggle mute', group = 'System'}),


	awful.key({modkey, 'Control'}, 'n', function()
    		local c = awful.client.restore()
    		-- Focus restored client
    		if c then
        		_G.client.focus = c
        		c:raise()
    		end
	end, 
		{description = 'restore minimized', group = 'Client'}))



-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = 'View tag #', group = 'Tag'}
        descr_toggle = {description = 'Toggle tag #', group = 'Tag'}
        descr_move = {
            description = 'Move focused client to tag #',
            group = 'Tag'
        }
        descr_toggle_focus = {
            description = 'Toggle focused client on tag #',
            group = 'Tag'
        }
    end
    globalKeys = awful.util.table.join(globalKeys, -- View tag only.
    awful.key({modkey}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then tag:view_only() end
    end, descr_view), -- Toggle tag display.

    awful.key({modkey, 'Control'}, '#' .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then awful.tag.viewtoggle(tag) end
    end, descr_toggle), -- Move client to tag.

    awful.key({modkey, 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then _G.client.focus:move_to_tag(tag) end
        end
    end, descr_move), -- Toggle tag on focused client.

    awful.key({modkey, 'Control', 'Shift'}, '#' .. i + 9, function()
        if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then _G.client.focus:toggle_tag(tag) end
        end
    end, descr_toggle_focus))
end

return globalKeys

