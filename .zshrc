# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='249'

# Tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# Packages
NPM_PACKAGES="${HOME}/.npm-global"
RUBY_GEMS="$(ruby -e 'print Gem.user_dir')"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(z git npm node zsh-paci tmux extract vi-mode zsh-syntax-highlighting zsh-autosuggestions) 

source $ZSH/oh-my-zsh.sh
source ~/bin/tmuxinator.zsh

# User configuration

# Add to Path
export PATH="$NPM_PACKAGES/bin:$RUBY_GEMS/bin:$PATH"

# Manuals
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

# Some global variables
export EDITOR='vim'
export DEFAULT_USER=ilia
export LC_COLLATE="C"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Functions

myls() {
	ls -a -l --group-directories-first $1;
}

mycd() {
	cd $1;
	'myls';	
}

vplug() {
        local NAME=$(basename $1);
        cd ~/.vim/bundle;
        git clone $1;
        cd ~;
        git submodule add -f $1 .vim/bundle/$NAME;
        git commit -m "Add $NAME plugin for vim";
        git push --set-upstream origin master;
}

vunplug() {
        cd ~;
        git rm .vim/bundle/$1;
        git commit -m "Remove $1 plugin for vim";
        git push --set-upstream origin master;
}

# Aliases
alias cd="mycd"
alias ls="myls"
alias vplug="vplug"
alias vunplug="vunplug"


