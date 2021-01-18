function! ExtractWidget()
  let widget = system('printf "" | dmenu -p "Widget Name"')
  execute 'normal vf(oBO%"1c' . widget . '()'
  system('/home/dhaval/.config/nvim/flutter/snippet_sub /home/dhaval/.config/nvim/flutter/StatelessWidget ' . widget . ' ' . '"' . @1 . '" > /home/dhaval/.config/nvim/flutter/.cache')
  execute 'normal G'
  read $HOME/.config/nvim/flutter/.cache
endfunction
