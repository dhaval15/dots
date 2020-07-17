call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'natebosch/vim-lsc'

Plug 'natebosch/vim-lsc-dart'

Plug 'dart-lang/dart-vim-plugin'

Plug 'vim-pandoc/vim-pandoc'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'vim-airline/vim-airline'

Plug 'mhinz/vim-startify'

Plug 'chrisbra/colorizer'

Plug 'sainnhe/gruvbox-material'

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'junegunn/fzf.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()


