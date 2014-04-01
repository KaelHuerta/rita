# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="\[$(tput setaf 4)\]\u@\h[\t]: \w\n$> \[$(tput sgr0)\]"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')" && paplay /usr/share/sounds/KDE-Im-User-Auth.ogg'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias beep='paplay /usr/share/sounds/KDE-Im-User-Auth.ogg'



# Aprender un comando nuevo cada día
man $(ls /usr/bin | shuf -n 1)| sed -n "/^NAME/ { n;p;q }"


# SSH
# Para evitar el error "Error opening terminal:rxvt-unicode"
# que sucede al conectarse via ssh
#alias ssh="TERM=linux ssh"

# ps-fea
alias psf='ps -fea | grep'

# Git
alias gs="git status"
alias gls="git ls-files"
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias gb='git branch --color'
alias gba='git branch -a'
alias gg='git commit -v'
alias gca='git commit -v -a'

# Commit pending changes and quote all args as message
function gc() {
    git commit -v -a -m "$*"
}

alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdm='git diff master'
alias gpl='git pull'
alias gnp="git-notpushed"
alias gps='git push'
alias eg='e .git/config'

## Git clone from GitHub
#function gch() {
#  git clone git://github.com/nanounanue/$1.git
#}
#
#alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
#
## Setup a tracking branch from [remote] [branch_name]
#function gbt() {
#  git branch --track $2 $1/$2 && git checkout $2
#}
#
## Quickly clobber a file and checkout
#function grf() {
#  rm $1
#  git checkout $1
#}
#
## Mercurial
#alias hs="hg status"
#alias hpl="hg pull"
#alias hps="hg push"
#alias hd="hg diff"
#alias hgdi="hg diff --color=always --git | less -r"
##alias hgrev="hg revert --no-backup"
##alias hgclean="hg status | grep -e '^\\?' | sed 's/^\\?//' | xargs -t rm -f"
#
## Emacs
#alias e="emacsclient -t"
#alias ec="emacsclient -c"
#alias et="emacsclient -t"
#alias ed="emacs --daemon"
#
#
## Ruby
#alias r='rake'
## alias irb='irb --readline -r irb/completion'
#alias rii='ri -Tf ansi'
#
## Rails
#alias ss="./script/server"
#alias sc='./script/console'
#alias sg='./script/generate'
#alias sp='./script/plugin'
#alias tl='tail -f log/*.log'
#alias rmig='rake db:migrate'
#
## Utilidades
#alias reload='source ~/.bashrc'
#alias ea='e ~/config/dotfiles/bash/aliases && reload' # Edit aliases
#alias ee="e ~/config/dotfiles/bash/env"
#
#
#
## General
#alias h='history'
#alias md='mkdir -p'
#00
## clear
#alias c='clear'
#alias cl='clear; l'
#alias cls='clear; ls'
#
## ls
#alias ls='ls --color=auto'
#alias l='ls -h'
#alias ll="l -lGt" # -l lista larga, los más recientes primero
#                        # -G color
#alias lf="l -F"
#alias la='l -A'
#alias lt='l -lt' # sort with recently modified first
#
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
#
## cd
#alias ..='cd ..' # up one dir
#alias cdd='cd -' # goto last dir cd'ed from
#
#function cdc() {
#    cd $1; ls
#}
#
#function take() {
#    mkdir -p "$1"
#    cd "$1"
#}
#
## Popd, pushd, dirs
#alias +='pushd'
#alias _='popd'
#alias ?='dirs -v'
#
#
## kill
#alias k9="killall -9"
#
#function killnamed () {
#    ps ax | grep $1 | cut -d ' ' -f 2 | xargs kill
#}
#
#
## Directorios de proyectos
#function proyecto() {
#    cd ~/Documentos/proyectos/$1
#}
#
#alias p="proyecto"
#
## Habilitar y deshabilitar el touchpad
#alias moff='xinput set-int-prop "ImPS/2 Logitech Wheel Mouse" 134 8 0'
#alias mon='xinput set-int-prop "ImPS/2 Logitech Wheel Mouse" 134 8 1'
#
#
## Vagrant
#alias v='vagrant'
# The next line updates PATH for the Google Cloud SDK.
source /home/kaelinho/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
source /home/kaelinho/google-cloud-sdk/completion.bash.inc
