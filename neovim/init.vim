" Vim-plug stuff
let g:plug_threads = 16

call plug#begin('~/.nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'neovimhaskell/haskell-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'eagletmt/neco-ghc'
Plug 'kien/rainbow_parentheses.vim'
Plug 'fsharp/vim-fsharp'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()

" Fzf
set rtp+=~/.fzf
map <silent> <C-p> :FZF<CR>

" Colors
syntax enable

" General
set number
set backspace=2
let mapleader = ","
filetype plugin indent on

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:haskellmode_completion_ghc = 0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2

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
