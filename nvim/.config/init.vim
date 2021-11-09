set guicursor=
set encoding=utf-8
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=5
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set scrolloff=8
set termguicolors
set signcolumn=yes
set colorcolumn=79
set cursorline

set clipboard=unnamedplus

" Give more space for displaying messages
set cmdheight=1
            
" longer updatetime for better experience
set updatetime=500


" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active Plugins
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin("~/.config/nvim/plugged")
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better file browser
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatically close parenthesis, etc
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/rainbow_parentheses.vim'
" Surround
Plug 'tpope/vim-surround'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Git integration
Plug 'tpope/vim-fugitive'

" Better language packs
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'} 

call plug#end()

" ============================================================================
" Plugin Settings 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:dracula_colorterm = 0
colorscheme dracula

augroup rainbow
  autocmd!
  autocmd FileType * RainbowParentheses
  autocmd FileType py,json RainbowParentheses!
augroup END

"==== Semshi custom colors
function MyCustomHighlights()
    hi semshiSelected        guifg= ctermbg=161 guibg=#44475a
    hi semshiImported        ctermfg=231 guifg=#8be9fd
    hi semshiParameter        ctermfg=231 guifg=#ffb86c
    hi semshiBuiltin        ctermfg=231 guifg=#8be9fd
    hi semshiParemeterUnused        ctermfg=231 guifg=#ff5555
endfunction
autocmd FileType python call MyCustomHighlights()



let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright', 'coc-snippets']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"let g:python3_host_prog = '/home/deniz/.pyenv/shims/python3' " -------- Set python 3 provider


" ============================================================================
" Remappings
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting current document
nmap <leader>f :call CocAction('format')<CR>
" Save Document
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>

"==== split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move single lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

vnoremap <C-j> :m '>+1<CR>gv==gv
vnoremap <C-k> :m '<-2<CR>gv==gv

" move between buffers

map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" NERDTree -----------------------------

" toggle nerdtree display
map <C-b> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Fzf ------------------------------

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>


nnoremap <C-p> :GFiles<Cr>

" ============================================================================
"" Plugin Settings 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'dracula'
let g:airline#extensions#whitespace#enabled = 0

"let g:python3_highlight_all = 1

