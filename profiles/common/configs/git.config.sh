#################################### Git User identity
# git config --global user.name "Mansour"
# git config --global user.email "info@mansour.co.nz"

#################################### Push/Pull behavior
# git config --global push.autoSetupRemote true
# git config --global push.default simple
# git config --global pull.rebase true
# git config --global rebase.autoStash true

#################################### Core settings
# git config --global core.autocrlf input
# git config --global core.ignorecase false
# git config --global core.precomposeUnicode true
# git config --global core.quotepath false

#################################### Diff and merge tools
# git config --global diff.tool vscode
# git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
# git config --global merge.tool vscode
# git config --global mergetool.vscode.cmd 'code --wait $MERGED'
# git config --global mergetool.keepBackup false

#################################### Branch settings
# git config --global branch.autosetupmerge always
# git config --global branch.autosetuprebase always

#################################### Status and log formatting
# git config --global status.showUntrackedFiles all
# git config --global log.abbrevCommit true
# git config --global log.decorate short

#################################### Helpful aliases
# git config --global alias.st status
# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.cm commit
# git config --global alias.lg "log --oneline --graph --decorate --all"
# git config --global alias.ll "log --oneline --graph --decorate"
# git config --global alias.unstage "reset HEAD --"
# git config --global alias.last "log -1 HEAD"
# git config --global alias.visual "!gitk"
# git config --global alias.amend "commit --amend --no-edit"
# git config --global alias.please "push --force-with-lease"
# git config --global alias.commend "commit --amend --no-edit"
# git config --global alias.it "!git init && git commit -m 'root' --allow-empty"
# git config --global alias.stash-all "stash save --include-untracked"
# git config --global alias.glog "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

#################################### Clean up settings
# git config --global fetch.prune true
# git config --global remote.origin.prune true

#################################### Security and performance
# git config --global transfer.fsckobjects true
# git config --global fetch.fsckobjects true
# git config --global receive.fsckObjects true
# git config --global rerere.enabled true

#################################### Color output
# git config --global color.ui auto
# git config --global color.branch auto
# git config --global color.diff auto
# git config --global color.status auto

#################################### Whitespace handling
# git config --global core.whitespace trailing-space,space-before-tab
# git config --global apply.whitespace fix

success "Git global configuration applied."