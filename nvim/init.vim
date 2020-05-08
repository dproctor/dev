" General

let maplocalleader=","
let mapleader=','

"" spell checking
autocmd FileType txt set spell
autocmd FileType tex set spell

"" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"" Set default register to system register
set clipboard=unnamed

"" search

set incsearch       " Incrementally search. Like Emacs
set ignorecase " Ignore case when searching lowercase
set smartcase " Ignore case when searching lowercase

"" tab navigation
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>

"" Make buffers hidden rather than deleted when switching files
set hidden


" Formatting

set nosmartindent
filetype indent on

"" tabs
set expandtab
set tabstop=2
set shiftwidth=2

"" text widths for file types
"" Don't automatically break lines. Let ALE do that.
set tw=0

"" Add recognition of angle brackets
set matchpairs+=<:>

"" turn on highlighting for current line
set cursorline


" Plugins
"" Install
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'qpkorr/vim-renamer'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tibabit/vim-templates'
Plug 'vim-airline/vim-airline'
Plug 'hsanson/vim-android'
Plug 'natebosch/vim-lsc'
Plug 'Yggdroot/indentLine'

call plug#end()

"" Configuration
""" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
set completeopt+=noselect
set completeopt-=preview
set shortmess+=c

""" Echodoc
" To use echodoc, you must increase 'cmdheight' value.
let g:echodoc#type = "echo"
let g:echodoc_enable_at_startup = 1
set noshowmode

""" CtrlP
map <Leader>a :CtrlPBuffer<CR>
map <Leader>s :CtrlP<CR>
let g:ctrlp_map = '<c-s>'
"map <Leader>d :CtrlPMRUFiles<CR> " Not particularly useful

""" NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'java': ['google_java_format', 'remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'javascript.jsx': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'text': ['textlint'],
\}

let g:ale_linters = {
\   'typescript': ['typecheck', 'eslint'],
\   'python': ['pyls', 'mypy', 'flake8'],
\   'xml': ['android'],
\   'groovy': ['android'],
\   'java': ['android', 'javalsp', 'checkstyle'],
\   'text': ['textlint'],
\}

nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

nmap gd <Plug>(ale_go_to_definition)

let g:ale_fix_on_save = 1

let g:ale_java_javalsp_executable = "/home/devon/watched-repos/java-language-server/dist/lang_server_linux.sh"



""" vim-templates
let g:tmpl_author_email = "devon.proctor@gmail.com"
let g:tmpl_author_name = "Devon Proctor"
let g:tmpl_search_paths = ['~/.config/code-templates']

""" Gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=None

""" vim-android
let g:android_sdk_path = "/home/devon/Android/Sdk"
let g:gradle_loclist_show = 0
let g:gradle_show_signs = 0

""" insert timestamp
map <Leader>n :r! printf "\# `date +"\%Y-\%m-\%d \%H:\%M:\%S"`" <CR> <End>

""" insert TODO
map <Leader>t :r! printf -- "- TODO(Devon): " <CR> A

""" add installed python dependencies to path
set path+=/home/nvim/.local/lib/python3.6/site-packages/
