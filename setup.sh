#!/usr/bin/sh

# global setting
cd

cat <<EOF > ~/.bashrc
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
[ -f $HOME/dotfiles/.bashrc ] && source $HOME/dotfiles/.bashrc
fi
EOF

cat <<EOF > ~/.zshrc
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
[ -f $HOME/dotfiles/.zshrc ] && source $HOME/dotfiles/.zshrc
EOF

cat <<EOF > ~/.vimrc
if filereadable(expand('$HOME/dotfiles/.vimrc'))
    source $HOME/dotfiles/.vimrc
endif
EOF

cat <<EOF > ~/.gitconfig
[include]
  path = ~/dotfiles/.gitconfig
EOF

# vim setting
cd ~/dotfiles
mkdir $HOME/.vim
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/swap
git submodule init
git submodule update


