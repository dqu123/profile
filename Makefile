pull-local: pull-vimrc pull-tmux

pull-vimrc:
	cp ~/.vimrc .

pull-tmux:
	cp ~/.tmux.conf .

update: update-vimrc update-tmux

update-vimrc:
	cp ~/.vimrc ~/.vimrc.bak
	cp .vimrc ~

update-tmux:
	cp ~/.tmux.conf ~/.tmux.conf.bak
	cp .tmux.conf ~

fresh-install: update
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


## TODO: Add command to manage .bash_profile
# Profile
#source "$HOME/profile/bash/git.sh"
#source "$HOME/profile/bash/npm.sh"
#source "$HOME/profile/bash/xml.sh"
