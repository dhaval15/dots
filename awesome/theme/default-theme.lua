local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.deep_orange

-- Accent
theme.accent = mat_colors.orange

-- Background
theme.background = mat_colors.grey

local awesome_overrides = function(theme)
        theme.dir = os.getenv('HOME') .. '/.config/awesome/theme'
    
        theme.icons = theme.dir .. '/icons/'
        theme.wallpaper = theme.dir .. '/wallpapers/6.png'
        -- theme.wallpaper = '#e0e0e0'
        theme.font = 'Roboto medium 10'
        theme.title_font = 'Roboto medium 14'
    
        theme.fg_normal = '#ffffffde'
    
        theme.fg_focus = '#e4e4e4'
        theme.fg_urgent = '#CC9393'
        theme.bat_fg_critical = '#232323'
    
        theme.bg_normal = theme.primary.hue_900
        theme.bg_focus = '#5a5a5a'
        theme.bg_urgent = '#3F3F3F'
        theme.bg_systray = theme.primary.hue_900


	-- Gap
	theme.useless_gap = dpi(4)

        -- Borders
    
        theme.border_width = dpi(1)
        theme.border_focus = theme.primary.hue_100
        theme.border_normal = theme.primary.hue_900 .. '00'
        theme.border_marked = '#CC9393'
	theme.maximized_hide_border = true
    
    
    
        -- Hotkeys
        theme.hotkeys_bg = theme.primary.hue_900
        -- theme.hotkeys_fg = nil
        theme.hotkeys_border_width = dpi(1)
        -- theme.hotkeys_border_color = nil
        -- theme.hotkeys_shape = nil
        -- theme.hotkeys_modifiers_fg = nil
        -- theme.hotkeys_label_bg = nil
        -- theme.hotkeys_label_fg = nil
        theme.hotkeys_font = 'Hack 10'
        theme.hotkeys_description_font = 'Hack 9'
        theme.hotkeys_group_margin = dpi(8)
    
    
        -- Menu
    
        theme.menu_height = dpi(16)
        theme.menu_width = dpi(160)
    
        -- Tooltips
        theme.tooltip_bg = '#232323'
        -- theme.tooltip_border_color = '#232323'
        theme.tooltip_border_width = 0
        theme.tooltip_shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, dpi(6))
        end
    
        -- Layout
    
        theme.layout_max = theme.icons .. 'layouts/arrow-expand-all.png'
        theme.layout_tile = theme.icons .. 'layouts/view-quilt.png'
        theme.layout_floating = theme.icons .. 'layouts/floating.png'
    
        -- Taglist
    
        theme.taglist_bg_empty = theme.primary.hue_900
        theme.taglist_bg_occupied = 'linear:0,0:0,' .. dpi(32) .. ':0,' ..
                                     theme.primary.hue_900 .. ':0.9,' ..
                                     theme.primary.hue_900 .. ':0.9,' ..
                                     theme.primary.hue_500 .. ':1,' ..
                                     theme.primary.hue_500
        theme.taglist_bg_urgent = 'linear:0,0:0,' .. dpi(48) .. ':0,' ..
                                      theme.accent.hue_500 .. ':0.07,' ..
                                      theme.accent.hue_500 .. ':0.07,' ..
                                      theme.primary.hue_900 .. ':1,' ..
                                      theme.primary.hue_900
        theme.taglist_bg_focus = 'linear:0,0:0,' .. dpi(32) .. ':0,' ..
                                     theme.primary.hue_800 .. ':0.9,' ..
                                     theme.primary.hue_700 .. ':0.9,' ..
                                     theme.primary.hue_600 .. ':1,' ..
                                     theme.primary.hue_500
    
        -- Tasklist
    
        theme.tasklist_font = 'Roboto medium 11'
        theme.tasklist_bg_normal = theme.primary.hue_900
        theme.tasklist_bg_focus = 'linear:0,0:0,' .. dpi(32) .. ':0,' ..
                                      theme.primary.hue_900 .. ':0.9,' ..
                                      theme.primary.hue_900 .. ':0.9,' ..
                                      theme.fg_normal .. ':1,' .. theme.fg_normal
        theme.tasklist_bg_urgent = theme.primary.hue_900
        theme.tasklist_fg_focus = '#DDDDDD'
        theme.tasklist_fg_urgent = theme.fg_normal
        theme.tasklist_fg_normal = '#AAAAAA'
    
        theme.icon_theme = 'Tela circle purple dark'
    
        -- Client
end
return {theme = theme, awesome_overrides = awesome_overrides}
