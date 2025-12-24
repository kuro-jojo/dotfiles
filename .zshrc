
# ================================================
# Environment Initialization
# ================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# ================================================
# Oh-My-Zsh Configuration
# ================================================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
# Set to "random" to load a random theme each time oh-my-zsh is loaded
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"
#ZSH_THEME="gozilla"
#ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ================================================
# ZSH Configuration
# ================================================

# Completion settings
# COMPLETION_WAITING_DOTS="true"  # Show red dots while waiting for completion
# CASE_SENSITIVE="true"  # Uncomment for case-sensitive completion
# HYPHEN_INSENSITIVE="true"  # Uncomment for case-insensitive completion

# Auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13   # update frequency in days

# Display settings
# DISABLE_LS_COLORS="true"  # Uncomment to disable colors in ls
# DISABLE_AUTO_TITLE="true"  # Uncomment to disable auto-setting terminal title
# ENABLE_CORRECTION="true"  # Uncomment to enable command auto-correction
# DISABLE_MAGIC_FUNCTIONS="true"  # Uncomment if pasting URLs is messed up

# Performance settings
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # Speeds up repository status checks

# History settings
# HIST_STAMPS="mm/dd/yyyy"  # Format of history command timestamp

# Oh-My-Zsh plugins
# Standard plugins: $ZSH/plugins/
# Custom plugins: $ZSH_CUSTOM/plugins/
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
fpath=($fpath ~/.zsh/completion)

# Initialize Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ================================================
# Environment Variables
# ================================================

# Language environment
# export LANG=en_US.UTF-8
# export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch x86_64"  # Compilation flags

# Editor preferences
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ================================================
# Aliases
# ================================================
alias compress_video='f(){ ffmpeg -i "$1" -vcodec libx265 -preset faster -crf 28 "$2"; }; f'
alias s="sudo"

# zoxide
alias cd="z"

# fzf
alias fzfb="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias fzfi="fzf --preview 'fzf-preview.sh {}'"

# Bat (better cat)
alias bat="batcat"

# Colorls (better ls with colors and icons)
source $(dirname $(gem which colorls))/tab_complete.sh 2>/dev/null || true

alias ll="colorls -l --sd"
alias l="ll"
alias la="colorls -la --sd"

# System commands
alias cls="clear"
alias cl="clear"
alias python=python3
alias rs="shutdown -r now"
alias suspend="systemctl suspend"

# Battery management
alias battery_limit="$HOME/limitd.sh"

# Custom scripts
export SCRIPT_PATH="$HOME/Projects/scripts"

# Docker
alias docker_no_root="echo 'sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker'"

# Kubernetes
alias k="kubectl"
alias mk="minikube"
alias kn="kubectl config set-context --current --namespace "

# ================================================
# Development Tools Configuration
# ================================================
export PATH="$PATH:$HOME/.local/bin:$SCRIPT_PATH"
# Google Cloud SDK
if [ -f '/home/jonathan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then 
  source '/home/jonathan/Downloads/google-cloud-sdk/path.zsh.inc'
  source '/home/jonathan/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm bash_completion

# Angular CLI
source <(ng completion script) 2>/dev/null || true  # Load Angular CLI autocompletion if available


# ================================================
# Android Development
# ================================================

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/emulator/


# ================================================
# Powerlevel10k Configuration
# ================================================

# Load p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment and customize the following for Powerlevel9k configuration
# (commented out since we're using Powerlevel10k)
# POWERLEVEL9K_MODE='awesome-fontconfig'
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_COLOR_SCHEME='light'
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%}❯ "
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_VCS_STAGED_ICON="\u00b1"
# POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF"
# POWERLEVEL9K_VCS_UNSTAGED_ICON="\u00b1"
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193"
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191"
# POWERLEVEL9K_SHOW_CHANGESET="true"
# POWERLEVEL9K_CHANGESET_HASH_LENGTH="12"
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
# POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
# POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
# POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
# POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
# POWERLEVEL9K_TODO_BACKGROUND="clear"
# POWERLEVEL9K_TODO_FOREGROUND="green"
# POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
# POWERLEVEL9K_OS_ICON_FOREGROUND="white"
# POWERLEVEL9K_HISTORY_BACKGROUND="clear"
# POWERLEVEL9K_HISTORY_FOREGROUND="blue"
# POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
# POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
# POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
# POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
# POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
# POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
# POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
# POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
# POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
# POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
# POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
# POWERLEVEL9K_RAM_BACKGROUND="clear"
# POWERLEVEL9K_RAM_FOREGROUND="green"
# POWERLEVEL9K_RAM_ELEMENTS="ram_free"
# POWERLEVEL9K_TIME_BACKGROUND="clear"
# POWERLEVEL9K_TIME_FOREGROUND="white"
# POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"
# POWERLEVEL9K_STATUS_VERBOSE="true"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('status' 'background_jobs' 'root_indicator' 'os_icon' 'context' 'dir' 'vcs')
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('load' 'ram' 'history' 'todo' 'time')
# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
