pull-local:
	cp ~/.vimrc .; cp ~/.tmux.conf .

update:
	cp .vimrc ~; cp .tmux.conf .

.PHONY: pull-local update
