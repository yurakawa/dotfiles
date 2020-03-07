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


alias vi='/usr/local/bin/gvim'

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


if [ -d $HOME/.anyenv/bin ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    # eval "$(pHOME/.anyenv/libexec/anyenv-init - --no-rehash)"
     eval "$(anyenv init - --no-rehash)"
fi

export EDITOR=vim
direnv help &> /dev/null
if [ $? -eq 0 ]; then
  eval "$(direnv hook zsh)"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=$HOME/.anyenv/envs/goenv/shims
export GOENV_DISABLE_GOPATH=1
# export GO111MODULE=on
export PATH=$PATH:$GOBIN



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yurakawa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yurakawa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yurakawa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yurakawa/google-cloud-sdk/completion.zsh.inc'; fi
