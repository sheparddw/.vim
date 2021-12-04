if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundle'))
  call dein#begin(expand('~/.vim/bundle'))

" Add UI for Dein Updating.
call dein#add('wsdjeg/dein-ui.vim')

" LSP support
call dein#add('neovim/nvim-lsp')
call dein#add( 'neovim/nvim-lspconfig')

"" Appearance:
" Colors
call dein#add( 'morhetz/gruvbox')
call dein#add( 'NLKNguyen/papercolor-theme')
" Custom Status Line
call dein#add( 'bling/vim-airline')
call dein#add( 'vim-airline/vim-airline-themes')
" Match Tmux line to Vim Status line
call dein#add( 'edkolev/tmuxline.vim')
" Add File Type Icons
call dein#add( 'ryanoasis/vim-devicons')
" Git Wrapper
call dein#add( 'tpope/vim-fugitive')
" Git Blame
call dein#add( 'APZelos/blamer.nvim')
" Display the indention levels with thin vertical lines
call dein#add( 'Yggdroot/indentLine')
" Auto remove comments upon double enter
call dein#add( 'Osse/double-tap')

"" General Customization:
" Display autocomplete popup while typing.
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('Shougo/deoplete-lsp')
"call dein#add('carlitux/deoplete-ternjs')
call dein#add('neoclide/coc.nvim', { 'merged': 0 })

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/neco-syntax')
" Fuzzy file, buffer, mru, tag, etc finder.
"call dein#add( 'ctrlpvim/ctrlp.vim')
"call dein#add( 'tacahiroy/ctrlp-funky')
call dein#add( '/usr/local/opt/fzf/' )
"call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
"call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

" Display your undo history in a graph.
call dein#add( 'mbbill/undotree')
" Plugin for File Tree
call dein#add( 'scrooloose/nerdtree.git')

call dein#add( 'dominikduda/vim_current_word' )

"" Syntax
" General Syntax Helpers
" Syntax checking hacks for vim
"call dein#add( 'scrooloose/syntastic')
call dein#add( 'w0rp/ale')
" bridge between nvim lsp and ale lsp
call dein#add( 'rhysd/vim-lsp-ale')
" Emmet HTML Shorthand
call dein#add( 'mattn/emmet-vim')
" Provides insert mode auto-completion for quotes, parens, brackets, etc.
call dein#add( 'Raimondi/delimitMate')
" Commenting shortcuts.
call dein#add( 'scrooloose/nerdcommenter')
" HTML
" Highlight matching tag.
call dein#add( 'Valloric/MatchTagAlways')
" Auto Close HTML tags.
call dein#add( 'alvan/vim-closetag')
" PHP
call dein#add( '2072/PHP-Indenting-for-VIm')
call dein#add( 'StanAngeloff/php.vim')
" JavaScript
call dein#add( 'elzr/vim-json')
call dein#add( 'pangloss/vim-javascript')
call dein#add( 'jelera/vim-javascript-syntax')
" Use local eslint file instead of global.
call dein#add( 'mtscout6/syntastic-local-eslint.vim')
" Templating
call dein#add( 'xsbeats/vim-blade')
" Debugging
"call dein#add( 'vim-vdebug/vdebug')
call dein#add('mxw/vim-jsx', {
	\   'autoload': {'filetypes': ['javascript']}
	\ })
call dein#add('ianks/vim-tsx')
call dein#add('leafgarland/typescript-vim')

call dein#add('github/copilot.vim')

" Snippet Functionality.
call dein#add( 'MarcWeber/vim-addon-mw-utils')
call dein#add( 'tomtom/tlib_vim')
" Snipmate Requires vim-addon-mw-utils and tlib_vim
"call dein#add( 'garbas/vim-snipmate')
call dein#add( 'honza/vim-snippets')

  call dein#end()
  call dein#save_state()
endif
" Allow Auto-Indenting.
filetype plugin indent on
syntax enable
