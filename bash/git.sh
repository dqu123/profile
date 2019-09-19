#!/bin/bash
alias gb="git branch --sort=-committerdate --color=always | head -n 8"
alias gs="git status"
alias gch="git checkout"
alias gcm="git commit"
alias pull="git pull"
alias push="git push"
alias ga="git add"
alias gd="git diff"

# git tips and tricks

# Revert file to version in master:
# git checkout origin/master [filename]
alias git-restore="git checkout origin/master "

