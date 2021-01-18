let mapleader = ' '
nnoremap <SPACE> <Nop>
nnoremap <leader>n :w<CR>:bn<CR>
nnoremap <leader>p :w<CR>:bp<CR>
nnoremap <leader>d :w<CR>:bd<CR>
nnoremap <leader>e :w<CR>:Files<CR>
nnoremap <S-z>e :e !dmenufind<CR>
nnoremap <leader>b :w<CR>:Buffers<CR>
nnoremap <leader>g :w<CR>:GitFiles<CR>
nnoremap <leader>m :CocAction<CR>
"nnoremap <leader>r <Plug>(coc-rename)
nnoremap <leader>f :Fern . -drawer -toggle<CR>
nnoremap <S-r> :FloatermNew ranger<CR>
nnoremap <leader>c :Commentary <CR>
vmap <leader>c :Commentary <CR>
