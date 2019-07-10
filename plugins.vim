filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround' 
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'aonemd/kuroi.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'matze/vim-move'
Plugin 'jremmen/vim-ripgrep'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'
Plugin 'lucasprag/simpleblack'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'ntk148v/vim-horizon'
Bundle 'craigemery/vim-autotag'

call vundle#end()            " required
filetype plugin indent on    " required
