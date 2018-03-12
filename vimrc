" Options
set nocompatible
set encoding=utf-8
set background=dark
set hidden
set mouse=a
set cursorline
set modelines=0
set nobackup
set nowritebackup
set noswapfile
"set nowrap
set history=1000
set undolevels=1000
set number
set numberwidth=5
set autoindent
set copyindent
" set smartindent
set ruler
set incsearch
set hlsearch
set autoread
set visualbell
set noerrorbells
set showmatch
set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set expandtab
set nosmarttab
"set textwidth=80
"set colorcolumn=80
set ignorecase
set smartcase
set splitright
set wildignore=*.swp,*.bak,*.pyc
set pastetoggle=<F2>
set title
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set scrolloff=3
set nospell
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set clipboard+=unnamedplus

autocmd FileType vhdl let b:tagbar_ignore = 1

syntax on

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-visual-star-search'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'godlygeek/tabular'


call vundle#end()

filetype plugin indent on

let b:verilog_indent_modules = 1

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Use tabs with Makefiles
autocmd FileType make setlocal noexpandtab

" Still use 2 spaces with Python
"autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab

" Highlight todos
"call matchadd('Todo', '\s\+$')
call matchadd('Todo', 'TODO')
call matchadd('Todo', 'TODO:')
call matchadd('Todo', 'FIXME')
call matchadd('Todo', 'FIXME:')
call matchadd('Todo', 'DEBUG')
call matchadd('Todo', 'DEBUG:')
call matchadd('Todo', 'NOTE')
call matchadd('Todo', 'NOTE:')
call matchadd('Todo', 'NOTES')
call matchadd('Todo', 'NOTES:')

" Define new leader key
let mapleader = ","

" File explorer style
let g:netrw_liststyle = 1

" Airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

" Increment and decrement numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Buffer navigation
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprevious<CR>

" Buffer resizing
nnoremap <C-W><C-K> :exe "resize +5"<CR>
nnoremap <C-W><C-J> :exe "resize -5"<CR>
nnoremap <C-W><C-L> :exe "vertical resize +5"<CR>
nnoremap <C-W><C-H> :exe "vertical resize -5"<CR>

" Close buffer without closing window
nnoremap <C-X> :Bdelete<CR>

" Go to last buffer
nnoremap <tab> :b#<CR>

" Exit terminal mode
if has("gvim")
  tnoremap <leader>e <C-\><C-n>
endif

" Toggle NERD Tree
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <C-M-N> :NERDTreeFind<CR>

let g:NERDTreeWinSize = 30

" Toggle TagBar
nnoremap <C-M-M> :TagbarToggle<CR>

let g:tagbar_width = 30

" Colors
colorscheme solarized

" Status line
set statusline=%<\ %n:%f\ %m%r
set statusline+=%#warningmsg#%{fugitive#statusline()}%*
set statusline+=%=line:\ %l\/%L,\ col:\ %c%V\ (%P)\ 0x%B

" Use ii instead of ESC
imap ii <Esc>

" Default Enter key
"unmap <CR>

" Close if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Pressing \\ shows the current directory
cmap \\ <C-R>=expand("%:p:h")."/"<cr>
