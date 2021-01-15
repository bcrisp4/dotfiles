# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### plugins ###
# https://github.com/zsh-users/antigen

PLUGIN_DIR=$HOME/.plugins
source $PLUGIN_DIR/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle apt
antigen bundle aws
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle gitfast
antigen bundle gitignore
antigen bundle golang
antigen bundle httpie
antigen bundle nmap
antigen bundle pep8
antigen bundle pip
antigen bundle salt
antigen bundle terraform
antigen bundle virtualenv
antigen bundle vagrant
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply


### base16 shell theme ###
# https://github.com/chriskempson/base16-shell
BASE16_SHELL="$PLUGIN_DIR/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


### fzf / fuzzy finder ###
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh


### aliases ###
# enable colour
alias grep="grep --color=auto"
alias jq="jq -C"
alias less="less -r"
alias ls="ls --color=auto"

# ls
alias l='ls'
alias ll='ls -l'
alias la='ls -la'

# git
alias g='git'

# misc.
alias c='clear'


### vte for tilix ###
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  vte_script="/etc/profile.d/vte.sh"
  [ -f $vte_script ] && source $vte_script
fi

### environment ###
export EDITOR="vim"

export GEM_HOME="$HOME/.gem"
export GEM_PATH="$GEM_HOME/bin"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export PATH="$HOME/bin:$HOME/.local/bin:$GOBIN:$GEM_PATH:/usr/sbin:$PATH"
