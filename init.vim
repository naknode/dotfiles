"###############################################################################
"# Neovim config (Dan Jasnowski) ###############################################
"###############################################################################

" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Custom Vim Plug {{{
" Options for each plugin, helps improve readability of plugin registration
let g:vim_plug_opts = {
  \ 'mbbill/undotree':              {'on': 'UndotreeToggle' },
  \ 'neoclide/coc.nvim':            {'do': { -> coc#util#install()} },
  \ 'dracula/vim':                  {'as': 'dracula'},
\ }

" Register plugin with options
function! Plug(plugin) abort
  let plugin = substitute(a:plugin, "'", '', 'g')
  call plug#(plugin, get(g:vim_plug_opts, plugin, {}))
endfunction
" }}}

" Plugins {{{
" Begin vim plug
call plug#begin(expand('~/.config/nvim/plugged'))

" Defaults {{{
Plug 'christoomey/vim-tmux-navigator'                        | " Pane navigation
Plug 'tpope/vim-sensible'                                    | " Sensible defaults
Plug 'wincent/terminus'                                      | " Terminal integration improvements

Plug 'joshdick/onedark.vim'                                  | " My current vim theme
Plug 'NLKNguyen/papercolor-theme'
" }}}

" Search {{{
Plug 'junegunn/fzf'                                          | " Main FZF plugin
Plug 'junegunn/fzf.vim'                                      | " Fuzzy finding plugin
" }}}

" Navigation {{{
Plug 'lambdalisue/fern.vim'                                  | " netrw replacement
Plug 'lambdalisue/fern-renderer-devicons.vim'                | " Dev icons for fern
Plug 'ap/vim-buftabline'                                     | " Displays buffers
" }}}


" Visual {{{
Plug 'arecarn/vim-clean-fold'                                | " Provides function for folds
Plug 'blueyed/vim-diminactive'                               | " Helps identifying active window
Plug 'dracula/vim'                                           | " Dracula theme
Plug 'mhinz/vim-startify'                                    | " Startup screen
Plug 'ryanoasis/vim-devicons'                                | " Dev icons
Plug 'vim-scripts/folddigest.vim'                            | " Visualize folds
Plug 'wincent/loupe'                                         | " Search context improvements
Plug 'vim-airline/vim-airline'                               | " Airline
Plug 'vim-airline/vim-airline-themes'                        | " Airline themes
Plug 'nathanaelkane/vim-indent-guides'                       | " Provides indentation guides
" }}}

" Editor {{{
Plug 'junegunn/vim-easy-align'                               | " Helps alignment
Plug 'romainl/vim-cool'                                      | " Awesome search highlighting
Plug 'tomtom/tcomment_vim'                                   | " Better commenting
Plug 'tpope/vim-repeat'                                      | " Improves repeat handling
Plug 'tpope/vim-surround'                                    | " Surround motions
" }}}


" Tools {{{
Plug 'tpope/vim-obsession'                                   | " Continuously updated session files
Plug 'dhruvasagar/vim-prosession'                            | " Allows switching between multiple sessions cleanly
Plug 'airblade/vim-gitgutter'                                | " Show git file diff
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } | " Search for list of things
Plug 'wakatime/vim-wakatime'                                 | " Wakatime extension to track coding
Plug 'duggiefresh/vim-easydir'                               | " Create files in dirs that don't exist
Plug 'tpope/vim-dadbod'                                      | " DB support
Plug 'kristijanhusak/vim-dadbod-ui'                          | " DB UI support
Plug 'tpope/vim-fugitive'                                    | " Git tools
Plug 'wellle/tmux-complete.vim'                              | " Completion for content in tmux
" }}}

" Conquer of Completion {{{
Plug 'neoclide/coc.nvim'                                     | " Completion provider (a la VS Code)
" }}}

" Syntax {{{
Plug 'HerringtonDarkholme/yats.vim'                        | " TypeScript syntax highlighter
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} | " TypeScript tooling
Plug 'pangloss/vim-javascript'                             | " Syntax highlighting in JavaScript
Plug 'sheerun/vim-polyglot'                                | " Lang pack
Plug 'leafOfTree/vim-vue-plugin'                           | " Vue.js
" Plug 'Shougo/deoplete.nvim'                                | " For async completion
Plug 'Shougo/denite.nvim'                                  | " For Denite features
" }}}


