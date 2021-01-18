function! SpellOff()
	set nospell
endfunction

function! SpellOn()
	set spell! spelllang=en_us
endfunction

command! SpellOn call SpellOn()
command! SpellOff call SpellOff()
