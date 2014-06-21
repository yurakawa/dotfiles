export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


export PS1='`date +%Y`-`date +%m`-`date +%d` `date +%H`:`date +%M`:`date +%S`[\u@\H:`pwd -P`]\n\s\v $'
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/android-sdk-macosx/platform-tools:$PATH"

color_prompt=yes
if [ "$color_prompt" = yes ]; then
  USER_COLOR='\[\033[01;32m\]' # green ←ユーザ名を緑に
  HOST_COLOR='\[\033[01;32m\]' # green   ←ホスト名を青に
  PWD_COLOR='\[\033[01;32m\]' # green    ←WD を青に
  RESET_COLOR='\[\033[00m\]'
  PS1="${debian_chroot:+$debian_chroot)}${USER_COLOR}\u${HOST_COLOR}@\h:${PWD_COLOR}\w${RESET_COLOR}\$ "   #PS1変数に色情報を設定
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

alias ls='ls -G'
alias ll='ls -alFG'
alias rmigc='bundle exec rake db:migrate db:test:clone'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# bash_completion 
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


