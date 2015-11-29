execute pathogen#infect()

" file encoding {
    set fileencoding=utf-8
    set encoding=utf-8
" }

" tabs {
    set shiftwidth=4
    set tabstop=4
    set expandtab
" }

if has("gui_running")

    " jscs goodness {
        function! JscsFix()
            " save current cursor position
            let l:winview = winsaveview()
            " pipe the current buffer (%) through the jscs -x command
            % ! jscs -x
            " restore cursor position
            call winrestview(l:winview)
        endfunc

        command JscsFix :call JscsFix()

        "Run the JscsFix command just before the buffer is written for *.js files"
        " autocmd BufWritePre *.js JscsFix
    " }

    " format JSON {
        noremap <Leader>JSON :%s !python -m json.tool
    " }

    " Find merge conflict markers {
        map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR> 
    " }

    " line numbers {
        set number
        set relativenumber

        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber
            else
                set relativenumber
            endif
        endfunc

        nnoremap <C-n> :call NumberToggle()<cr>
    " }

    " highlight search matches {
        set hlsearch
    " }

    " color scheme {
        syntax enable
        colorscheme seoul256 
    " }

    " window options {
        set lines=999 columns=145
        set guioptions-=r
        set guioptions-=l
        set guioptions-=R
        set guioptions-=L
        set ruler
        set guifont=Hack:h12
        set nowrap
    " }

    " automatically reload a file if it's changed externally {
        set autoread
    " }

    " filetypes {
        filetype plugin indent on
    " }

    " disable backups {
        set nobackup
        set nowb
        set noswapfile
    " }

    " NERDTree {
        let NERDTreeShowHidden=1
        let g:NERDTreeWinSize=36
        nmap <silent> <C-\> :NERDTreeToggle<CR>
    " }

    " silver searcher {
        if executable('ag')
            " Note we extract the column as well as the file and line number
            set grepprg=ag\ --nogroup\ --nocolor\ --column
            set grepformat=%f:%l:%c%m
        endif
    " }

    " bind \ (backward slash) to grep shortcut {
        command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    " }

    " bind K to grep word under cursor {
        nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
        nnoremap \ :Ag<SPACE>
    " }

    " folding is based on indent level {
        set foldmethod=indent
        set foldlevelstart=0

        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>

        nnoremap <space> za
    " }

    " status line ( vim-airline ) {
        set laststatus=2
        let g:airline_theme='zenburn'
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#syntastic#enabled = 1
    " }

    " syntastic: used in combination with jscs and jsxhint (install via npm -g) {
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_javascript_checkers = ['jscs']
        let g:syntastic_javascript_jscs_config = ~/.jscsrc
    " }

endif
