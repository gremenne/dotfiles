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

# Sets the BASH window title automatically when invoked from SCREEN
if [ "$TERM" = "screen" ]; then
  screen_set_window_title () {
    local HPWD="$PWD"
    case $HPWD in
      $HOME) HPWD="~";;


      ## long name option:
      # $HOME/*) HPWD="~${HPWD#$HOME}";;


      ## short name option:
      *) HPWD=`basename "$HPWD"`;;


    esac
    printf '\ek%s\e\\' "$HPWD"
  }
  PROMPT_COMMAND="screen_set_window_title; $PROMPT_COMMAND"
fi
