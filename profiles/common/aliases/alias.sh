# shortcuts
alias open='explorer .'
alias .="explorer ."
alias please=sudo
alias dot="cd $DOTFILESDIR"
alias dot-update="cd $DOTFILESDIR && git pull && reload"
alias update-dot="dot-update"
alias e="code $DOTFILESDIR"
alias get-active-profile="echo $PROFILE"

# Directory listing/traversal
alias c="clear"
alias l="ls -l"
alias cl="clear && ls -l"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# path based
alias projects="cd $ROOTDIR/projects"

# profile
alias reload='source ~/.bash_profile'
alias edit="code ~/.bash_profile"

# utilities
alias start-ssh-agent="eval $(ssh-agent -s)"

## npm
alias ni="npm install"
alias ci="rm -rf node_modules && npm ci"
alias cli="rm -rf node_modueles && rm package-lock.json && npm install"

# Network
alias ip="curl -s ipinfo.io | jq -r '.ip'"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Request using GET, POST, etc. method
for METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$METHOD"="lwp-request -m '$METHOD'"
done
unset METHOD

# Miscellaneous
alias week='date +%V'
alias hosts="sudo $EDITOR /etc/hosts"
alias quit="exit"
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"
alias grip="grip -b"

alias nvm20="nvm use 20.11.0"
alias nvm18="nvm use 18.16.0"
alias nvm16="nvm use 16.70"
alias d="nvim ~/.dotfiles"

alias vim="vim -u ~/.dotfiles/.vim/.vimrc"