nnoremap <S-s> :call SnippetOpen()<CR>
nnoremap <S-m> :call ModelOpen()<CR>

function! SnippetOpen()
  read !$HOME/.config/nvim/snippets/dmenu_snippets
endfunction

function! ModelOpen()
  read !$HOME/.config/nvim/snippets/dmenu_mkmodel_dart
endfunction
