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

# Copy current branch name to clipboard (Mac)
alias git-copy-branch="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"

# Revert file to version in master:
# git checkout origin/master [filename]
alias git-restore="git checkout origin/master "

## Language specific
alias git-profanity="git diff --cached | egrep '\.only|console\.log'"

## TODO: add command for ignore whitespace
#    git diff -w core/ server/jobs/postgres_db_lock_monitor.go | git apply --cached --ignore-whitespace

