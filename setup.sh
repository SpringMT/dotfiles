#!/usr/bin/sh

# global setting
cd

cat <<EOF > ~/.bashrc
if [ -f $HOME/dotfiles/.bashrc ]; then
    source $HOME/dotfiles/.bashrc
fi
EOF

cat <<EOF > ~/.vimrc
if filereadable(expand('$HOME/dotfiles/.vimrc'))
    source $HOME/dotfiles/.vimrc
endif
EOF

# git setting
git config --global color.ui true
git config --global core.pager "lv -c"

# vim setting
cd ~/dotfiles
mkdir $HOME/.vim
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/swap
git submodule init
git submodule update


