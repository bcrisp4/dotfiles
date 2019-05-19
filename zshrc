# PATH
export PATH=~/bin:~/.gem/ruby/2.6.0/bin:$PATH
# Set default text editor
export EDITOR=/usr/bin/vim

# Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  git-extras
  rsync
  python
  archlinux
  sudo
  history
  vagrant
  vagrant-prompt
)

# oh-my-zsh path
export ZSH=/home/ben/.oh-my-zsh

# python-virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# ZSH Theme
ZSH_THEME="spaceship"

# Spaceship prompt options
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  #hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  #elixir        # Elixir section
  #xcode         # Xcode section
  #swift         # Swift section
  #golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  #julia         # Julia section
  docker        # Docker section
  #aws           # Amazon Web Services section
  venv          # virtualenv section
  #conda         # conda virtualenv section
  pyenv         # Pyenv section
  #dotnet        # .NET section
  #ember         # Ember.js section
  #kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  time
)
SPACESHIP_TIME_SHOW="true"
SPACESHIP_BATTERY_THRESHOLD=15

# Command Completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Command Auto-Correction
ENABLE_CORRECTION="true"

# Completion waiting dots
COMPLETION_WAITING_DOTS="true"

# User configuration
# man page path
export MANPATH="/usr/local/man:$MANPATH"

# Language
export LANG=en_GB.UTF-8

# Aliases
alias c="clear"
alias install="sudo dnf -y install"
alias remove="sudo dnf -y remove"
alias updates="sudo dnf -y check-update"
alias upgrade="sudo dnf upgrade"
alias playbook="ansible-playbook"

# Enable auto suggestion
source ~/git/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable syntax highlighting
source ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin


source $ZSH/oh-my-zsh.sh
