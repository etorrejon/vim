execute pathogen#infect()

" enable highlighting
syntax on

" color scheme: https://github.com/junegunn/seoul256.vim
colo seoul256
set background=dark

if has("gui_running")
    " maximize the window
    set lines=999 columns=999
endif

" turn on filetype plugins
filetype plugin indent on

" automatically reload a file if it's changed externally
set autoread

" always show current position
set ruler

" line numbers on by default
set number

" relative line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" file encoding
set fileencoding
set encoding=utf-8

" disable backups
set nobackup
set nowb
set noswapfile

" spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
