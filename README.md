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

## Create `init.vim`
Create `~/.config/nvim/init.vim` and place the following inside:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

Idea came from [here](http://stackoverflow.com/questions/18197705/adding-your-vim-vimrc-to-github-aka-dot-files)

## Todo:
 - [ ] Make autocomplete work with [tsuquyomi](https://github.com/Quramy/tsuquyomi).
 - [ ] Add custom [git file status indicators](https://github.com/Xuyuanp/nerdtree-git-plugin#faq)
