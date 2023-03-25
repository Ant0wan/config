# .bashrc

function clean_tf_ws() {
	unset TF_WORKSPACE
	terraform workspace select default
	workspaces=($(terraform workspace list| cut -c3- |grep -v default))
	for ws in ${workspaces[@]}
	do
		echo "Checking:  $ws"
		if ! TF_WORKSPACE=$ws terraform state list
		then
			TF_WORKSPACE=default terraform workspace delete $ws
		fi
	done
}

complete -d -f -C ~/.terraform.versions/terraform_1.2.4 terraform

alias t='terraform'
alias tf='tf-autoplan'
alias tfi='tf-autoplan --mode interactive apply .'
alias tfid='tf-autoplan --mode interactive destroy .'
alias tfip='tf-autoplan --mode interactive plan .'
alias tflock='terraform providers lock -platform=linux_amd64 -platform=linux_arm64 -platform=darwin_amd64 -platform=windows_amd64 -platform=darwin_arm64'
alias tg='terraform graph  -draw-cycles -type=apply'
alias ti='terraform init'
alias tv='terraform validate'
alias twl='terraform workspace list'
alias tws='terraform workspace select'
alias fmt='terraform fmt -recursive'

function tf_fmt_ending_eol() {
    for var in "$@"
    do
        if [[ -s "$var" ]]; then
            if [[ -n "$(tail -c 1 "$var")" ]]; then
               gsed -i -e '$a\' $var
            fi
        fi
    done
}

function tfcheck() {
    terraform validate
    terraform fmt -recursive
    tf_fmt_ending_eol *tf
    tflint --format=compact .
}
