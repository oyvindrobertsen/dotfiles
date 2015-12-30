" Vim-plug stuff
let g:plug_threads = 16

call plug#begin('~/.nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'neovimhaskell/haskell-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'eagletmt/neco-ghc'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

" Colors
syntax enable

" General
set number
set backspace=2
let mapleader = ","
filetype plugin indent on

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Ctrlp
let g:ctrlp_show_hidden=1

" Remove autopairs remap for
let g:AutoPairsShortcutFastWrap='<C-å>'

" Terminal
tnoremap <Esc> <C-\><C-n>

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
