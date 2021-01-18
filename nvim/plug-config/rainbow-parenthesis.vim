
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType dart RainbowParentheses
augroup END
