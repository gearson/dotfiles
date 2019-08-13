set nocompatible  " be iMproved
filetype off      " required
set noswapfile
set nowritebackup
set nobackup
set lazyredraw  "might make vim faster
set regexpengine=1  "might make vim faster

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim


"=================================================================

" Formatting and personal preferences

"=================================================================

set visualbell  " diable error bell
set encoding=utf-8
set modelines=0
set lines=50
set columns=120
set title

set omnifunc=syntaxcomplete#Complete
syntax on
set smartindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set textwidth=79

set number
set cursorline 

set ruler  " Display line and column number in bottom ruler.

set showmatch " highlight matching [{()}]

set incsearch " search as characters are entered

set laststatus=2

set wrap

set formatoptions=tcqrn1

set noshiftround

set autoindent

filetype indent on

set noshowmode

set showcmd


" Move up/down editor lines

nnoremap j gj

nnoremap k gk

set hidden " Allow hidden buffers

set ttyfast " Rendering

"==== Searching

nnoremap / /\v

vnoremap / /\v

set hlsearch

set incsearch

set ignorecase

set smartcase

set showmatch


"===== Color scheme (terminal)

set t_Co=256

"let g:solarized_termcolors=256

"let g:solarized_termtrans=1


set background=dark
"colorscheme dracula

"=========================================================

"Mappings 

"=========================================================

" Remap Help key

inoremap <F1> <ESC>:set invfullscreen<CR>a

nnoremap <F1> :set invfullscreen<CR>

vnoremap <F1> :set invfullscreen<CR>


"split navigations

nnoremap <C-J> <C-W><C-J>

nnoremap <C-K> <C-W><C-K>

nnoremap <C-L> <C-W><C-L>

nnoremap <C-H> <C-W><C-H>


" move between buffers

map <C-Left> <Esc>:bprev<CR>

map <C-Right> <Esc>:bnext<CR>


"==========================================================

" vundle stuff

"==========================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'

Plugin 'python-mode/python-mode'


" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:

"filetype plugin on

"

" Brief help

" :PluginList       - lists configured plugins

" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate

" :PluginSearch foo - searches for foo; append `!` to refresh local cache

" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"

" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line
colorscheme dracula

"===========================================================

" Some Plugin Configs

"===========================================================


let g:ctrlp_working_path_mode = 'r' 

let g:airline_theme='dracula'  "or solarized

let g:airline#extensions#tabline#enabled = 0 

let g:airline#extensions#branch#enabled = 1 

let g:airline_left_sep = ' | '

let g:airline_right_sep = ' ||  '

let g:airline_section_warning = '' 

let g:airline_section_y = '' 

let g:airline_section_x = '' 


" Nerd Tree toggling

map <C-b> :NERDTreeToggle<CR>



"==========================================

"Python Stuff

"==========================================


let g:pymode_python = 'python3'

let g:pymode_lint = 0

let g:pymode_breakpoint = 1

let g:pymode_syntax = 1

let g:pymode_breakpoint_bind = '<leader>b'

let g:pymode_run_bind = '<leader>r'

let g:pymode_indent = 1

let g:pymode_preview_height = &previewheight

let g:pymode_preview_position = 'botright'

let g:pymode_options_max_line_length = 79

let g:pymode_options_colorcolumn = 1


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open


" :let pythonthreedll = 'C:\Users\Deniz.Dohmen\AppData\Local\Programs\Python\Python37-32\Scripts\python36.dll'

":let pythonthreedll = 'C:\Users\Deniz\AppData\Local\Programs\Python\Python36-32\python36.dll'


"===========
" more Stuff
"===========
set pastetoggle=<F2>
set clipboard=unnamed
