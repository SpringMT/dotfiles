source "$HOME/.bash_profile"
# path self bin
PATH=$HOME/skybluesky/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/vendor/bundle/ruby/1.9.1/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/Cellar/imagemagick/6.7.5-7/bin:$PATH
export PATH

# less
export LESS='-R -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export JLESSCHARSET=japanese-ujis

# grep
export GREP_OPTIONS='--color=auto'

# gem
export GEM_EDITOR="vim"

# alias
alias rm='rm -i'
if [ `uname` = "Darwin" ]; then
    alias ll='ls -lGa'
    alias ls='ls -G'
elif [ `uname` = "Linux" ]; then
    alias ll='ls -l --color=tty'
    alias ls='ls --color=tty'
fi
alias pingg='ping google.com'
alias redis-server='redis-server /usr/local/etc/redis.conf'

# git
if [ -r "/usr/share/git-core/git-completion.bash" ]; then
  source "/usr/share/git-core/git-prompt.sh"
  source "/usr/share/git-core/git-completion.bash"
  PS1="[\u \[\033[1m\]\$(__git_ps1 \"%s \")\[\033[0m\]\w]\\$ "
#PS1="["Spring_MT" \[\033[1m\]\$(__git_ps1 \"%s \")]\\$ "
else
  :
fi

# ruby
source "$HOME/.rbenv/completions/rbenv.bash"
source $HOME/perl5/perlbrew/etc/bashrc

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH


