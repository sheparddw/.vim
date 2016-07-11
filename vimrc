" Use plugins
source ~/.vim/bundles.vim

set t_Co=256 " Sets terminal to use 256 colors for CSApprox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
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
set softtabstop=0
set tabstop=4 " Switch tabs to spaces
set shiftwidth=4
set noexpandtab
set preserveindent
set copyindent
set mouse=a " Allow mouse.
set laststatus=2 " Always show status bar.
set nofoldenable " Disable Code Folding.
syntax enable " Enable syntax highlighting
set incsearch " Go to search while typing.
set ignorecase " Searches are case insensitive unless uppercase is used.
set smartcase

" Easy escaping to normal model
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
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2 -n --report=csv"
let g:syntastic_php_phpcs_exec="~/.composer/vendor/bin/phpcs"

" JavaScript
" Change tab widths to 2 spaces
au FileType javascript setl ts=2 sw=2 sts=2
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.php"
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'javascript' : 1,
    \}

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

" NerdTree
" Map NerdTree for easy file navigation
nmap <leader>nt :NERDTreeToggle<cr>
" Fix bug with navigation issues in Nerdtree
set encoding=utf-8

" DelimitMate
" Auto insert new line for brackets etc.
let delimitMate_expand_cr=1

" Airline
let g:airline_powerline_fonts = 1
" Custom Status (Airline) Options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
