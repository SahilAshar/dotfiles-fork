" ========= VimPlug Plugins =========

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } | Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'keith/swift.vim'
Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
" Plug 'dahu/vim-fanfingtastic'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jlanzarotta/bufexplorer'
Plug 'fatih/vim-go' " Remember to run :GoInstallBinaries on first install
Plug 'tpope/vim-dispatch'

call plug#end()


" ========= General Options =========

" Use UTF-8
set encoding=utf-8

" Highlight
syntax on
set hlsearch

" Line numbers
set number

" Delete like normal
set backspace=indent,eol,start

" Don't beep on errors
set visualbell
set t_vb=

" Map leader to backslash
let mapleader="\\"

" Wrap lines
set wrap

" Word wrap on line break
set linebreak

" Show as much of wrapped lines going off the screen as possible
set display+=lastline

" Minimum window height/width
set winheight=4 winminheight=4
set winwidth=15 winminwidth=15

" Map .md files to markdown
au BufNewFile,BufFilePre,BufRead *.md setlocal filetype=markdown

" Auto-resize splits when resizing vim generally
autocmd VimResized * wincmd =

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,elixir,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e


" ========= Colors =========

" Background color
set background=dark

" Change gutter and vsplit color
" hi LineNr ctermbg=#272d38
" hi VertSplit ctermbg=#272D38

" Colors
" silent! colorscheme slate
silent! colorscheme molokai
" silent! colorscheme afterglow

" Terminal color adjustments
set t_Co=256
let g:solarized_termcolors=256

" Something related to molokai
let g:molokai_original = 1

" Don't highlight with terrible colors
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi MatchParen cterm=NONE ctermfg=grey ctermbg=blue
hi Error cterm=NONE ctermfg=white ctermbg=red
hi SpellBad cterm=NONE ctermfg=white ctermbg=red

" New panes to right and bottom
set splitright

" Tabs and indents
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set smarttab
set autoindent
set cindent
set smartindent

" Four space tabs for Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4

" Seach case-sensitive if capital in pattern, otherwise insensitive
set ignorecase
set smartcase

" Incremental search
set incsearch

" Bash-style completions for file names
set wildmode=longest,list,full
set wildmenu

" Ignores
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,out,node_modules,dist,venv,vendor,*.swp

" Buffer space around cursor when scrolling
set scrolloff=3


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
let g:NERDTreeWinSize=25
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_of_chars_for_completion = 1
set completeopt-=preview'

" Typescript
let g:typescript_indent_disable = 0
autocmd FileType typescript setlocal completeopt+=menu,preview  " autocomplete

" Autoclose HTML
let g:closetag_filenames = "*.html, *.hbs, *.handlebars"

" Vim-Go
let g:go_fmt_command = "goimports"


" ========= Remappings =========

" Enter command mode
inoremap jk <esc>

" Buffers
nmap <leader>t :enew<CR>
nmap <leader>= :bnext<CR>
nmap <leader>- :bprevious<CR>
nmap <leader>w :bprevious <BAR> bd #<CR>

" Tabs
nmap <leader>T :tabe %<CR>
nmap <leader>+ :tabnext<CR>
nmap <leader>_ :tabprevious<CR>
nmap <leader>W :tabclose<CR>

" Nuke scroll wheel spam characters
noremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
inoremap <ScrollWheelDown> <nop>

" Jump paragraphs using capital J and K
noremap K {
noremap J }

" Move by display lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" Jump around lines
noremap z $
noremap Z ^

" Jump between panes with leader
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" Copy to system (only applicable on Mac)
noremap <leader>y "*y

" Search for highlighted text
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

" Infer type
map <leader>gt :YcmCompleter GetType<CR>

" View doc
map <leader>gd :YcmCompleter GetDoc<CR>

" Toggle NERDTree
nmap <leader>nt :NERDTreeToggle<CR>

" Focus NERDTree
nmap <leader>nf :NERDTreeFocus<CR>

" Open FZF file finder
map <C-p> :Files<CR>

" Subword motion
let g:wordmotion_mappings = {
			\ 'w' : 'gw',
			\ 'b' : 'gb',
			\ 'e' : 'ge',
			\ 'ge' : '',
			\ 'aw' : '',
			\ 'iw' : ''
\ }

let g:host_vimrc="$HOME/dotfiles/machines/" . substitute(system('hostname'), '\n', '', '') . "/vimrc"
if filereadable(expand(g:host_vimrc))
	execute 'so ' . fnameescape(g:host_vimrc)
endif
