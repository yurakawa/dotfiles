
# for terminal on OSX
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTTIMEFORMAT='%Y-%m-%d %T  '
export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=10000

export PS1='`date +%Y`-`date +%m`-`date +%d` `date +%H`:`date +%M`:`date +%S`[\u@\H:`pwd -P`]\n\s\v $'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/android-sdk-macosx/platform-tools:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH=$(brew --prefix php54)/bin:$PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# if [ -e ~/script/script.sh ]; then
#     ~/script/script.sh
# fi

#if which rbenv > /dev/null; then
#  export PATH="$HOME/.rbenv/shims:$PATH"
#  eval "$(rbenv init -)"
#fi

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

if [ -f $HOME/.phpenv/bin/phpenv ]; then
  export PATH=$PATH:$HOME/.phpenv/bin
  eval "$(phpenv init -)"
fi
