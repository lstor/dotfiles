# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# color aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# other aliases
alias d="docker"
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cfg_install='curl -Lks http://bit.do/dotfiles-lstor | /bin/bash'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Try to find Powerline if we've just installed it.
if [ -z $POWERLINE_ROOT ]; then
    POWERLINE_ROOT=$(pip show powerline-status | grep Location | awk '{ print $2 }')/powerline
fi

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ${POWERLINE_ROOT}/bindings/bash/powerline.sh

## Set powerline location
# NOTE: This should be set by the installer program. If it hasn't been, run the
# commented command below and add its result to .bashrc.
#export POWERLINE_ROOT=$(pip show powerline-status | grep Location | awk '{ print $2 }')/powerline

