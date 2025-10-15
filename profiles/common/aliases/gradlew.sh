# -----------------------------------------------------------------------------
# Gradle aliases and functions
# -----------------------------------------------------------------------------
# Assumes log_n_exec is defined in functions.sh

alias gcb='log_n_exec "./gradlew clean build -x:jibDockerBuild -x:test :spotlessApply"' # without docker
alias gcbd='log_n_exec "./gradlew clean build :spotlessApply"'
alias gt='log_n_exec "./gradlew test"'
alias gi='log_n_exec "./gradlew integrationTest"'
alias gb='log_n_exec "./gradlew build -x:jibDockerBuild -x:test"'
alias gsp='log_n_exec "./gradlew spotlessApply"'
alias gq='log_n_exec "./gradlew qualitychecks --console=plain"'
alias gcheck='log_n_exec "./gradlew qualityChecks --console=plain && ./gradlew spotlessApply"'