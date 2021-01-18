local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')

local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local LayoutBox = function(s)
    local layoutBox = clickable_container(awful.widget.layoutbox(s),beautiful.accent.hue_900)
    layoutBox:buttons(awful.util.table.join(
                          awful.button({}, 1, function()
            awful.layout.inc(1)
        end), awful.button({}, 3, function() awful.layout.inc(-1) end),
                          awful.button({}, 4, function()
            awful.layout.inc(1)
        end), awful.button({}, 5, function() awful.layout.inc(-1) end)))
    return layoutBox
end

return LayoutBox
