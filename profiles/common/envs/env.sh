# Make vim the default editor.
export EDITOR='vim'

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768'

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy'

# export JAVA_HOME='/c/Program Files/Amazon Corretto/jdk19.0.2_7'
export JAVA_HOME='/c/Program Files/Eclipse Adoptium/jdk-21.0.6.7-hotspot'
export JAVA_BIN='/c/Program Files/Eclipse Adoptium/jdk-21.0.6.7-hotspot/bin'

# unix style path
# export YARN_BIN='C:\Users\019628\AppData\Local\Yarn\bin'
export YARN_BIN='/c/Users/019628/AppData/Local/Yarn/bin'

export HEROKU_HOME='/c/Program Files/heroku/bin'

export PATH="$YARN_BIN:$JAVA_BIN:$HEROKU_HOME:$PATH";

# Setting NVIM home folders
export XDG_DATA_HOME="~/.dotfiles"
export XDG_CONF_HOME="~/.dotfiles"

##########################################
############ AWS 
##########################################
export AWS_PROFILE='default'
export AWS_REGION='ap-southeast-2'

