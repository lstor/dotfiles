### Header {{
#
# .bashrc by lstor
# see https://github.com/lstor/dotfiles for details
#
# ----------------------------------------------------
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
#
# }}


### Options {{
#
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

export PATH=$PATH:~/bin
export GOPATH=$HOME/src/go
#
# }}


### Colors {{
#
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

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#
# }}


### Aliases {{
#
alias d=docker
alias h=history
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cfg_install='curl -Lks http://bit.do/dotfiles-lstor | /bin/bash'
alias vim_pluginupdate='vim +PluginUpdate +qall'

if hash nvim 2>/dev/null; then
  alias vim=nvim
fi

# ssh aliases
alias vtable="ssh lstor@vtable.lstor.me"
#
# }}


### Completion {{
#
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable git completion features
if ! shopt -oq posix; then
  if [ -f ~/bin/git-completion.bash ]; then
    source ~/bin/git-completion.bash
  fi
fi
#
# }}


### Local overrides {{
# Allow local overrides
source ~/.bashrc.local
# }}


### Powerline {{
#
# NOTE: Powerline location should be set by the installer program and added to
# .bashrc.local, which is sourced below. If it hasn't been, run the commented
# command below and add its result to '.bashrc.local':
#export POWERLINE_ROOT=$(pip show powerline-status | grep Location | awk '{ print $2 }')/powerline

# Try to find Powerline if we've just installed it.
if [ -z $POWERLINE_ROOT ]; then
    POWERLINE_ROOT=$(pip show powerline-status | grep Location | awk '{ print $2 }')/powerline
fi

# This must be *after* local changes to allow for local variations on
# POWERLINE_ROOT
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ${POWERLINE_ROOT}/bindings/bash/powerline.sh
#
# }}


### Vim stuff {{
# vim:fdm=marker:fmr={{,}}:fcl=all:fdl=0:ts=2:sw=2:sts=2:
# }}
