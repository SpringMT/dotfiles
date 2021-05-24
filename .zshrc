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
alias pwgenc="pwgen -nB1 | tr '[a-z]' '[A-Z]' | pbcopy && pbpaste"

alias ctagsr='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'
alias sslscanall='sslscan --show-certificate --show-client-cas --show-ciphers --show-cipher-ids --show-times'


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
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

export PROMPT='[%n@%m] $(git_prompt_info)% %{$fg[yellow]%}%#%{$reset_color%} '
export RPROMPT='%{$fg[green]%}%~%{$reset_color%}'
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}✗%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors

