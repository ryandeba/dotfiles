call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'

call plug#end()


"general
set ignorecase
set history=100
set so=7 "autoscroll 7 lines from the top and bottom
set ruler
set backspace=2
set noswapfile
"set hidden

"appearance
set number
set relativenumber
set nowrap
set list listchars=tab:->,eol:$
set hlsearch
"set mps+=<:>
syntax enable
set background=dark
colorscheme dracula

"indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab
set expandtab


"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" mappings
imap jk <Esc>
let mapleader = " "
map <Leader>f :LAck -i
map <Leader>e :e **/
map <Leader>E :E<CR>
map <Leader>t :tabnew<Return>
map <Leader>w :w<Return>
map <Leader>lo :lopen<Return>
map <Leader>lc :lclose<Return>
map <Leader>ln :lnext<Return>
map <Leader>lp :lprevious<Return>
map <Leader>p "0p
vmap <Leader>c "+y
set pastetoggle=<F12>

"xnoremap p pgvy

set statusline=%f       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

