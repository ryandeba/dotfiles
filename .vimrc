execute pathogen#infect()

"general
set ignorecase
set history=100
set so=7 "autoscroll 7 lines from the top and bottom
set ruler
set backspace=2
set noswapfile
set laststatus=2
set hidden
set guioptions=m

"appearance
set t_Co=256
color koehler
syntax on
set synmaxcol=500
set number
set relativenumber
set nowrap
set list listchars=tab:->,eol:$
set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=236
hi CursorColumn cterm=NONE ctermbg=236
hi Normal ctermbg=256
set hlsearch
set mps+=<:>

"indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab
set noexpandtab


"autocomplete filenames to the longest possible name, show additional matches in status bar
set wildmode=longest:full
set wildmenu

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set formatoptions-=c formatoptions-=r formatoptions-=o


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

xnoremap p pgvy

" ADD CUSTOM CHANGES HERE FOR EACH BRANCH
color wombat256mod
set guifont=Ubuntu_Mono:h12:cANSI
vnorem // y/<c-r>"<cr>


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

set mouse=a




set autoread





augroup automatic_noeol
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END
 
function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction
 
function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction

:set formatoptions-=cro
