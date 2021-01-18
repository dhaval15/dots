let mapleader = ' '
call plug#begin('/home/dhaval/.config/feather/plugged')

"----------- Writing ----------------

Plug 'reedes/vim-textobj-quote'

Plug 'junegunn/limelight.vim'                      " LimeLight

Plug 'junegunn/goyo.vim'                           " Goyo

Plug 'kana/vim-textobj-user'

Plug 'reedes/vim-lexical'                          " Better spellcheck mappings

Plug 'reedes/vim-litecorrect'                      " Better autocorrections

Plug 'reedes/vim-textobj-sentence'                 " Treat sentences as text objects

Plug 'reedes/vim-wordy'                            " Weasel words and passive voice

Plug 'rhysd/vim-grammarous'

"--------- User Interface -----------

Plug 'mhinz/vim-startify'                          " StartScreen

Plug 'sainnhe/gruvbox-material'

Plug 'mhartington/oceanic-next'

Plug 'haya14busa/vim-keeppad'

"------------------------------------

Plug 'vimwiki/vimwiki'

call plug#end()

set background=dark

let netrw_banner=0

let g:limelight_default_coefficient = 0.5

set laststatus=0

set textwidth=80

set nocompatible
filetype plugin on       " may already be in your .vimrc

set termguicolors

colorscheme gruvbox-material

let g:languagetool_lang= 'en-US'

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spell = 1
let g:lexical#thesaurus = ['~/.config/feather/spell/words.txt',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#spell_key = '<leader>s'
let g:lexical#dictionary_key = '<leader>k'

source $HOME/.config/feather/plug-config/startify.vim
source $HOME/.config/feather/text.vim

"autocmd VimEnter * Goyo
autocmd VimEnter * highlight clear SignColumn

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

let s:limelight = 0

function! ToggleLimeLight()
    if s:limelight  == 0
        let s:limelight = 1
	Limelight
    else
        let s:limelight = 0
	Limelight!
    endif
endfunction

let s:spell = 0

function! ToggleSpell()
    if s:spell  == 0
        let s:spell = 1
	SpellOn
    else
        let s:spell = 0
	SpellOff
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
nnoremap <S-s> :call ToggleSpell()<CR>
nnoremap <S-l> :call ToggleLimeLight()<CR>
