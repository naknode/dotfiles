"###############################################################################
"# Neovim config (Dan Jasnowski) ###############################################
"###############################################################################

" Custom Vim Plug {{{
" Options for each plugin, helps improve readability of plugin registration
let g:vim_plug_opts = {
  \ 'mbbill/undotree':              {'on': 'UndotreeToggle' },
  \ 'neoclide/coc.nvim':            {'do': { -> coc#util#install()} },
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

Plug 'joshdick/onedark.vim'                                  | " My current vim theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'andreypopp/vim-colors-plain'
" }}}

" Search {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                      | " Fuzzy finding plugin
Plug 'mcchrish/nnn.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vifm/vifm.vim'
" }}

" Navigation {{{
Plug 'lambdalisue/fern.vim'                                  | " netrw replacement
Plug 'ap/vim-buftabline'                                     | " Displays buffers
Plug 'chaoren/vim-wordmotion'
Plug 'wellle/targets.vim'
" Plug 'wfxr/minimap.vim' " NEED TO UPDATE TO neovim 0.5.0
" }}}


" Visual {{{
Plug 'arecarn/vim-clean-fold'                                | " Provides function for folds
Plug 'wincent/loupe'                                         | " Search context improvements
" Look into https://github.com/hardcoreplayers/spaceline.vim
Plug 'vim-airline/vim-airline'                               | " Airline
Plug 'vim-airline/vim-airline-themes'                        | " Airline themes
Plug 'nathanaelkane/vim-indent-guides'                       | " Provides indentation guides
Plug 'edkolev/tmuxline.vim'
" }}}

" Editor {{{
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/vim-slash'                                    | " Awesome search highlighting
Plug 'tpope/vim-commentary'                                  | " Better commenting
Plug 'tpope/vim-surround'                                    | " Surround motions
Plug 'voldikss/vim-floaterm'                                 | " Floating terminal window
Plug 'liuchengxu/vista.vim'
Plug 'alvan/vim-closetag'
" Plug 'craigemery/vim-autotag'
" }}}


" Tools {{{
Plug 'tpope/vim-obsession'                                   | " Continuously updated session files
Plug 'dhruvasagar/vim-prosession'                            | " Allows switching between multiple sessions cleanly
Plug 'airblade/vim-gitgutter'                                | " Show git file diff
Plug 'wakatime/vim-wakatime'                                 | " Wakatime extension to track coding
Plug 'duggiefresh/vim-easydir'                               | " Create files in dirs that don't exist
Plug 'tpope/vim-dadbod'                                      | " DB support
Plug 'kristijanhusak/vim-dadbod-ui'                          | " DB UI support
Plug 'tpope/vim-fugitive'                                    | " Git tools
Plug 'mbbill/undotree'
" }}}

" Conquer of Completion {{{
Plug 'neoclide/coc.nvim'                                     | " Completion provider (a la VS Code)
" }}}

" Syntax {{{
Plug 'HerringtonDarkholme/yats.vim'                        | " TypeScript syntax highlighter
" Plug 'mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'} | " Typescrpt
Plug 'pangloss/vim-javascript'                             | " Syntax highlighting in JavaScript
Plug 'sheerun/vim-polyglot'                                | " Lang pack
Plug 'leafOfTree/vim-vue-plugin'                           | " Vue.js
" Plug 'Shougo/deoplete.nvim'                                | " For async completion
" Plug 'Shougo/denite.nvim'                                  | " For Denite features
" }}}
let g:deoplete#enable_at_startup = 1


" End the plugin registration
call plug#end()
" }}}

" Settings {{{

" General {{{
let mapleader = ","                                | " Map leader
let g:mapleader = ","                              | " Global map leader
let g:python3_host_prog = '/usr/bin/python3' | " Python 3 host
set encoding=utf8 "                                | " Default file encoding
set ttyfast
set hidden                                         | " Make buffers hidden then abandoned
set noautochdir                                    | " Don't change dirs automatically
set signcolumn=yes                                 | " Show signcolumns
set noerrorbells                                   | " No sound
set splitbelow splitright                          | " Split defaults
set undofile                                       | " Save undos after file closes
set undodir=$HOME/.vim/undo                        | " Where to save undo histories
set undolevels=1000                                | " How many undos?
set undoreload=10000                               | " Number of lines to save for undo
set wildignore+=*/tmp/*,*.so,*.swp,*.sw?,.git,.DS_Store,*.zip,*/node_modules/*,*/vendor*/,*/vendor/*,*/.idea/*,*/.vs/*
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
" }}}

" Search {{{
set ignorecase         | " Ignores case in search
set smartindent
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
let g:closetag_filenames = '*.vue,*.tsx,*.html,*.tsx'

" Special formatting for PHP and Blade files
autocmd Filetype "blade,php,cs" setl shiftwidth=4 softtabstop=4 tabstop=4
autocmd Filetype "vue" setl foldmethod=syntax
autocmd BufRead,BufNewFile *.vue setfiletype html
" Auto source on file save
autocmd BufWritePost $MYNVIMRC source $MYNVIMRC
autocmd FileType netrw setl bufhidden=wipe
" }}}

" Visual {{{
colorscheme onedark                                   | " Vim theme
let g:airline_theme='onedark'                         | " Airline theme
set background=dark
let &colorcolumn="121"                             | " Add indicator for 80 and 120
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
set cursorline
" }}}
" }}}

" Mappings / Keybinds {{{

" General {{{
" Easy align in visual mode
xmap     ga <Plug>(EasyAlign)
" Easy align in normal mode
nmap     ga <Plug>(EasyAlign)
" Open custom digest for folds
nnoremap <silent> <Leader>= :call FoldDigest()<CR>
nnoremap <silent> <Leader>v :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=gitrepo --autoclose=2 lazygit<CR>
nnoremap <silent> <Leader>q :call ToggleTheme()<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap <silent> <Leader>ev :vs $MYNVIMRC<CR>
nmap <silent> <Leader>et :vs $TMUXCONF<CR>
nmap <silent> <Leader>u :UndotreeToggle <bar> :UndotreeFocus<CR>
" }}}

" Search {{{
" Open fuzzy files with leader + ,
nnoremap <silent> <Leader>, :GFiles<CR>
" Open all files with fuzzy loader
nnoremap <silent> <Leader>p :Files<CR>
" Open fuzzy lines with leader l
nnoremap <silent> <Leader>l :Lines<CR>
" Open fuzzy buffers with leader b
nnoremap <silent> <Leader>b :Buffers<CR>
" Open fuzzy windows with leader space
nnoremap <silent> <Leader>w :Windows<CR>
" Open ripgrep
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>r :FloatermNew ranger<CR>
nnoremap <silent> <Leader>F :FloatermNew vifm<CR>
" Open ripgrep agriculture for visual selection
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor
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
" Close all buffers except current one
nnoremap <silent> <Leader>Z :%bd\|e#\|bd#<CR>
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
" Get hint
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics
" of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" }}}

" Custom Tools {{{
" Open lazygit
nnoremap <silent> <Leader>g :call openterm#horizontal('lazygit', 0.8)<CR>
" }}}

" }}}

" Search Configuration {{{
" Default location for FZF
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
nnoremap <silent><Leader><space> :nohlsearch<CR>
let g:ranger_map_keys = 0 
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
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
" Ranger {{{
let g:ranger_replace_netrw = 1 " open ranger when vim open a director
" }}}
" Fern {{{
let g:fern#default_hidden = 1
let g:fern#default_exclude = &wildignore
" }}}

" Buftabline {{{
let g:buftabline_indicators = 1
" }}}

" Loupe {{{
let g:LoupeClearHighlightMap = 0
" }}}

" General Editor {{{
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
  if pumvisible()
      return "\<C-y>"
  elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
      return "\<CR>\<Esc>O"
  elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
      return "\<CR>\<Esc>O"
  else
      return "\<CR>"
  endif
endfunction
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
set updatetime=100
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

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'fzf', 'fern']
" }}}

" Fold Digest {{{
" let folddigest_options = "nofoldclose,vertical,flexnumwidth"
" let folddigest_size = 40
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
" }}}

" Vista {{{
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:70%']
" }}}

" Gitgutter {{{
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1
" }}}

" Theme {{{
function! ToggleTheme()
    let s:light_theme = 'PaperColor'
    let s:dark_theme = 'onedark'

    if &background ==? 'dark'
      execute "colorscheme " . s:light_theme
      execute ":AirlineTheme " . tolower(s:light_theme)
      execute ":set background=light"
      echom 'Switching to ' . s:light_theme
      execute "silent !tmux source-file " . shellescape(expand('~/.....'))
    else
      execute "colorscheme " . s:dark_theme
      execute ":AirlineTheme " . s:dark_theme
      execute ":set background=dark"
      echom 'Switching to ' . s:dark_theme
    endif
endfunction
" }}}

" Floaterm {{{
let g:floaterm_wintitle=0
" }}}

" Coc {{{
" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" " Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}


" }}}
