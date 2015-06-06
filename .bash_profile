
# for terminal on OSX
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTTIMEFORMAT='%Y-%m-%d %T  '

export PS1='`date +%Y`-`date +%m`-`date +%d` `date +%H`:`date +%M`:`date +%S`[\u@\H:`pwd -P`]\n\s\v $'
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/android-sdk-macosx/platform-tools:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# if [ -e ~/script/script.sh ]; then
#     ~/script/script.sh
# fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi
