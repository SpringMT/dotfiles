# path self bin
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

function git_prompt_stash_count {
  local COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -gt 0 ]; then
    echo " ($COUNT)"
  fi
}

# Path to your oh-my-zsh configuration.
# https://github.com/robbyrussell/oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(git ruby gem)
source $ZSH/oh-my-zsh.sh

export PROMPT='[%n@%m] $(git_prompt_info)% %{$fg[yellow]%}%#%{$reset_color%} '
export RPROMPT='%{$fg[green]%}%~%{$reset_color%}'
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
export ZSH_THEME_GIT_PROMPT_SUFFIX="(%{`git_prompt_stash_count`%})%{$reset_color%} "
export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}✗%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

