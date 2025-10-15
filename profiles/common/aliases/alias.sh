# =============================================================================
# Common Shell Aliases
# Shared command shortcuts loaded for all profiles
# =============================================================================

# -----------------------------------------------------------------------------
# System & Navigation
# -----------------------------------------------------------------------------
# File system exploration
alias open='explorer .'
alias .="explorer ."
alias c="clear"
alias quit="exit"

# Directory listing and traversal
alias l="ls -l"
alias cl="clear && ls -l"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Privilege escalation
alias please=sudo

# -----------------------------------------------------------------------------
# Dotfiles Management
# -----------------------------------------------------------------------------
# Dotfiles navigation and management
alias dot="cd $DOTFILESDIR"
alias d="nvim ~/.dotfiles"
alias e="code $DOTFILESDIR"

# Dotfiles updates and reloading
alias dot-update="cd $DOTFILESDIR && git pull && reload"
alias update-dot="dot-update"
alias reload='source ~/.bash_profile'
alias edit="code ~/.bash_profile"

# Profile management
alias get-active-profile="echo $PROFILE"

# -----------------------------------------------------------------------------
# Development & Code Editors
# -----------------------------------------------------------------------------
# Editor configurations
alias vim="vim -u ~/.dotfiles/.vim/.vimrc"

# Project navigation
alias projects="cd $ROOTDIR/projects"

# Specialized project directories
alias chessable="cd /e/poseidon-backup/video/tutorials/chess/videos/Chessable"
alias chess-video="cd /e/poseidon-backup/video/tutorials/chess/videos"

# -----------------------------------------------------------------------------
# Node.js & Package Management
# -----------------------------------------------------------------------------
# Node version management
alias nvm20="nvm use 20.11.0"
alias nvm18="nvm use 18.16.0"
alias nvm16="nvm use 16.70"

# npm shortcuts
alias ni="npm install"
alias ci="rm -rf node_modules && npm ci"
alias cli="rm -rf node_modueles && rm package-lock.json && npm install"

# -----------------------------------------------------------------------------
# Security & SSH Management
# -----------------------------------------------------------------------------
# SSH utilities
alias start-ssh-agent="eval $(ssh-agent -s)"
alias load-github-ssh="ssh-add $DOTFILESDIR/secrets/.ssh/post-incident-ssh-key"

# -----------------------------------------------------------------------------
# Network & System Information
# -----------------------------------------------------------------------------
# IP address utilities
alias ip="curl -s ipinfo.io | jq -r '.ip'"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Network testing
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"

# HTTP method shortcuts
for METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$METHOD"="lwp-request -m '$METHOD'"
done
unset METHOD

# -----------------------------------------------------------------------------
# System Utilities
# -----------------------------------------------------------------------------
# Date and time
alias week='date +%V'

# System configuration
alias hosts="sudo $EDITOR /etc/hosts"

# Documentation and tools
alias grip="grip -b"