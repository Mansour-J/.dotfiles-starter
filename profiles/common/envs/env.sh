# =============================================================================
# Common Environment Variables
# Shared configurations loaded for all profiles
# =============================================================================

# -----------------------------------------------------------------------------
# System & Editor Configuration
# -----------------------------------------------------------------------------
# Make vim the default editor
export EDITOR='vim'

# Setting NVIM home folders
export XDG_DATA_HOME="~/.dotfiles"
export XDG_CONF_HOME="~/.dotfiles"

# -----------------------------------------------------------------------------
# Node.js Configuration
# -----------------------------------------------------------------------------
# Enable persistent REPL history for node
export NODE_REPL_HISTORY=~/.node_history

# Allow 32³ entries; the default is 1000
export NODE_REPL_HISTORY_SIZE='32768'

# Use sloppy mode by default, matching web browsers
export NODE_REPL_MODE='sloppy'

# -----------------------------------------------------------------------------
# Java Development Environment
# -----------------------------------------------------------------------------
# Java JDK Configuration
# export JAVA_HOME='/c/Program Files/Amazon Corretto/jdk19.0.2_7'
export JAVA_HOME='/c/Program Files/Eclipse Adoptium/jdk-21.0.6.7-hotspot'
export JAVA_BIN="$JAVA_HOME/bin"

# Gradle Build Tool
export GRADLE_HOME='/c/Users/019628/bin/gradle-9.1.0'
export GRADLE_BIN="$GRADLE_HOME/bin"

# -----------------------------------------------------------------------------
# Package Managers & Development Tools
# -----------------------------------------------------------------------------
# Yarn Package Manager (Unix-style path)
export YARN_BIN='/c/Users/019628/AppData/Local/Yarn/bin'

# Heroku CLI
export HEROKU_HOME='/c/Program Files/heroku/bin'

# -----------------------------------------------------------------------------
# PATH Configuration
# -----------------------------------------------------------------------------
# Add all development tools to PATH
export PATH="$YARN_BIN:$JAVA_BIN:$HEROKU_HOME:$GRADLE_BIN:$PATH"

# -----------------------------------------------------------------------------
# Cloud Services Configuration
# -----------------------------------------------------------------------------
# AWS Configuration
export AWS_PROFILE='default'
# export AWS_PROFILE='step-titles-nonprod'
export AWS_REGION='ap-southeast-2'