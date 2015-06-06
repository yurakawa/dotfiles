
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


# alias
alias ls='ls -G'
alias ll='ls -alFG'
alias rmigc='bundle exec rake db:migrate db:test:clone'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

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

# cowsay
function random_cowsay() {
    # Only brew user!
    # If you are not brew user, change 'COWS' path
    COWS=`brew --prefix`/Cellar/cowsay/3.03/share/cows
    NBRE_COWS=$(ls -1 $COWS | wc -l)
    COWS_RANDOM=$(expr $RANDOM % $NBRE_COWS + 1)
    COW_NAME=$(ls -1 $COWS | awk -F\. -v COWS_RANDOM_AWK=$COWS_RANDOM 'NR == COWS_RANDOM_AWK {print $1}')
    cowsay -f $COW_NAME "`Fortune -s`"
}
if which fortune cowsay >/dev/null; then
    while :
    do
        random_cowsay 2>/dev/null && break
    done
fi && unset -f random_cowsay

# bash_completion 
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
