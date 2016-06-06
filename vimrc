" Use plugins
source ~/.vim/bundles.vim

set t_Co=256 " Sets terminal to use 256 colors for CSApprox
colorscheme PaperColor
set background=dark
set number " Always show line numbers
set ruler " Show line number in bottom-right of screen
set wrap " Wrap long lines (soft wrap)
set linebreak " Only wrap on breakat characters
set backspace=indent,eol,start " Solve backspace problems
set nolist " List disables linebreak
set nolz " No lazy redraw
set autochdir " Always cd to the current file's directory
set hidden " Enable undo history for when you switch buffers from one file to another. 
set scrolloff=1 " Always have at least one line above or below the cursor.
set tabstop=4 " Switch tabs to spaces
set shiftwidth=4
set expandtab
set mouse=a
set laststatus=2
set nofoldenable " Disable Code Folding.
syntax enable " Enable syntax highlighting

"Easy escaping to normal model
imap jj <esc>
" Down is really the next line
nnoremap j gj
nnoremap k gk
" Prevent error with :Q instead of :q
command -bang Q quit<bang>
" Allow easy copying to system clipboard
vnoremap <C-c> "*y
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saves
nmap <leader>w :w!<cr>

" Add Persistent Undo History
if has("persistent_undo")
    set undofile
    set undodir=$HOME/.vim/undodir/
endif


" Plugin Settings:

" PHP
let PHP_removeCRwhenUnix = 1

" JavaScript
" Change tab widths to 2 spaces
au FileType javascript setl ts=2 sw=2 sts=2
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

" Ctrl-P settings
" Ignore .git and .svn directories, the vendor folder, .csv and .log files
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v(^\/vendor|\/\.(git|svn)$)',
	\ }
" Disable other specific folders/files when calling CtrlP
set wildignore+=*/node_modules/**
set wildignore+=*/public/forum/**
" Set the root marker to 'vendor' (this is how it knows what the root of the project is
let g:ctrlp_root_markers = [ 'vendor' ]
" Set the max-height
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
map <D-p> :CtrlP<cr>

" Custom Status (Airline) Options
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline#extensions#branch#use_vcscommand = 1 " Use VCSCommand for branch info when applicable
let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#whitespace#checks = [ 'indent' ]

" NerdTree
" Map NerdTree for easy file navigation
nmap <leader>nt :NERDTreeToggle<cr>
" Fix bug with navigation issues in Nerdtree
set encoding=utf-8

" DelimitMate
" Auto insert new line for brackets etc.
let delimitMate_expand_cr=1
