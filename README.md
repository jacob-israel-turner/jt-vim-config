# Jacob Turner's Vim configuration

## Install packages
`npm install` or `npm start` (if you've already installed the node dependencies)

## Link .vimrc
```
ln -s ~/.vim/.vimrc ~/.vimrc
```

## Link .tmux.conf
```
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
```

## Create ~/.gitconfig
```
[include]
    path = ~/.vim/.gitconfig
```

## Create `init.vim`
Create `~/.config/nvim/init.vim` and place the following inside:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## vim-plug packages

### Install vim-plug
https://github.com/junegunn/vim-plug#neovim

### Install plugins
Open vim and run `:PlugInstall`.

Idea came from [here](http://stackoverflow.com/questions/18197705/adding-your-vim-vimrc-to-github-aka-dot-files)

## Todo:
 - [X] Make autocomplete work with [tsuquyomi](https://github.com/Quramy/tsuquyomi).
 - [X] Add custom [git file status indicators](https://github.com/Xuyuanp/nerdtree-git-plugin#faq)
