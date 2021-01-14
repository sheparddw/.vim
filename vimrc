" Use plugins
source ~/.vim/bundles.vim

set t_Co=256 " Sets terminal to use 256 colors for CSApprox
set nocompatible " No compatibility with vi to prevent plugin errors.
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark
set nonumber " Never show line numbers
"set number " Always show line numbers
set ruler " Show line number in bottom-right of screen
set wrap " Wrap long lines (soft wrap)
set linebreak " Only wrap on breakat characters
set backspace=indent,eol,start " Solve backspace problems
set nolist " List disables linebreak
set nolz " No lazy redraw
" set autochdir " Always cd to the current file's directory
set hidden " Enable undo history for when you switch buffers from one file to another.
set scrolloff=1 " Always have at least one line above or below the cursor.
set tabstop=4 " Set tab width.
set softtabstop=0
set shiftwidth=4
set noexpandtab " Switch spaces to tabs.
"set expandtab " Switch tabs to spaces.
set preserveindent
set copyindent
set mouse=a " Allow mouse.
set laststatus=2 " Always show status bar.
set nofoldenable " Disable Code Folding.
syntax enable " Enable syntax highlighting
set incsearch " Go to search while typing.
set ignorecase " Searches are case insensitive unless uppercase is used.
set smartcase
set exrc " Load project specific vimrcs (for example, spaces versus tabs per project).
set secure " Prevent unwanted scripts from running in project vimrcs.
"set clipboard=unnamed " Use the system clipboard (May require Vim 7.4+).

" Easy escaping to normal model
imap jj <esc>
" Down is really the next line
nnoremap j gj
nnoremap k gk
" Prevent error with :Q instead of :q
command! -bang Q quit<bang>
command! -bang Edit edit<bang>
" Convert Spaces to Tabs for whole file.
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
" Allow easy copying to system clipboard.
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

" Auto Paste modes:
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
if &term =~ '^tmux'
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
endif
 
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
 
function! XTermPasteBegin()
set pastetoggle=<Esc>[201~
set paste
return ""
endfunction


" Plugin Settings:

" Linting
let g:ale_linters = {
\	'php': ['php'],
\	'javascript': ['eslint', 'jshint'],
\	'scss': ['stylelint']
\}
let g:ale_fixers = {
\	'javascript': ['eslint'],
\	'html': ['eslint'],
\	'scss': ['stylelint']
\}
let g:ale_lint_on_text_changed = 'never'
nmap <leader>f :ALEFix<cr>

" PHP
"let g:syntastic_php_checkers = ['php','phpcs']
let PHP_removeCRwhenUnix = 1
"let g:ale_php_phpcs_options="--standard=Wpmudev-Plugins-Standard -n --report=csv"
" Only lint on save (to conserve battery life on laptops).

" Vdebug options for debugging PHP.
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
" Break on first line of file.
let g:vdebug_options.break_on_open = 0

"let g:syntastic_php_phpcs_args="--standard=WordPress -n --report=csv"
"let g:syntastic_php_phpcs_exec="~/.composer/vendor/bin/phpcs"

" JavaScript
" Change tab widths to 2 spaces
"au FileType javascript setl ts=2 sw=2 sts=2
" Use these linters/sniffers when project includes rc file.
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.php"
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'javascript' : 1,
    \}

" Emmet JSX Support.
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

" Autocomplete on typing.
let g:deoplete#enable_at_startup = 1
" Fix multithread error.
call deoplete#custom#option('num_processes', 4)
set completeopt+=noinsert

" Disable indentline for json as it conceals double quotes.
let g:indentLine_fileTypeExclude = ['json']
set conceallevel=0 " Do not conceal double quotes in JSON, etc.

nnoremap <C-p> :FZF <cr>

" NerdTree
" Map NerdTree for easy file navigation
nmap <leader>nt :NERDTreeToggle<cr>
" Fix bug with navigation issues in Nerdtree
set encoding=utf-8

" Split to new tab (to open at full size).
nmap <leader>z :tab split<cr>

" DelimitMate
" Auto insert new line for brackets etc.
let delimitMate_expand_cr=1

" Airline
let g:airline_powerline_fonts = 1
" Custom Status (Airline) Options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
" Configure Ale with airline.
let g:airline#extensions#ale#enabled = 1
