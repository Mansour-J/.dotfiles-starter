# Create a new directory and enter it
function mk() {
	mkdir -p "$@" && cd "$@"
}


function load-ssh() {
    local ssh_key="${1:-$DOTFILESDIR/secrets/.ssh/bnz_bitbucket}"

    eval $(ssh-agent -s) > /dev/null

    ssh-add "$ssh_key" 2>/dev/null

    if [[ $? -eq 0 ]]; then
        success "SSH Key loaded"
    else
        warning "Issue starting SSH-AGENT and loading SSH key: $ssh_key"
    fi
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null >/dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* ./*
	fi
}

# Open man page as PDF
function manpdf() {
	man -t "${1}" | open -f -a /Applications/Preview.app/
}

function release() {
	git add -A && git commit -m "$1" && npm run version && git push
}

# Download highest quality audio and video from a YouTube playlist in MP4 format
# Saves to Downloads/youtube-dl directory
function youtube-playlist() {
	# command for downloading the highest quality audio and video from youtube in MP4
	# usually yt-dlp downloads in .webm
	yt-dlp "$1" --yes-playlist -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --download-archive "$ROOTDIR/Downloads/youtube-dl/archive.txt" --continue --no-overwrites -P "D:/Downloads/youtube-dl"
}

 # Download highest quality audio and video from YouTube in MP4 format
 # Saves to Downloads/youtube-dl directory
function youtube() {
	# command for downloading the highest quality audio and video from youtube in MP4
	# usually yt-dlp downloads in .webm
	yt-dlp "$1" "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --download-archive "$ROOTDIR/Downloads/youtube-dl/archive.txt" --continue --no-overwrites -P "$ROOTDIR/Downloads/youtube-dl"
}

 # Download only audio from YouTube in M4A format
 # Embeds thumbnail and metadata
 # Keeps track of downloaded videos in archive.txt to avoid duplicates
 # Continues interrupted downloads and avoids overwriting existing files
function youtube-audio() {
	yt-dlp "$1" -f "bestaudio[ext=m4a]/bestaudio" -x --audio-format m4a --embed-thumbnail --add-metadata --download-archive "$ROOTDIR/Downloads/youtube-dl/archive.txt" --continue --no-overwrites -P "$ROOTDIR/Downloads/youtube-dl" "$1"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		explorer .
	else
		explorer "$@"
	fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

function endot() {
	cd ~/cfg
	tar czf encrypted.tar.gz etc/.local/share/misc
	gpg -er abdullah@abdullah.today encrypted.tar.gz
	rm encrypted.tar.gz
}

function dedot() {
	cd ~/cfg
	gpg -do encrypted.tar.gz encrypted.tar.gz.gpg
	tar xvf encrypted.tar.gz
	rm encrypted.tar.gz
}

function fsearch() {
  if [ $# -ne 2 ]; then
    echo "Usage: fsearch <phrase> <depth>"
    return 1
  fi
  
  local depth=$1
  local phrase=$2

  find . -maxdepth "$depth" -iname "*$phrase*" -exec ls -ld {} +
}

function confirm() {
  echo "You are about to execute:"
  echo "  $*"
  echo
  read -r -p "Are you sure you want to proceed? [Y/N]: " confirm
  case "$confirm" in
    [Yy]) eval "$@";;
    *) echo "Aborted.";;
  esac
}


## FIXME: change this so it takes a list of commands as arguments
function check_commands() {
  local cmds=(yt-dlp heroku aws java nvm git jq kubectl npm node vim vi)

  declare -A seen

  for cmd in "${cmds[@]}"; do
    if [[ -z "${seen[$cmd]}" ]]; then
      if ! command -v "$cmd" >/dev/null 2>&1; then
        warning "$cmd command not available"
	#   else
	#   	success "$cmd is available"
      fi
      seen["$cmd"]=1
    fi
  done
}

function log_n_exec() {
	info "$*"
    eval "$*"
}

function set-active-profile() {
    local profile="$1"
    if [ -z "$profile" ]; then
        echo "Usage: set-active-profile <profile_name>"
        return 1
    fi
    # Source the init.sh with the new profile in the current shell
    source ~/.dotfiles/init/init.sh --force --profile="$profile"
}

function get-active-profile() {
    echo "$PROFILE"
}