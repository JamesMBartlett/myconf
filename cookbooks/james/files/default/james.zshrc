# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SHELL="/usr/bin/zsh"

autoload -Uz compinit
compinit

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gallois"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl bazel)

export RPS1='[$(kubectx -c 2>/dev/null)]'

source $ZSH/oh-my-zsh.sh

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias kc='kubectl'
alias wip='git commit -m "WIP"'
alias squish='git status && git commit -a --amend -C HEAD'

# Setup pyenv
export PYENV_ROOT="$HOME/tools/pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if ! alias diff >/dev/null 2>&1; then
  cdiff(){
      diff -u $1 $2 | colordiff | /usr/share/doc/git/contrib/diff-highlight/diff-highlight
  }
fi

export EDITOR=vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make fzf respect .gitignore's
export FZF_DEFAULT_COMMAND='fd -H -E .git --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GPG_TTY=$(tty)

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/.local/bin

# Add command to delete least recently accessed files, beyond a certain capacity
rmcache() {
  # find files; sort by last accessed time [%A@]; accumulate file size in 512B blocks [%b]; print path [%p] when capacity exceeded; delete
  # Taken from: https://github.com/bazelbuild/bazel/issues/5139
  find $1 -type f -printf '%A@ %b %p\0' |
    sort --numeric-sort --reverse --zero-terminated |
    awk --assign RS='\0' --assign ORS='\0' --assign CAPACITY=$(($2 * 1024 * 1024 * 1024 / 512)) '{du += $2}; du > CAPACITY { print $3 }' |
    xargs -r0 rm
}

source ~/.nvm/nvm.sh
