set t_Co=256 " Sets terminal to use 256 colors for CSApprox

source ~/.vim/bundles.vim

colorscheme PaperColor

set background=dark
set number " always show line numbers
set ruler " Show line number in bottom-right of screen
set wrap " Wrap long lines (soft wrap)
set linebreak " only wrap on breakat characters
set nolist " list disables linebreak
set nolz " no lazy redraw
set autochdir " Always cd to the current file's directory
set hidden " enable undo history for when you switch buffers from one file to another. 
set scrolloff=1 " Always have at least one line above or below the cursor.
set tabstop=4 " Switch tabs to spaces
set shiftwidth=4
set expandtab
set mouse=a
set laststatus=2
syntax enable " Enable syntax highlighting



" Ctrl-P settings
" Ignore .git and .svn directories, the vendor folder, .csv and .log files
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v(^\/vendor|\/\.(git|svn)$)',
	\ }
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/public/forum/**
" Set the root marker to 'vendor' (this is how it knows what the root of the project is
let g:ctrlp_root_markers = [ 'vendor' ]
" Set the max-height
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
map <D-p> :CtrlP<cr>


" Plugin Settings:
" PHP
let PHP_removeCRwhenUnix = 1
" 
let g:jsx_ext_required = 0
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saves
nmap <leader>w :w!<cr>

"Easy escaping to normal model
imap jj <esc>
" Down is really the next line
nnoremap j gj
nnoremap k gk
" Prevent error with :Q instead of :q
command -bang Q quit<bang>
" Allow easy copying to system clipboard
vnoremap <leader>y "*y"


" Map NerdTree for easy file navigation
nmap <leader>nt :NERDTreeToggle<cr>
" Fix bug with navigation issues in Nerdtree
set encoding=utf-8

if has("persistent_undo")
    set undofile
    set undodir=$HOME/.vim/undodir/
endif
