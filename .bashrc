#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# env
export PATH="/root/.local/bin:$PATH"
export WORKON_HOME=/srv/pyenv
export EDITOR=vim

# history
export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'

source /usr/share/git/git-prompt.sh
export PS1='\[\e[1;34m\]$(__git_ps1 "(%s)")\[\e[1;31m\][\w]\$\[\e[0m\] '

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
alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias gitc='git clone --depth=1'
alias mkvirtualenv2='mkvirtualenv --python=python2 pentest'

# fasd config
eval "$(fasd --init auto)"
alias v='fasd -fe vim'
_fasd_bash_hook_cmd_complete v

# tmux
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

source /usr/bin/virtualenvwrapper.sh
source /root/.local/bin/ssh-agent.sh
