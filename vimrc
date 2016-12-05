set visualbell
syntax on
set background=dark
colorscheme desert
set number
set relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
set incsearch
inoremap jk <esc>
inoremap <esc> <nop>

noremap hi i
noremap l l
noremap i k
noremap k j
noremap j h
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

