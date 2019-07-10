"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map Leader
let mapleader = ","
let g:mapleader= ","

" Turn on vi-related settings
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Ignore case if search pattern is all lowercase
set smartcase

" Timeout mnodifiers
set timeout timeoutlen=200 ttimeoutlen=100

" Mouse mode in vim
set mouse=a

" Plugin installation file
so ~/.vim/plugins.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off the ruler, which shows the cursor position in the file.
set noruler

" Show wildmenu (tabbing through files)
set wildmenu
set wildmode=longest:full,full

" Show line numbers and relative number on current line
set nu rnu

" No distracting bells or audio queues.
set noerrorbells visualbell t_vb=

" Allow multiple, unsaved buffers and warn if unsaved when exiting buffer
set hidden

" Always show what mode we're currently editing in
set noshowmode

" Highlight terms in search with underline
highlight Search cterm=underline

" Show (partial) command in the status line
set showcmd

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=black ctermbg=NONE

" Highlight search
set hlsearch

" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

" Faster drawing on terminals
set ttyfast


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Formatting and editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the backspace work like in most other programs
set backspace=indent,eol,start

" Highlight current line
set cursorline
hi CursorLine term=none cterm=none ctermbg=3

" Highlight matching brackets
set showmatch

" Special formatting for PHP and Blade files
autocmd Filetype "blade,php,cs" setl shiftwidth=4 softtabstop=4 tabstop=4

" Highlight flicker word under cursor
highlight flicker cterm=bold ctermfg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Background theme
set background=dark

" Color theme
colorscheme tender
let g:airline_theme = 'tender'

" Enable syntax highlight
syntax enable

" Set term color to 256
set t_CO=256

" If on MacVIm, turn Mac's ligeraterues on
if has("gui_macvim")
	set macligatures
endif

" Show/hide certain components in GUI mode
if has("gui_running")
	set guifont=Fira_Code:h17
	set guioptions-=e
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
	set guioptions-=T
	set guioptions-=r
	set t_Co=256
endif

" Enable full color support
set termguicolors

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab equals 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " Expand TABs to spaces

" Linebreak on 500 characters
set lbr
set tw=100

set ai " Auto indent
set si " Smart indent
set nowrap " Do not wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" When opening new buffer, default to below and right
set splitbelow
set splitright

" Move between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Easy escaping to normal model
imap jj <esc>

" Auto complete buffer
set complete=.,w,b,u

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Persistent undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save undos after file closes
set undofile

" Where to save undo histories
set undodir=$HOME/.vim/undo

set undolevels=1000               " How many undos?
set undoreload=10000              " Number of lines to save for undo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" OmniSharp
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlight_types = 2
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/vendor*/,*/.idea/*,*/.vs/*

" NerdTREE
let NERDTreeHijackNetrw = 0

nmap <c-b> :NERDTreeToggle<cr> " Toggle NerdTREE
nmap <c-R> :CtrlPBufTag<cr> " Reload tree
let NERDTreeShowHidden=1 " Show hidden files

" CTags
nmap <Leader>ff :tag<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Plugin: fzf & ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map ctrl+p to fzf
map <C-p> :GFiles<cr>

" map ctrl+o to ripgrep
map <C-o> :Find<space>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!build/*" --glob "!tags" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Magically source the vim file after save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Automatically source the .vimrc file on save.
augroup autosourcing
				autocmd!
				autocmd BufWritePost .vimrc source %
augroup END

autocmd FileType vue syntax sync fromstart


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Misc. Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make it super simple to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>evp :tabedit ~/.vim/plugins.vim<cr>

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" Always show the statusline
set laststatus=2

" Remap ; to : to enter command-line mode. Rest your pinky!
nore ; :
