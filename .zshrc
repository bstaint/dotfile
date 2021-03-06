export WORKON_HOME=/srv/pyenv
export PATH="/root/.local/bin:$PATH"
export EDITOR=vim
export ZSH_TMUX_AUTOSTART=true
export MANPAGER="vim -M +MANPAGER -"

# load zgen
source "${HOME}/.zgen/zgen.zsh"
source /root/.local/bin/ssh-agent.sh


# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/fasd
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/virtualenv
  zgen oh-my-zsh plugins/virtualenvwrapper
  zgen oh-my-zsh plugins/shrink-path
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh themes/gentoo
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

  # generate the init script from plugins above
  zgen save
fi

setopt prompt_subst

zstyle ':completion:*' menu select
zstyle ':vcs_info:*' formats '(%b%c%u%m%F{blue})%f '

unalias ipython
alias mkvirtualenv2='mkvirtualenv --python=python2 pentest'
alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias cpu="watch -n 3 'top -b | head -n 5'"

ZSH_THEME_VIRTUALENV_SUFFIX='] '
PROMPT='$(virtualenv_prompt_info)%(!.%B%F{red}.%B%F{red}%n@)%m %F{blue}$(shrink_path -f) ${vcs_info_msg_0_}%F{blue}%(!.#.$)%{$reset_color%} '
