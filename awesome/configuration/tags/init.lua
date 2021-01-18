local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local beautiful = require('beautiful')
local apps = require('configuration.apps')

local tags = {
    {
        icon = icons.terminal,
        type = 'console',
        defaultApp = apps.default.terminal,
        screen = 1
    }, 
    {
        icon = icons.chrome,
        type = 'browser',
        defaultApp = apps.default.browser,
        screen = 1
    }, 
    {
        icon = icons.code,
        type = 'code',
        defaultApp = apps.default.editor,
        screen = 1
    }, 
    {
        icon = icons.folder,
        type = 'files',
        defaultApp = apps.default.files,
        screen = 1
    }, 
    {
        icon = icons.feather,
        type = 'feather',
        defaultApp = apps.default.social,
        screen = 1
    },
    {
        icon = icons.music,
        type = 'media',
        defaultApp = apps.default.social,
        screen = 1
    },
    {
	icon = icons.graphics,
	type = 'graphics',
	defaultApp = apps.default.rofi,
	screen = 1
    }
}

awful.layout.layouts = {
    awful.layout.suit.tile, awful.layout.suit.max, awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(function(s)
    for i, tag in pairs(tags) do
        awful.tag.add(i, {
            icon = tag.icon,
            icon_only = true,
            layout = awful.layout.suit.tile,
            gap_single_client = true,
            gap = beautiful.useless_gap,
            screen = s,
            defaultApp = tag.defaultApp,
            selected = i == 1
        })
    end
end)

_G.tag.connect_signal('property::layout', function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
        t.gap = 4
    else
        t.gap = 4
    end
end)
