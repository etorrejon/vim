call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" support for Solarized: 
" https://github.com/altercation/vim-colors-solarized
syntax enable
if has( 'gui_running' )
	set background=light
else
	set background=dark
endif

colorscheme solarized

" set line numbers
set number

" tabs: each indentation level is four spaces and tabs are not used (popular with Java programmers)
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab

set fileencoding
set encoding=utf-8

set dir=~/tmp

let g:NERDTreeWinSize = 40

" automatically read when a file is changed by an external process
set autoread

" always show current position
set ruler

" show hidden files in NERDTree
let NERDTreeShowHidden=1
