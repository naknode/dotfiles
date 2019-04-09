set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
set relativenumber
set autowriteall
set noerrorbells visualbell t_vb=

" ---- Visuals ----"
set t_CO=256
set macligatures 
set guifont=Fira_Code:h17
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set termguicolors

set noshowmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is four spaces
set ruler
set wildmenu
set wildmode=longest:full,full

"Stop Vim making back up files
set nobackup
set noswapfile

let mapleader = ','

"Show (partial) command in the status line
set showcmd

highlight Search cterm=underline

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**


set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set mouse=a

set background=dark
colorscheme kuroi
hi LineNr guibg=bg
" hi vertsplit guifg=bg guibg=darkgrey
set fillchars+=vert:\ 

"Easy escaping to normal model
imap jj <esc>

set complete=.,w,b,u "Auto complete buffer

"--------- Split Management -----------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>


"--------- Search -----------"
set hlsearch
set incsearch

"--------- Mappings -----------"
"Make it super simple to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>evp :tabedit ~/.vim/plugins.vim<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-r> :CtrlPMRUFiles<cr>
let NERDTreeShowHidden=1

"--------- Plugins -------"
" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" NerdTREE
let NERDTreeHijackNetrw = 0

" CTags
nmap <Leader>f :tag<space>

nnoremap <Leader>fz :FZF<cr>

"-------- Auto-commands -------"

"Automatically source the .vimrc file on save.
augroup autosourcing
				autocmd!
				autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
				call PhpInsertUse()
				call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"----- Make Myself Learn Vim -----"
nnoremap <left> :echoe "Use h"<cr>
nnoremap <right> :echoe "Use l"<cr>
nnoremap <up> :echoe "Use k"<cr>
nnoremap <down> :echoe "Use j"<cr>
