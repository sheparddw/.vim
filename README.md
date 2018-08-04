# Daniel's Vim Repository
This vim configuration repository was created for efficient PHP and JavaScript/JSX coding.

For more information on Vim, see [this wikipedia article](https://en.wikipedia.org/wiki/Vim_(text_editor)).

## Installation:
Clone this repository to your home directory:
```
git clone git@github.com:sheparddw/.vim.git ~/.vim
```
Then install Dein (a Vim Plugin Manager):
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/installer.sh && sh ~/.vim/installer.sh ~/.vim/bundle/ && rm ~/.vim/installer.sh
```
Then within vim run the following:
```
:call dein#install()
```
To update plugins, run the following:
```
:call dein#update()
```

See vimrc and bundles.vim comments for more information on what is included.
Enjoy.

## Troubleshooting:
You may have to set up a symbolic link to get this vim configuration to work on some servers:
```
ln -s ~/.vim/vimrc ~/.vimrc
```
To get Airline Icons to work, use a [nerd-font](https://github.com/ryanoasis/nerd-fonts) such as [Knack (patched version of Hack)](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf) as your terminal font.

## Neovim:
For Neovim, run the following:
```
ln -s ~/.vim ~/.config/nvim && ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```
