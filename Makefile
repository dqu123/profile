pull-local: pull-vimrc pull-tmux

pull-vimrc:
	cp ~/.vimrc .

pull-tmux:
	cp ~/.tmux.conf .

update: update-vimrc update-tmux

update-vimrc:
	cp .vimrc ~

update-tmux:
	cp .tmux.conf ~

fresh-install: update
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
