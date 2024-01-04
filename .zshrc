#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...

alias ll='ls -alh'
alias date='gdate'
# alias vi='/usr/local/bin/gvim'
alias vi='/Applications/MacVim.app/Contents/bin/mvim'

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

unalias lk
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
# export GOROOT=$HOME/.anyenv/envs/goenv/shims
export GOPRIVATE=github.com/kouzoh
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

# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=$JAVA_HOME/jre/bin:$PATH
export CLOUDSDK_PYTHON=/usr/bin/python3

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias lg='lazygit'
alias dco='docker-compose'
alias k='kubectl'
alias kd='kubectl get deploy'
alias kp='kubectl get pod'
alias ks='kubectl get service'

alias k-set-ctx-delv='kubectl config set-context --current --namespace=<insert-namespace-name-here>'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

source $HOME/.iterm2_shell_integration.zsh
function iterm2_print_user_vars() {
  iterm2_set_user_var kubecontext $(kube-context-info)
}
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/Users/yurakawa/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

source <(kubectl completion zsh)
export EDITOR=vim
direnv help &> /dev/null
if [ $? -eq 0 ]; then
  eval "$(direnv hook zsh)"
fi

export GPG_TTY=$(tty)
