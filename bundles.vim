if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundle'))
  call dein#begin(expand('~/.vim/bundle'))

" Add UI for Dein Updating.
call dein#add('wsdjeg/dein-ui.vim')

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
" Display the indention levels with thin vertical lines
call dein#add( 'Yggdroot/indentLine')
" Auto remove comments upon double enter
call dein#add( 'Osse/double-tap')

"" General Customization:
" Display autocomplete popup while typing.
call dein#add( 'exvim/ex-autocomplpop')
" Fuzzy file, buffer, mru, tag, etc finder.
call dein#add( 'ctrlpvim/ctrlp.vim')
call dein#add( 'tacahiroy/ctrlp-funky')
" Zoom Windows with <C-w>o
call dein#add( 'vim-scripts/ZoomWin')
" Display your undo history in a graph.
call dein#add( 'mbbill/undotree')
" Plugin for File Tree
call dein#add( 'scrooloose/nerdtree.git')

"" Indenting
" Fix indentation issues when pasting.
call dein#add( 'ConradIrwin/vim-bracketed-paste')

"" Syntax
" General Syntax Helpers
" Syntax checking hacks for vim
"call dein#add( 'scrooloose/syntastic')
call dein#add( 'w0rp/ale')
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
call dein#add( 'joonty/vdebug')
"call dein#add('mxw/vim-jsx', {
"	\   'autoload': {'filetypes': ['javascript']}
"	\ })

" Snippet Functionality.
call dein#add( 'MarcWeber/vim-addon-mw-utils')
call dein#add( 'tomtom/tlib_vim')
" Snipmate Requires vim-addon-mw-utils and tlib_vim
call dein#add( 'garbas/vim-snipmate')
call dein#add( 'honza/vim-snippets')

  call dein#end()
  call dein#save_state()
endif
" Allow Auto-Indenting.
filetype plugin indent on
syntax enable