" End the plugin registration
call plug#end()
" }}}

" Settings {{{

" General {{{
let mapleader = ","                                | " Map leader
let g:mapleader = ","                              | " Global map leader
let g:python3_host_prog = '/usr/local/bin/python3' | " Python 3 host
set encoding=utf8 "                                | " Default file encoding
set hidden                                         | " Make buffers hidden then abandoned
set noautochdir                                    | " Don't change dirs automatically
set signcolumn=yes                                 | " Show signcolumns
set noerrorbells                                   | " No sound
set splitbelow splitright                          | " Split defaults
set undofile                                       | " Save undos after file closes
set undodir=$HOME/.vim/undo                        | " Where to save undo histories
set undolevels=1000                                | " How many undos?
set undoreload=10000                               | " Number of lines to save for undo
" let g:deoplete#enable_at_startup = 1               | " Enable deoplete at startup
set wildignore+=*/tmp/*,*.so,*.swp,*.sw?,.git,.DS_Store,*.zip,*/node_modules/*,*/vendor*/,*/vendor/*,*/.idea/*,*/.vs/*
" }}}

" Search {{{
set ignorecase         | " Ignores case in search
set smartcase          | " Overrides ignore when capital exists
if has('nvim')
  set inccommand=split | " Displays incremental replacement
endif
" }}}

" Editor {{{
set mouse=a        | " Mouse mode in vim
set expandtab      | " Expand tab to spaces
set shiftwidth=2   | " Number of spaces for indentation
set tabstop=2      | " Number of spaces a <Tab> is
set timeoutlen=500 | " Wait less time for mapped sequences

" Special formatting for PHP and Blade files
autocmd Filetype "blade,php,cs" setl shiftwidth=4 softtabstop=4 tabstop=4
" }}}

" Visual {{{
colorscheme onedark                                   | " Vim theme
let g:airline_theme='onedark'                         | " Airline theme
set background=dark
let &colorcolumn="81,121"                             | " Add indicator for 80 and 120
" set t_CO=256 " Set term color to 256
let base16colorspace=256                              | " Access colors present in 256 colorspace
set ttyfast                                           | " Faster drawing on terminals
set foldtext=clean_fold#fold_text_minimal()           | " Clean folds
set noshowmode                                        | " Always show what mode we are on
set novisualbell                                      | " Don't display visual bell
set nowrap                                            | " Don't wrap lines
set nonu rnu                                          | " Show line numbers and relative number
set showmatch                                         | " Show matching braces
set termguicolors                                     | " Enables 24bit colors
set showcmd                                           | " Show (partial) command in the status line
" Highlight Customizations {{{
highlight Comment gui=italic,bold                     | " Make comments italic
set cursorline                                        | " Set a line on cursor
highlight CursorLine term=none cterm=none ctermbg=236 | " Current cursor line
highlight flicker cterm=bold ctermfg=white            | " Highlight flicker word under cursor
highlight Search cterm=underline                      | " Search terms in white underline
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE
" }}}
" }}}

" Mappings / Keybinds {{{

" General {{{
" Easy align in visual mode
xmap     ga <Plug>(EasyAlign)
" Easy align in normal mode
nmap     ga <Plug>(EasyAlign)
" }}}

" Search {{{
" Open fuzzy files with leader + ,
nnoremap <silent> <Leader>, :GFiles<CR>
" Open fuzzy lines with leader l
nnoremap <silent> <Leader>l :Lines<CR>
" Open fuzzy buffers with leader b
nnoremap <silent> <Leader>b :Buffers<CR>
" Open fuzzy windows with leader space
nnoremap <silent> <Leader>w :Windows<CR>
" Open ripgrep
nnoremap <silent> <Leader>f :Rg<CR>
" Open ripgrep agriculture for visual selection
vmap <Leader>/ <Plug>RgRawVisualSelection
" }}}

" Switching {{{
" Next buffer
nnoremap <silent> <Tab> :bnext<CR>
" Previous buffer
nnoremap <silent> <S-Tab> :bprevious<CR>
" Alternate file navigation
nnoremap <silent> <Leader>a :A<CR>
" Alternate file navigation vertical split
nnoremap <silent> <Leader><S-a> :AV<CR>
" }}}

" View Management {{{
" Open current file in fern
nnoremap <silent> - :Fern . -reveal=%<CR>
" Vertical split
nnoremap vs :vsplit<CR>
" Horizontal split
nnoremap sp :split<CR>
" Only window
nnoremap <silent> <Leader>o :only<CR>
" Close the current buffer
nnoremap <silent> <Leader>c :close<CR>
" Delete the current buffer
nnoremap <silent> <Leader>x :bdelete<CR>
" Close all buffers
nnoremap <silent> <Leader>z :%bdelete<CR>
" }}}

" Conquer of Completion {{{
" Get outline
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
" Get symbols
nnoremap <silent> <Leader>cs :<C-u>CocList -I symbols<CR>
" Get errors
nnoremap <silent> <Leader>cl :<C-u>CocList locationlist<CR>
" Get available commands
nnoremap <silent> <Leader>cc :<C-u>CocList commands<CR>
" Rename
nmap <Leader>$ <Plug>(coc-rename)
" Go to definition
nmap gd <Plug>(coc-definition)
" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Go to references
nmap <silent> gr <Plug>(coc-references)
" Go to type
nmap <silent> gy <Plug>(coc-type-definition)
" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" Get hint
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
" }}}

" Custom Tools {{{
" Open lazygit
" nnoremap <silent> <Leader>g :call openterm#horizontal('lazygit', 0.8)<CR>
" }}}

" }}}

" Search Configuration {{{
" Some ripgrep searching defaults
function! RgCommand(ignore) abort
  return join([
    \ 'rg',
    \ '--hidden', '--color ansi', '--column',
    \ '--line-number', '--no-heading', '--smart-case',
    \ (a:ignore == 1 ? '--ignore' : '--no-ignore')
  \], ' ')
endfunction
" Adds prompt
function! PreviewFlags(prompt) abort
  return ' --prompt="' . a:prompt . '> "'
endfunction
" Ensure that only the 4th column delimited by : is filtered by FZF
function! RgPreviewFlags(prompt) abort
  return PreviewFlags(a:prompt) . ' --delimiter : --nth 4..'
endfunction
" Configs the preview
function! Preview(flags) abort
  return fzf#vim#with_preview({'options': a:flags})
endfunction
" Executes ripgrep with a preview
function! Rg(ignore, args, bang) abort
  let command = RgCommand(a:ignore).' '.shellescape(a:args)
  call fzf#vim#grep(command, 1, Preview(RgPreviewFlags(a:ignore ? 'Grep' : 'Global Grep')), a:bang)
  call animate#window_percent_height(0.8)
endfunction

" Default FZF options with bindings to match layout and select all + none
let $FZF_DEFAULT_OPTS = join(
  \ [
    \ '--layout=default',
    \ '--info inline',
    \ '--bind ' . join(
      \ [
        \ 'ctrl-a:select-all',
        \ 'ctrl-d:deselect-all',
        \ 'tab:toggle+up',
        \ 'shift-tab:toggle+down',
        \ 'ctrl-p:toggle-preview'
      \ ],
      \ ',',
    \ )
  \ ],
  \ ' ',
\ )
" Default location for FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

" Plugin Configuration {{{
" Fern {{{
let g:fern#renderer = "devicons"
let g:fern#default_hidden = 1
let g:fern#default_exclude = &wildignore
" }}}

" Buftabline {{{
let g:buftabline_indicators = 1
" }}}

" Loupe {{{
let g:LoupeClearHighlightMap = 0
" }}}

" Conquer of Completion {{{

" Plugins {{{
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-pairs',
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-stylelint',
  \ 'coc-tslint',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
\ ]
" }}}

" CoC Related Settings {{{
" See coc-settings.json for more configuration
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Remove messages from in-completion menus
set shortmess+=c
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" }}}

" Use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" }}}

" Startify {{{
" Changes startify to have a different heading and only dirs
let g:startify_lists = [ { 'type': 'dir', 'header': ['   Recent Files'] } ]
" Don't change directories
let g:startify_change_to_dir = 0
" }}}

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'fzf']
" }}}

" Fold Digest {{{
let folddigest_options = "nofoldclose,vertical,flexnumwidth"
let folddigest_size = 40
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
" }}}

" }}}

" Auto Commands {{{
augroup TermHandling
  autocmd!
  if has('nvim')
    autocmd! TermOpen * let g:last_open_term_id = b:terminal_job_id
  endif
augroup END

" }}}
