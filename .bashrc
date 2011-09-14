# path self bin
PATH=$HOME/skybluesky/bin:$PATH
export PATH

# less
export LESS='-X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export JLESSCHARSET=japanese-ujis

# alias
alias rm='rm -i'
alias ll='ls -lGa'
alias ls='ls -G'

# git
if [ -r "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  source "/usr/local/etc/bash_completion.d/git-completion.bash"
  PS1="[\u \[\033[1m\]\$(__git_ps1 \"%s \")\[\033[0m\]\w]\\$ "
else
  :
fi
