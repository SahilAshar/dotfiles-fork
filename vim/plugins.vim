" ========= VimPlug Plugins =========
call plug#begin('~/.vim/plugged')

" Languages
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'keith/swift.vim'
Plug 'wlangstroth/vim-racket'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" File browsing
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'

" HUD annotations
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'

" Typing
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" General functionality
Plug 'romainl/vim-qf'

call plug#end()


" ========= Plugin Configuration =========

" Airline
let g:airline_theme='cool'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" NERDTree
let NERDTreeMapOpenSplit='\t'
let NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=25
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Typescript
let g:typescript_indent_disable = 0
autocmd FileType typescript setlocal completeopt+=menu,preview  " autocomplete

" Autoclose HTML
let g:closetag_filenames = "*.html, *.hbs, *.handlebars"

" Vim-Go
let g:go_fmt_command = "goimports"
let g:go_doc_keywordprg_enabled = 0

" Auto-Pairs
let g:AutoPairsMultilineClose = 0

" Vim-Rust
let g:rustfmt_autosave = 1
let g:rustfmt_options = "-f"
let g:racer_experimental_completer = 1

" GitGutter
set updatetime=1000

" Neomake
let g:neomake_open_list = 2
autocmd! BufWritePre * if &ft == "rust" | Neomake cargo
