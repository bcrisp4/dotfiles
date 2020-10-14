.DEFAULT_GOAL := default

PLUGIN_DIR = ${HOME}/.plugins
FONTS_DIR = ${HOME}/.local/share/fonts
ANTIGEN_REPO_SRC = "https://github.com/zsh-users/antigen.git"
VUNDLE_REPO_SRC = "https://github.com/VundleVim/Vundle.vim.git"
BASE16-SHELL_REPO_SRC = "https://github.com/chriskempson/base16-shell.git"
NERD-FONTS_REPO_SRC = "https://github.com/ryanoasis/nerd-fonts.git"

define install_from_git
	 [ -d $(2) ] || git clone $(1) $(2)
	 (cd $(2) ; git pull)
endef

define install_plugin
		$(call install_from_git,$(2),${PLUGIN_DIR}/$(1))
endef

plugin_dir:
		# Ensure the plugins directory exists
		mkdir -vp ${PLUGIN_DIR}

antigen: plugin_dir
		# Install the antigen ZSH plugin manager
		$(call install_plugin,antigen,${ANTIGEN_REPO_SRC})

vundle: plugin_dir
		# Install the vundle vim plugin manager
		$(call install_plugin,vundle,${VUNDLE_REPO_SRC})

base16-shell: plugin_dir
		# Install the vundle vim plugin manager
		$(call install_plugin,base16-shell,${BASE16-SHELL_REPO_SRC})

fonts:
	  # Ensure fonts dir exists
	  mkdir -vp ${FONTS_DIR}
	  # Download and extract patched FiraCode fonts
		[ -f ${FONTS_DIR}/FiraCode.zip ] || wget -O ${FONTS_DIR}/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip 
		unzip -oq ${FONTS_DIR}/FiraCode.zip
git:
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig

zsh: antigen base16-shell
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc

vim: vundle base16-shell
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	vim +PluginInstall +qall

tmux:
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf

default: zsh vim tmux git
