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
set tabstop=2 " Set tab width.
set softtabstop=0
set shiftwidth=2
"set noexpandtab " Switch spaces to tabs.
set expandtab " Switch tabs to spaces.
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
autocmd VimResized * wincmd =
"set updatetime=750
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
" Copy file path to clipboard
nnoremap ,cp :let @+=expand("%:p")<CR>

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
\	'php': ['php','phpcs'],
\	'javascript': ['eslint', 'jshint'],
\	'typescript': ['eslint'],
\	'scss': ['stylelint']
\}
let g:ale_fixers = {
\	'php': ['phpcbf'],
\	'javascript': ['eslint'],
\	'typescript': ['eslint', 'prettier'],
\	'typescriptreact': ['eslint', 'prettier'],
\	'mdx': ['prettier'],
\	'html': ['eslint'],
\	'scss': ['stylelint']
\}
"let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_scss_stylelint_use_local_config = 1
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixer_aliases = {'typescriptreact': 'typescript'}
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
nmap <leader>f :ALEFix<cr>

" LSP
" highlight symbol under cursor
autocmd CursorHold  <buffer> silent! lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references()

" completion
set completeopt=menuone,noselect
set shortmess=filnxtToOFAc

" mappings
" See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap <silent> <c-]>       <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gD          <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> 1gD         <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gn          <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> g0          <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW          <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> ga          <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <silent> ga          :<c-u>lua vim.lsp.buf.range_code_action()<cr>
nnoremap <silent> <c-J>       <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> H           <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> L           <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
inoremap <silent> <c-s>       <cmd>lua vim.lsp.buf.signature_help()<cr>

sign define LspDiagnosticsSignError       text=ee texthl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning     text=ww texthl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation text=ii texthl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint        text=hh texthl=LspDiagnosticsSignHint

highlight link LspDiagnosticsFloatingError LspDiagnosticsFloatingError
highlight link NormalFloat Pmenu

highlight def link LspReference  CursorLine
highlight def link LspReferenceText CursorLine
highlight def link LspReferenceWrite CursorLine
highlight def link LspReferenceRead CursorLine

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Git Blame enable.
let g:blamer_enabled = 1

" Enable Git Linker (quickly copying a github/gitlab link to clipboard).
lua << EOF
require"gitlinker".setup()
EOF

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" PHP
let PHP_removeCRwhenUnix = 1
" Only lint on save (to conserve battery life on laptops).

" Vdebug options for debugging PHP.
"if !exists('g:vdebug_options')
  "let g:vdebug_options = {}
"endif
" Break on first line of file.
"let g:vdebug_options.break_on_open = 0

let g:ale_php_phpcs_options="--standard=Wpmudev-Plugins-Standard"
let g:ale_php_phpcbf_options="--standard=Wpmudev-Plugins-Standard"

" JavaScript
" Change tab widths to 2 spaces
au FileType javascript setl ts=2 sw=2 sts=2
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
"let g:deoplete#enable_at_startup = 1
" Fix multithread error.
"call deoplete#custom#option('num_processes', 4)
set completeopt+=noinsert

" Disable indentline for json as it conceals double quotes.
let g:indentLine_fileTypeExclude = ['json']
set conceallevel=0 " Do not conceal double quotes in JSON, etc.

" Telescope fuzzy finder.
" Requires BurntSushi/ripgrep.
nnoremap <C-p> <cmd>Telescope find_files<cr>

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
