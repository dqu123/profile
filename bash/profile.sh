export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# alias random-email='time >> ~/emails.log && echo "dqu+$(uuidgen | tr A-Z a-z | cut -c1-8)@email.com"| tee >(pbcopy) >> ~/emails.log'
alias last-email="tail ~/emails.log"
alias copy-last-cmd="fc -ln -1 | pbcopy"
alias go-coverage="go tool cover -func=go-coverage.out | tail -n1 | awk '{print $3}' | grep -Eo '[0-9.]+'"

source ~/github/dqu123/profile/bash/git.sh
source ~/github/dqu123/profile/bash/docker.sh
