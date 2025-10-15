# =============================================================================
# Common Shell Functions
# Shared utility functions loaded for all profiles
# =============================================================================

# -----------------------------------------------------------------------------
# File System & Navigation
# -----------------------------------------------------------------------------

# Create a new directory and enter it
function mk() {
	mkdir -p "$@" && cd "$@"
}

# Open current directory or specified location in file explorer
function o() {
	if [ $# -eq 0 ]; then
		explorer .
	else
		explorer "$@"
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

# Enhanced tree view with smart paging
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

# Search for files by name with specified depth
function fsearch() {
	if [ $# -ne 2 ]; then
		echo "Usage: fsearch <phrase> <depth>"
		return 1
	fi
	
	local depth=$1
	local phrase=$2
	find . -maxdepth "$depth" -iname "*$phrase*" -exec ls -ld {} +
}

# -----------------------------------------------------------------------------
# Security & SSH Management
# -----------------------------------------------------------------------------

# Load SSH key with automatic agent management
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

# Encrypt secrets folder using GPG
function endot() {
	cd ~/cfg
	tar czf encrypted.tar.gz etc/.local/share/misc
	gpg -er abdullah@abdullah.today encrypted.tar.gz
	rm encrypted.tar.gz
}

# Decrypt secrets folder using GPG
function dedot() {
	cd ~/cfg
	gpg -do encrypted.tar.gz encrypted.tar.gz.gpg
	tar xvf encrypted.tar.gz
	rm encrypted.tar.gz
}

# -----------------------------------------------------------------------------
# Development Tools & Utilities
# -----------------------------------------------------------------------------

# Open man page as PDF (macOS specific)
function manpdf() {
	man -t "${1}" | open -f -a /Applications/Preview.app/
}

# -----------------------------------------------------------------------------
# Profile Management
# -----------------------------------------------------------------------------

# Switch to a different profile
function set-active-profile() {
	local profile="$1"
	if [ -z "$profile" ]; then
		echo "Usage: set-active-profile <profile_name>"
		return 1
	fi
	source ~/.dotfiles/init/init.sh --force --profile="$profile"
}

# Get currently active profile
function get-active-profile() {
	echo "$PROFILE"
}

# -----------------------------------------------------------------------------
# System & Command Utilities
# -----------------------------------------------------------------------------

# Interactive confirmation for dangerous commands
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

# Check availability of essential development commands
function check_commands() {
	local cmds=(yt-dlp heroku aws java nvm git jq kubectl npm node vim vi)
	declare -A seen

	for cmd in "${cmds[@]}"; do
		if [[ -z "${seen[$cmd]}" ]]; then
			if ! command -v "$cmd" >/dev/null 2>&1; then
				warning "$cmd command not available"
			fi
			seen["$cmd"]=1
		fi
	done
}

# Log command before execution (useful for debugging)
function log_n_exec() {
	info "$*"
	eval "$*"
}