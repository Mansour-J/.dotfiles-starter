# Define function instead of alias (works better with pipes and eval)
# Functions expand properly with eval inside confirm.
# No need for quoting gymnastics with alias.
# The flow is intuitive:
function clearLocalBranches() {
  confirm "git branch | grep -v \"$(git rev-parse --abbrev-ref HEAD)\" | xargs git branch -D"
}

function gc() {
  git commit -m "$1"
}

function gac() {
  git add -A
  git commit -m "$1"
}

function gacp() {
  git add -A
  git commit -m "$1"
  git push
}

function gnb() {
  git checkout -b "$1"
}

alias ga='git add -A'
alias gco='git checkout'
alias gf='git fetch'
alias glog='git log --oneline'
alias gp='git push'
alias gpl='git pull'
alias gr='git reset'
alias grh='git reset --hard'
alias gs='git status'
alias gst='git stash'
alias removeLocalBranches="clearLocalBranches"