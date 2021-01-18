local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'Toggle fullscreen', group = 'Client'}
  ),
  awful.key(
    {modkey},
    'd',
    function(c)
      if c.floating then
        c.floating = false
	c.ontop = false
      else
	c.floating = true
	c.ontop = true
      end
      c:raise()
    end,
    {description = 'Toggle floating', group = 'Client'}
  ),
  awful.key(
    {modkey},
    'a',
    function(c)
      c.above = not c.above
      c:raise()
    end,
    {description = 'Toggle above', group = 'Client'}
  ),
  awful.key(
    {modkey},
    's',
    function(c)
      c.sticky = not c.sticky
      c:raise()
    end,
    {description = 'Toggle sticky', group = 'Client'}
  ),
  awful.key(
    {modkey},
    'm',
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {description = 'Toggle maximized', group = 'Client'}
  ),
  awful.key(
    {modkey},
    'n',
    function(c)
      c.minimized = true
      c:raise()
    end,
    {description = 'Minimize', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Right',
    function(c)
      if c.floating then
	      c.width = c.width + 8
      else
      	awful.tag.incmwfact(0.05)
      end
    end,
    {description = 'Increase Width', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Left',
    function(c)
      if c.floating then
	      c.width = c.width - 8
      else
      	awful.tag.incmwfact(-0.05)
      end
    end,
    {description = 'Decrease Width', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Down',
    function(c)
      if c.floating then
	      c.height = c.height + 8
      else
      	awful.tag.incwfact(-0.05)
      end
    end,
    {description = 'Increase Height', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Up',
    function(c)
      if c.floating then
	      c.height = c.height - 8
      else
      	awful.tag.incwfact(0.05)
      end
    end,
    {description = 'Decrease Height', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Right',
    function(c)
      if c.floating then
	      c.x = c.x + 8
      end
    end,
    {description = 'Move Right', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Left',
    function(c)
      if c.floating then
	      c.x = c.x - 8
      end
    end,
    {description = 'Move Left', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Down',
    function(c)
      if c.floating then
	      c.y = c.y + 8
      end
    end,
    {description = 'Move Down', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Up',
    function(c)
      if c.floating then
	      c.y = c.y - 8
      end
    end,
    {description = 'Move Up', group = 'Client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'Close', group = 'Client'}
  )
)

return clientKeys
