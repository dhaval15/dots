
" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermbg=007 ctermfg=097'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermbg=007 ctermfg=035'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermbg=007 ctermfg=203'
  else
    exe 'hi! StatusLine ctermbg=007 ctermfg=202'
  endif

  return ''
endfunction

au InsertLeave,InsertEnter,BufWritePost   * call ChangeStatuslineColor()

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head().' '
  else
    return ''
endfunction

set laststatus=2
set noshowmode
set statusline=
set statusline+=%{ChangeStatuslineColor()}              " Auto Changing Colors
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%w\                         " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%3*│                                     " Separator
set statusline+=%3*│                                     " Separator
set statusline+=%=                                       " Right Side
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ lines:\ %02l/%L\                    " Line number / total lines, percentage of document
set statusline+=%5*\ %{GitInfo()}                        " Fugitive Git

hi User1 ctermfg=007 ctermbg=239 
hi User2 ctermfg=007 ctermbg=236 
hi User3 ctermfg=236 ctermbg=236 
hi User4 ctermfg=239 ctermbg=239 
hi User5 ctermfg=007 ctermbg=025 
