if has('vim_starting')
    " Be iMproved
    set nocompatible
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" Async Updates
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }


"" Appearance:
" Colors
NeoBundle 'morhetz/gruvbox'
NeoBundle 'NLKNguyen/papercolor-theme'
" Custom Status Line
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" Match Tmux line to Vim Status line
NeoBundle 'edkolev/tmuxline.vim'
" Add File Type Icons
NeoBundle 'ryanoasis/vim-devicons'
" Git Wrapper
NeoBundle 'tpope/vim-fugitive'
" Display the indention levels with thin vertical lines
NeoBundle 'Yggdroot/indentLine'


"" General Customization:
" Display autocomplete popup while typing.
NeoBundle 'exvim/ex-autocomplpop'
" Fuzzy file, buffer, mru, tag, etc finder.
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
" Zoom Windows with <C-w>o
NeoBundle 'ZoomWin'
" Display your undo history in a graph.
NeoBundle 'mbbill/undotree'
" Plugin for File Tree
NeoBundle 'scrooloose/nerdtree.git'

"" Indenting
" Fix indentation issues when pasting.
NeoBundle 'ConradIrwin/vim-bracketed-paste'

"" Syntax
" General Syntax Helpers
" Syntax checking hacks for vim
NeoBundle 'scrooloose/syntastic'
" Emmet HTML Shorthand
NeoBundle 'mattn/emmet-vim'
" Provides insert mode auto-completion for quotes, parens, brackets, etc.
NeoBundle 'Raimondi/delimitMate'
" Commenting shortcuts.
NeoBundle 'scrooloose/nerdcommenter'
" HTML
" Highlight matching tag.
NeoBundle 'Valloric/MatchTagAlways'
" Auto Close HTML tags.
NeoBundle 'alvan/vim-closetag'
" PHP
NeoBundle '2072/PHP-Indenting-for-VIm'
NeoBundle 'StanAngeloff/php.vim'
" JavaScript
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
" Templating
NeoBundle 'xsbeats/vim-blade'
NeoBundleLazy 'mxw/vim-jsx', {
    \   'autoload': {'filetypes': ['javascript']}
    \ }

" Snippet Functionality.
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
" Snipmate Requires vim-addon-mw-utils and tlib_vim
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Allow Auto-Indenting.
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
call neobundle#end()

