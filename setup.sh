#!/usr/bin/sh

# global setting
cd
/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
brew install git
brew install lv
git clone git@github.com:SpringMT/dotfiles.git

cat <<EOF > ~/.bashrc
if [ -f $HOME/dotfiles/.bashrc ]; then
    source $HOME/dotfiles/.bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
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


