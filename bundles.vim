if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


" provides insert mode auto-completion for quotes, parens, brackets, etc.
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'

" Fuzzy file, buffer, mru, tag, etc finder.
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'

" Custom Status Line
NeoBundle 'bling/vim-airline'

" Display your undo history in a graph.
NeoBundle 'mbbill/undotree'
" Plugin for File Tree
NeoBundle 'scrooloose/nerdtree.git'

" A vim plugin to display the indention levels with thin vertical lines
NeoBundle 'Yggdroot/indentLine'

" The missing motion in vim
NeoBundle 'justinmk/vim-sneak'
" Syntax checking hacks for vim
NeoBundle 'scrooloose/syntastic'
" Emmet HTML Shorthand
NeoBundle 'mattn/emmet-vim'

"" Indenting
" PHP Indenting
NeoBundle '2072/PHP-Indenting-for-VIm'

"" Indenting
NeoBundle 'swekaj/php-foldexpr.vim'

"" Syntax 
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'mxw/vim-jsx'


filetype plugin indent on     " required

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

