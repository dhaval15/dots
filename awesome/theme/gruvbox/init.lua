local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Hack 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.grey
-- theme.primary.hue_200 = '#50fa7b'
-- theme.primary.hue_300 = '#f8E8f2'
-- theme.primary.hue_350 = '#F6C9E0'
-- theme.primary.hue_400 = '#D2AAC0'
-- theme.primary.hue_500 = '#AF9BA0'
-- theme.primary.hue_600 = '#8C7C80'
-- theme.primary.hue_700 = '#695D60'
-- theme.primary.hue_800 = '#463E40'
-- theme.primary.hue_900 = '#231F20'
-- theme.primary = mat_colors.indigo
-- Accent
theme.accent = mat_colors.red

-- Background
theme.background = mat_colors.red

theme.background.hue_800 = '#44475a'
theme.background.hue_900 = '#44475a'

local awesome_overrides = function(theme)
    --
end
return {theme = theme, awesome_overrides = awesome_overrides}
