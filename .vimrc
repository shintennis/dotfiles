syntax on
set mouse=a                     " Use mouse
set nocompatible                " Use arrows
set backspace=indent,eol,start  " Use backspace

set number        " Show line numbers
set cursorline    " Highlight current line
set laststatus=2  " Always show status bar
set ruler         " Show scroll percentage
set title         " Show window title

set expandtab  " Convert tabs to spaces
set showmatch  " Highlight brackets
set autoindent

set nowrap
set nofoldenable
set clipboard=unnamed  " Sync clipboard with OS

set splitright  " Split to right when `:vs`
set splitbelow  " Split to below when `:sp`

" Tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" Markdown show trailing spaces
autocmd FileType markdown set list
autocmd FileType markdown set listchars=trail:▪︎

" Search
set incsearch
set ignorecase
set hlsearch

" Conceal
set concealcursor=
set conceallevel=2

" Fix mouse in tmux
if &term =~ '^screen'
    set ttymouse=xterm2
endif


" === Keymaps ==============================================

" Key combination timeout (ms)
set timeoutlen=300

" If autocompletion popup visable, <Tab> to select next item
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Open NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Save, quit
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
nnoremap <silent> q :q<CR>
nnoremap <silent> Q :qa<CR>

" Paste in newline
nnoremap <silent> pp :pu<CR>

" Easy indent
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap > >gv
vnoremap < <gv

" Add newline + ESC
nnoremap <CR> o<ESC>

" Clear search highlight
nnoremap <silent> <C-l> :nohlsearch<CR>

" Reload vimrc
nnoremap <silent> <F5> :source ~/.vimrc<CR>:echo "Reloaded!"<CR>


" === Plugins ==============================================

call plug#begin('~/.vim/bundle')

" PlugUpdate:  Install or update plugins
" PlugUpgrade: Upgrade vim-plug itself
" PlugClean:   Remove unused directories

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node',       { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'keith/swift.vim'
" vim-markdown depends on tabular
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux'

" Awesome
"Plug 'aseom/vim-nodejs-complete', { 'for': 'javascript' }
Plug 'aseom/vim-notetaking'

if has('mac')
    Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
    Plug 'aseom/vim-inputswitch'
endif

" Add plugins to &runtimepath
call plug#end()


" colorscheme
set background=light
try
    colorscheme PaperColor
catch 'Cannot find color scheme'
    colorscheme default
endtry

" vim-airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" neocomplete
set completeopt=menuone  " Popup even one item, no preview
let g:neocomplete#enable_at_startup = 1
" Call omni completion [O] for specific pattern matchs
let g:neocomplete#sources#omni#input_patterns = { 'javascript': '\h\w\+' }

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['^\.DS_Store$', '^\.Trash$', '\.swp$', '^\.dropbox']

"syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_stl_format = "Syntax:%F (%t)"
let g:syntastic_javascript_checkers = ['eslint']

" indentLine
let g:indentLine_color_term = 252
" https://github.com/Yggdroot/indentLine/issues/109
let g:indentLine_conceallevel  = &conceallevel
let g:indentLine_concealcursor = &concealcursor

" vim-markdown-preview
" By default, <C-p> to activate preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'
