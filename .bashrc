# Some shortcuts for different directory listings
 alias ls='ls -hFA --color=tty'                # classify files in colour
 alias dir='ls -A --color=auto --format=vertical'
 alias vdir='ls -A --color=auto --format=long'
 alias ll='ls -Al'                             # long list
# alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #

# alias myscreen='screen -RaAd -S DevScreen'
alias myscreen='tmux attach-session -t DevScreen || tmux new-session -s DevScreen'
export RANGER_LOAD_DEFAULT_RC=FALSE

export PS1='\[\e]0;\w\a\]\n\[\e[35m\][\D{%F %T}] \[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$'

stty -ixany

function ranger-cd {
  tempfile='/tmp/chosendir'
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
  if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
    cd -- "$(cat "$tempfile")"
  fi
  rm -f -- "$tempfile"
}

# -- Improved X11 forwarding through GNU Screen (or tmux).
# If not in screen or tmux, update the DISPLAY cache.
# If we are, update the value of DISPLAY to be that in the cache.
function update-display()
{
  if [ -z "$STY" -a -z "$TMUX" ]; then
    echo Updating ~/.display.txt with $DISPLAY
    echo $DISPLAY > ~/.display.txt
  else
    export DISPLAY=`cat ~/.display.txt`
    echo DISPLAY set to $DISPLAY
  fi
}

update-display

# This binds Ctrl-O to ranger-cd:
bind '"\C-o":"ranger-cd\C-m"'
