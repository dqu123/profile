export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
# alias random-email='time >> ~/emails.log && echo "dqu+$(uuidgen | tr A-Z a-z | cut -c1-8)@email.com"| tee >(pbcopy) >> ~/emails.log'
alias last-email="tail ~/emails.log"
alias copy-last-cmd="fc -ln -1 | xsel --clipboard"

source ./git.sh
source ./docker.sh
