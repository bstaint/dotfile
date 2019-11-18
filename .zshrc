export WORKON_HOME=/srv/pyenv
export PATH="/root/.local/bin:$PATH"
export EDITOR=vim
export ZSH_TMUX_AUTOSTART=true

# load zgen
source "${HOME}/.zgen/zgen.zsh"
source /root/.local/bin/ssh-agent.sh
source /usr/bin/virtualenvwrapper_lazy.sh


# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/fasd
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/virtualenv
  zgen oh-my-zsh plugins/shrink-path
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh themes/gentoo
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

  # generate the init script from plugins above
  zgen save
fi

setopt prompt_subst

zstyle ':completion:*' menu select

alias mkvirtualenv2='mkvirtualenv --python=python2 pentest'
alias pipu="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

PROMPT='%{$fg_bold[red]%}%m %{$fg_bold[blue]%}$(shrink_path -f) $(git_prompt_info)$(prompt_char)%{$reset_color%} '
