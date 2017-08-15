" Maintainer:	David Qu
" Last change:	2017 February 21
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'mxw/vim-jsx'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" vim-go
let g:go_fmt_experimental = 1

"NERDTreeTabs"
let g:nerdtree_tabs_open_on_console_startup=1

"NERDTree"
let g:NERDTreeWinSize = 30

"ctrlp
let g:ctrlp_max_files=20000
let g:ctrlp_custom_ignore='.git$|\tmp$'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
nnoremap ,m :CtrlPTag<cr>

" EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepFilesToExclude=".svn,.git,node_modules"

"Tagbar"
let g:tagbar_width = 30

"Gundo"
let g:gundo_width = 20
let g:gundo_preview_bottom = 1
let g:gundo_preview_height = 10

"Syntastic"
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=5

"vim-airline theme"
let g:airline_theme='dark'

"YouCompleteMe"
"let g:ycm_autoclose_preview_window_after_completion = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
endif

" ==== Custom navigation ====
"
" " Control-L is escape.
 nmap <C-L> <ESC>
 imap <C-L> <ESC>
"
" " Navigating tabs and windows.
 nmap <C-J> :tabprevious<CR>
 nmap <C-K> :tabnext<CR>
"
"

" Puts line numbers for reference
" Colors them grey.
set number
highlight LineNr ctermfg=grey

" Always show line numbers, but only in current window.
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4           " size of a hard tabstop
set shiftwidth=2        " size of an indent
set autoindent
set softtabstop=4
set smarttab
set expandtab

" ctags
set tags=./tags,tags;
map <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Go tab width
autocmd FileType go setlocal shiftwidth=4

" TABs in Makefiles
autocmd FileType make set noexpandtab

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Open NERDTree automatically"
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " Change focus to file"
  autocmd VimEnter * wincmd p

  " Open TagBar automatically"
  " autocmd VimEnter * nested :call tagbar#autoopen(1) 

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  " Remove trailing spaces
  autocmd BufWritePre * execute ':silent! %s/\s\+$//g'

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Fold
set foldmethod=syntax

" Color
set t_Co=256
"let g:solarized_termcolors=256
"set background=dark
colorscheme desert

"Keys"
nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>
let mapleader=","
