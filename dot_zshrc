# Start configuration added by Zim Framework install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
# }}} End configuration added by Zim Framework install

# ------------------
# Custom Configuration
# ------------------

autoload bashcompinit && bashcompinit

# Customize to your needs...

alias ll='ls -alh'
alias date='gdate'

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function lk {
  cd "$(walk "$@")"
}

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
zle -N peco-select-history
bindkey '^r' peco-select-history

if [ -d $HOME/.anyenv/bin ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"
fi

export EDITOR=vim
direnv help &> /dev/null
if [ $? -eq 0 ]; then
  eval "$(direnv hook zsh)"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOPRIVATE=github.com/hq-jp

export GOENV_DISABLE_GOPATH=1
export PATH=${PATH}:${GOBIN}

export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/gnu-sed/libexec/gnuman:${MANPATH}
export PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:${MANPATH}"
export PATH="/opt/homebrew/share/git-core/contrib/diff-highlight:${PATH}"

export CLOUDSDK_PYTHON=/usr/bin/python3

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$HOME/development/flutter/bin:$PATH

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias lg='lazygit'
alias dco='docker-compose'
alias k='kubectl'
alias kd='kubectl get deploy'
alias kp='kubectl get pod'
alias ks='kubectl get service'

alias k-set-ctx-delv='kubectl config set-context --current --namespace=<insert-namespace-name-here>'

alias original_cue='~/go/bin/cue'

if [ -f '/opt/homebrew/bin/aws_completer' ]; then complete -C '/opt/homebrew/bin/aws_completer' aws; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

# source $HOME/.iterm2_shell_integration.zsh
# function iterm2_print_user_vars() {
#   iterm2_set_user_var kubecontext $(kube-context-info)
# }
eval "$(/opt/homebrew/bin/brew shellenv)"

source <(kubectl completion zsh)

export GPG_TTY=$(tty)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Docker CLI completions
fpath=(/Users/yurakawa/.docker/completions $fpath)

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Added by Antigravity
export PATH="/Users/yurakawa/.antigravity/antigravity/bin:$PATH"

alias python='python3'
