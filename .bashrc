# path self bin
PATH=$HOME/skybluesky/bin:$PATH
PATH=$HOME/bin:$PATH
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

# git
if [ -r "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
  PS1="[\u \[\033[1m\]\$(__git_ps1 \"%s \")\[\033[0m\]\w]\\$ "
else
  :
fi

