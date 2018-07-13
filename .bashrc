
# Prompt
color_prompt=yes
if [ "$color_prompt" = yes ]; then
  USER_COLOR='\[\033[01;32m\]'
  HOST_COLOR='\[\033[01;32m\]'
  PWD_COLOR='\[\033[01;32m\]'
  RESET_COLOR='\[\033[00m\]'
  PS1="${debian_chroot:+$debian_chroot)}${USER_COLOR}\u${HOST_COLOR}@\h:${PWD_COLOR}\w${RESET_COLOR}\$ "
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


case "${OSTYPE}" in
  darwin*)
    # alias ls="ls -G"
    # alias ll="ls -alG"
    alias ls='ls --color'
    alias ll='ls -la --color'
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
    alias vi='/usr/local/bin/mvim'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias rmigc='bundle exec rake db:migrate db:test:clone'
    alias vssh='vagrant ssh'
    alias vup='vagrant up'
    alias vhalt='vagrant halt'
    alias vreload='vagrant reload'
    ;;
  linux*)
    alias ls='ls --color'
    alias ll='ls -la --color'
    ;;
esac

# make a cd history of the absolute path
if [[ -n "$PS1" ]]; then
    cd() {
        command cd "$@"
        local s=$?
        if [[ ($s -eq 0) && (${#FUNCNAME[*]} -eq 1) ]]; then
            history -s cd $(printf "%q" "$PWD")
        fi
        return $s
    }
fi

function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    cd $src
  fi
}
bind -x '"": peco-src'
