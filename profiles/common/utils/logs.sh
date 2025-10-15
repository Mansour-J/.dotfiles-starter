# Logging functions
log() {
    local level=${1:-INFO}
    local msg=$2
	local ce="\033[0m"
	local cs
    case $level in
        INFO)
            cs="\u001b[36mℹ️"
            ;;
        SUCCESS)
            cs="\u001b[32m✅"
            ;;
        WARNING)
            cs="\033[0;33m⚠️"
            ;;
        ERROR)
            cs="\033[0;31m⛔"
            ;;
    esac
    # echo -e "${cs}$(date) [$(basename $0)] ${level}: ${msg}${ce}"
    echo -e "${cs} ${msg}${ce}"
}

info() {
    log INFO "$1"
}

error() {
    log ERROR "$1"
}


errorExit() {
    log ERROR "$1"
    exit 1
}

success() {
    log SUCCESS "$1"
}

warning() {
    log WARNING "$1"
}
