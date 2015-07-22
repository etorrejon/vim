execute pathogen#infect()

" leader
let mapleader=","

" enable highlighting
syntax on

if has("gui_running")
    " color scheme: https://github.com/junegunn/seoul256.vim
    colo seoul256
    set background=dark

    " maximize the window
    set lines=999 columns=145

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

    " turn on filetype plugins
    filetype plugin indent on

    " disable backups
    set nobackup
    set nowb
    set noswapfile

    " NERDTree
    let NERDTreeShowHidden=1
    let g:NERDTreeWinSize=40

    " silver searcher
    if executable('ag')
        " Note we extract the column as well as the file and line number
        set grepprg=ag\ --nogroup\ --nocolor\ --column
        set grepformat=%f:%l:%c%m
    endif

    " bind \ (backward slash) to grep shortcut
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    " bind K to grep word under cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    nnoremap \ :Ag<SPACE>

    " folding is based on indent level
    set foldmethod=indent
    set foldlevelstart=20

    " syntastic: used in combination with jscs and jsxhint (install via npm -g)
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_enable_signs = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['jscs', 'jsxhint']
    let g:syntastic_javascript_jscs_config = ~/.jscsrc
endif

" file encoding
set fileencoding=utf-8
set encoding=utf-8

" spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
