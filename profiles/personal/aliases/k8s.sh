alias kns='kubectl config set-context --current --namespace '
alias k=kubectl
alias ka="kubectl apply -f"

# delete resources immediately
alias kD="kubectl delete --grace-period=0 --force"

# delete resources immediately from file
alias kDf="kubectl delete --grace-period=0 --force -f"

# In the following, $1 is the filepath of a yaml k8s object.

# vim apply. edit a file and immediately apply it.
va() {
  vim $1
  ka $1
}

# kubectl edit. Delete the resource of a file, edit and apply it.
ke() {
  kDf $1
  va $1
}

# kubectl replace. Delete and recreate the same resource.
kr() {
  kDf $1
  ka $1
}

# enable autocompletion
source <(kubectl completion bash)