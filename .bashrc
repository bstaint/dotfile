#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# env
export PATH="$(ruby -e 'print Gem.user_dir')/bin:/root/.local/bin:$PATH"
export PS1="\\[\\e[1;31m\\]\\u@ \\W:\\[\\e[0m\\] "
export WORKON_HOME=/srv/pyenv

# history
export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'

# alias auto color
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias la='ls -A'
alias ll='ls -alF'
alias tree='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias ..='cd ..'
alias df='df -h'
alias du='du -c -h'
alias free='free -m'                # show sizes in MB
alias grep='grep --color=auto'
alias grep='grep --color=tty -d skip'
alias mkdir='mkdir -p -v'
alias more='less'
alias ping='ping -c 5'

source /root/.local/bin/ssh-agent.sh
source /usr/bin/virtualenvwrapper.sh
