local filesystem = require('gears.filesystem')
return {
	apps = {
		terminal = 'alacritty',
		browser = 'qutebrowser',
		files = 'nemo',
		files_term = 'alacritty -e ranger',
		writer = 'focuswriter',
		write_term = 'feather',	
		markdown = 'typora',
	},
	rofi = {
		apps = 'rofi -show drun -theme apps',
		wifi = 'rofi_wifi',
		exit = 'rofi_exit',
	},
	dmenu = {
		apps = 'dmenu_apps',
		run = 'dmenu_run',
		scripts = 'dmenu_scripts',
		wifi = 'rofi_wifi',
		find = 'dmenu_find',
		switch = 'dmenu_switch',
	},
	commands = {
		brightness_up = 'xbacklight -inc 10',
		brightness_down = 'xbacklight -dec 10',
		volume_up = 'pamixer -i 4',
		volume_down = 'pamixer -d 4',
		volume_toggle = 'dwm_volume_toggle',
		screenshot = 'screenshot',
		browser = 'qutebrowser --target tab',
	},
	startup = {
		-- 'nitrogen --restore',
		'xset r rate 250 60',
		'comptond',
		'/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1',
	}
}
