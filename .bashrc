
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# Prompt
color_prompt=yes
if [ "$color_prompt" = yes ]; then
  USER_COLOR='\[\033[01;32m\]'
  HOST_COLOR='\[\033[01;32m\]'
  PWD_COLOR='\[\033[01;32m\]'
  RESET_COLOR='\[\033[00m\]'
  # BRANCH_COLOR='\[\033[31m\]'

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
    alias dco='docker-compose'
    alias hex2dec="printf '%d\n'"
    alias dec2hex="printf '%x\n'"
    alias pip='pip3.5'
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

fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
bind -x '"":fbr'
bind -x '"":fbrm'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
