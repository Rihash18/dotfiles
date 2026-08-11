let mapleader = " "
let maplocalleader = " "

set encoding=utf-8
set fileencoding=utf-8

set number
set relativenumber
syntax on
inoremap jk <Esc>
vnoremap jk <Esc>

nnoremap x "_x
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP


nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Show matches while typing
set incsearch

set scrolloff=8
set ruler

set mouse=a

set clipboard+=unnamedplus

set noswapfile
set nobackup
set nowritebackup

set undofile

set confirm

set guicursor=n:ver25

set completeopt=menu,menuone,noselect

" Better command-line completion
set wildmenu
set wildmode=longest,full

set cmdheight=1

" Kitty Terminal configurations
let &t_EI = "\e[2 q" " Normal Mode -> Steady Block
let &t_SI = "\e[6 q" " Insert Mode -> Steady Vertical Line (|)
let &t_ti .= "\e[2 q"

"Important: Reset to default block cursor on exit
autocmd VimLeave * silent !echo -ne "\e[2 q"
