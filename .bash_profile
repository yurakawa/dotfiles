# ---
# bash_profile:ログイン時にのみ行う処理
# ---

export LANG="ja_JP.UTF-8"
export LC_ALL=ja_JP.UTF-8

# for terminal on OSX
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTTIMEFORMAT='%Y-%m-%d %T  '
#export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=100000

export PS1='`date +%Y`-`date +%m`-`date +%d` `date +%H`:`date +%M`:`date +%S`[\u@\H:`pwd -P`]\n\s\v $'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/VirtualBox.app/Contents/MacOS:$PATH"
export PATH="/Applications/android-sdk-macosx/platform-tools:$PATH"
# export PATH=$(brew --prefix openssl)/bin:$PATH
# export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# export PATH=$(brew --prefix coreutils)/libexec/gnuman:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

if [ -d $HOME/.anyenv/bin ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    # eval "$(pHOME/.anyenv/libexec/anyenv-init - --no-rehash)"
     eval "$(anyenv init - --no-rehash)"
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
export PATH=`npm bin -g`:$PATH

export EDITOR=vim
direnv help &> /dev/null
if [ $? -eq 0 ]; then
  eval "$(direnv hook bash)"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=$HOME/.anyenv/envs/goenv/shims
export GOENV_DISABLE_GOPATH=1
export GPG_TTY=$(tty)
# export GO111MODULE=on
export PATH=$PATH:$GOBIN

# bash_completion 
source $(brew --prefix bash-completion)/etc/bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuya.urakawa/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/yuya.urakawa/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuya.urakawa/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/yuya.urakawa/Downloads/google-cloud-sdk/completion.bash.inc'; fi

CLOUDSDK_PYTHON=$(which python2)

. "$HOME/.local/bin/env"
