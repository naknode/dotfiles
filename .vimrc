let mapleader = ","
let g:mapleader= ","

set nocompatible
set ignorecase
set smartcase
set timeout timeoutlen=200 ttimeoutlen=100
set mouse=r

filetype off

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-sensible'
Plug 'arecarn/vim-clean-fold'
Plug 'vim-scripts/folddigest.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

set foldtext=clean_fold#fold_text_minimal()

" Test Vim Fold {{{
" Colors {{{
set background=dark
" Set term color to 256
set t_CO=256
colorscheme seoul256
" }}}

" {{ Other
" Enable syntax highlight
syntax on
" Numbers
set nu
" }}}
" }}}

" Fold Digest {{{
let folddigest_options = "nofoldclose,vertical,flexnumwidth"
let folddigest_size = 40
" }}}

set fdm=marker
