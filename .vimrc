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
set mouse=r

" Plugin installation file
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'mhinz/vim-startify'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jremmen/vim-ripgrep'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wakatime/vim-wakatime'
Plugin 'Quramy/tsuquyomi'
Plugin 'mhinz/vim-signify'
Plugin 'vim-airline/vim-airline'
Plugin 'jacoborus/tender.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off the ruler, which shows the cursor position in the file.
set noruler

if !has("gui_running")
  set t_Co=256
  set term=screen-256color
endif

" Netrw setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Show wildmenu (tabbing through files)
set wildmenu
set wildmode=longest:full,full

" Show line numbers and relative number on current line
set relativenumber

" No distracting bells or audio queues.
set noerrorbells visualbell t_vb=

" Allow multiple, unsaved buffers and warn if unsaved when exiting buffer
set hidden

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Always show what mode we're currently editing in
set noshowmode

" Highlight terms in search with underline
highlight Search cterm=underline

" Show (partial) command in the status line
set showcmd

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

" Highlight search
set hlsearch

" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

" Faster drawing on terminals
set ttyfast

" Nice splits
set fillchars+=vert:\|

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Formatting and editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" set termguicolors     " enable true colors support

" Color theme
colorscheme tender

" Enable syntax highlight
syntax on

" Set term color to 256
set t_CO=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

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
" >>> Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" When opening new buffer, default to below and right
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Plugin: fzf & ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map ctrl+p to fzf
nmap <leader>f :GFiles<cr>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nmap <leader>/ :BLines<cr>|    " fuzzy find lines in the current file
nmap <leader>b :Buffers<cr>|   " fuzzy find an open buffer

nmap <leader>r :Rg |           " fuzzy find text in the working directory
nmap <leader>c :Commands<cr>|  " fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)


fu! Flt_term_win(cmd, width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)
    let top = '┌' . repeat('─', width - 2) . '┐'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '└' . repeat('─', width - 2) . '┘'
    let border = [top] + repeat([mid], height - 2) + [bot]
    let frame = s:create_popup_window(a:cmd, a:border_highlight, {
        \ 'line': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'is_frame': 1,
        \ })
    call setbufline(frame, 1, border)
    call s:create_popup_window(a:cmd, 'Normal', {
        \ 'line': row + 1,
        \ 'col': col + 2,
        \ 'width': width - 4,
        \ 'height': height - 2,
        \ })
endfu

fu! s:create_popup_window(cmd,hl, opts) abort
    if has_key(a:opts, 'is_frame')
        let id = popup_create('', #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 50,
            \ })
        call setwinvar(id, '&wincolor', a:hl)
        exe 'au BufWipeout * ++once call popup_close('..id..')'
        return winbufnr(id)
    else
        let buf = term_start(a:cmd, {'hidden': 1, 'exit_cb' : 'OnTermExit'})
        call popup_create(buf, #{
            \ line: a:opts.line,
            \ col: a:opts.col,
            \ minwidth: a:opts.width,
            \ minheight: a:opts.height,
            \ zindex: 51,
            \ })
    endif
endfu

function! OnTermExit(job, message)
    close
    " TODO: add some code to confirm that current window is a popup.
    " TODO: prevent close other window by accident.
endfunction 

" Lazygit
nnoremap <silent> <leader>gg :call Flt_term_win('lazygit',0.9,0.8,'Todo')<CR>


" map ctrl+o to ripgrep
map <c-q> :Find<space>

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
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
