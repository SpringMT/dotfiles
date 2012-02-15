# Spring_MT dotfiles
## common conf
### .bashrc

~~~
if [ -f $HOME/dotfiles/.bashrc ]; then
    source $HOME/dotfiles/.bashrc
fi
~~~

### .vimrc

~~~
if filereadable(expand('~/dotfiles/.vimrc'))
  source ~/dotfiles/.vimrc
endif
~~~

### .screenrc
~~~
if [ -f $HOME/dotfiles/.screenrc ]; then
    source $HOME/dotfiles/.screenrc
fi
~~~

## bash memo

## vim memo

~~~
vim -u ~/dotfiles/.vimrc
###read!

~~~
vim --help
~~~

### screen memo

~~~
screen -c ~/dotfiles/.screenrc -S Spring_MT
ctr z + d
screen -ls
screen -r PID
bash -c source ~/dotfiles/.bashrc && screen -U -c ~/dotfiles/.screenrc -DR Spring_MT
bash --rcfile ~/dotfiles/.bashrc
SCREEN -dRR Spring_MT -c ~/dotfiles/.screenrc
~~~

### emacs memoo

~~~
emacs -l ~/.emacs/init.el -nw file_name
~~~

## Vundle install memo マシン新たに作るとき
1. https://github.com/gmarik/vundleをfork
1. git clone git@github.com:SpringMT/vundle.git ~/.vim/bundle/vundle
1. git submodule add git@github.com:SpringMT/vundle.git .vim/bundle/vundle
1. .vimrcに追記
(unite-outlineはforkして持ってきている)
1. Launch vim, run :BundleInstall.
1. mkdir ~/.vim; mkdir ~/.vim/backup; mkdir ~/.vim/swap


### addした人以外
1. git pull
1. git submodule
(-がついている)
1. git submodule init
1. git submodule update
http://blog.s21g.com/articles/1411

### BundleInstallができないとき
#### SSLの場合
http://vim.g.hatena.ne.jp/tokorom/20110612/1307857274
.gitconfig の http.sslVerify を false に設定すれば良い。

[http]
    sslVerify = false
  * Concect Time Out
   取得方法を変更
   git://github.com/SpringMT/unite-outline.git -> git@github.com:SpringMT/unite-outline.git

## githubの設定
git config --global github.user <USER NAME>
git config --global github.token <TOKEN>



## reference
### Vundle
http://shu-cream.blogspot.com/2011/04/2011vimvundle.html
https://github.com/gmarik/vundle
http://d.hatena.ne.jp/sugilog/20110813/1313200935
http://d.hatena.ne.jp/h1mesuke/20101107/p1
https://github.com/Shougo/unite.vim/wiki/unite-plugins
https://github.com/h1mesuke/unite-outline

### git submodule and fork
http://blog.s21g.com/articles/1401
http://subtech.g.hatena.ne.jp/miyagawa/20090114/1231910461

