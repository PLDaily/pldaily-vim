" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

" }

" Use plug config {

    " let g:pldaily_plug_groups = ['general', 'markdown', 'html', 'javascript', 'git', 'golang']
    let g:pldaily_plug_groups = ['general', 'markdown', 'html', 'javascript', 'golang', 'clojure']

    call plug#begin('~/.vim/plugged')

    " General {
        if count(g:pldaily_plug_groups, 'general')
            Plug 'scrooloose/nerdtree'
            Plug 'vim-airline/vim-airline'
            Plug 'arcticicestudio/nord-vim'
            Plug 'ryanoasis/vim-devicons'
            Plug 'Yggdroot/indentLine'
            Plug 'mbbill/undotree'
            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'mileszs/ack.vim'
            Plug 'scrooloose/nerdcommenter'
            Plug 'raimondi/delimitMate'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
        endif
    " }

    " Markdown {
        if count(g:pldaily_plug_groups, 'markdown')
            Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
            Plug 'hotoo/pangu.vim'
        endif
    " }

    " Html {
        if count(g:pldaily_plug_groups, 'html')
            Plug 'mattn/emmet-vim'
        endif
    " }

    " JavaScript {
        if count(g:pldaily_plug_groups, 'javascript')
            Plug 'elzr/vim-json'
            Plug 'leafgarland/typescript-vim'
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        endif
    " }

    " Git {
        if count(g:pldaily_plug_groups, 'git')
            Plug 'airblade/vim-gitgutter'
            Plug 'tpope/vim-fugitive'
            Plug 'junegunn/gv.vim'
        endif
    " }

    " GoLang {
        if count(g:pldaily_plug_groups, 'golang')
            Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
            Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
        endif
    " }

    " Clojure {
        if count(g:pldaily_plug_groups, 'clojure')
            Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
        endif
    " }

    call plug#end()

" }

" General {

    set background=dark         " Assume a dark background
    set guioptions-=r           " remove right-hand scroll bar
    set guioptions-=l           " remove left-hand scroll bar
    set guioptions-=L           " remove left-hand scroll bar even if there is a vertical split
    set guioptions-=b           " remove bottom scroll bar

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    set clipboard=unnamed

    " set foldmethod=syntax
    set history=1000                    " Store a ton of history (default is 20)
    set nospell                         " Spell checking off
    set hidden                          " Allow buffer switching without saving

" }

" Vim UI {

    set guifont=MesloLGLNerdFontComplete-Regular:h15

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set scrolloff=3                 " scroll when 3 line

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set relativenumber              " Line relative number on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing

" }

" Formatting {

    set wrap                        " Do wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current

    " autocmd BufNewFile,BufRead *.ts set filetype=typescript syntax=typescript
    " autocmd BufNewFile,BufRead *.tsx set filetype=typescript syntax=typescript
    " autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.tsx set syntax=typescript
    autocmd BufNewFile,BufRead *.mdx set filetype=mdx syntax=markdown
    autocmd FileType html,css,scss,less,javascript,typescript,json,typescriptreact,mdx setlocal tabstop=2 shiftwidth=2 softtabstop=2

" }

" Key (re)Mappings {

    " The default leader is ' '
    let mapleader = ' '

    " The default local leader is '_'
    let maplocalleader = '_'

    " editing the configuration
    let s:pldaily_edit_config_mapping = '<leader>ev'

    " editing and applying the spf13 configuration
    let s:pldaily_apply_config_mapping = '<leader>sv'

    " Easier moving in tabs and windows
    nmap <C-J> <C-W>j
    nmap <C-K> <C-W>k
    nmap <C-L> <C-W>l
    nmap <C-H> <C-W>h

    " Switch next buffer
    nmap <C-N> :bNext<CR>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk
    noremap J gj
    noremap K gk

    nnoremap Y y$

    " remove search highlight
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Some helpers to edit mode
    map <leader>ew :e %%
    map <leader>es :vsp %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" }

" Plugins {

    " Nord {
        if isdirectory(expand("~/.vim/plugged/nord-vim"))
            colorscheme nord
        endif
    " }

    " NerdTree {
        if isdirectory(expand("~/.vim/plugged/nerdtree"))
            map <C-e> :NERDTreeToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks = 1
            let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode = 0
            let NERDTreeQuitOnOpen = 0
            let NERDTreeMouseMode = 2
            let NERDTreeShowHidden = 1
            let NERDTreeKeepTreeInNewTab = 1
            let g:nerdtree_tabs_open_on_gui_startup = 0
        endif
    " }

    " Coc.nvim {
        if isdirectory(expand("~/.vim/plugged/coc.nvim"))
            " 使用 `<TAB>` 切换
            inoremap <silent><expr> <TAB>
                  \ pumvisible() ? "\<C-n>" :
                  \ <SID>check_back_space() ? "\<TAB>" :
                  \ coc#refresh()
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
            function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\s'
            endfunction

            " coc-prettier
            vmap <leader>f  <Plug>(coc-format-selected)
            nmap <leader>f  <Plug>(coc-format-selected)
            " Fix autofix problem of current line
            nmap <leader>qf  <Plug>(coc-fix-current)
        endif
    " }

     " CtrlP {
        if isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
            let g:ctrlp_working_path_mode = 'ra'
            let g:ctrlp_mruf_relative = 1
            nnoremap <Leader>b :CtrlPBuffer<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$|node_modules$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif

            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }
        endif
    " }

    " Nerdcommenter {
        if isdirectory(expand("~/.vim/plugged/nerdcommenter"))
            " Add spaces after comment delimiters by default
            let g:NERDSpaceDelims = 1
        endif
    " }

    " DelimitMate {
        if isdirectory(expand("~/.vim/plugged/delimitMate"))
            let g:delimitMate_expand_cr = 1
            let g:delimitMate_expand_space = 1
        endif
    " }

    " Ack {
        if isdirectory(expand("~/.vim/plugged/ack.vim"))
            if executable('ag')
                let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
            elseif executable('ack-grep')
                let g:ackprg = "ack-grep -H --nocolor --nogroup --column"
            endif
            nnoremap <Leader>a :Ack!<Space>
        endif
    " }

    " vim-airline {
        if isdirectory(expand("~/.vim/plugged/vim-airline"))
            let g:airline_powerline_fonts = 1
            let g:airline_theme = 'nord'
        endif
    " }

    " UndoTree {
        if isdirectory(expand("~/.vim/plugged/undotree"))
            if has("persistent_undo")
                set undodir=$HOME/.vimundo
                set undofile                " So is persistent undo ...
                set undolevels=1000         " Maximum number of changes that can be undone
                set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
            endif
            nnoremap <Leader>u :UndotreeToggle<CR>
            let g:undotree_SetFocusWhenToggle = 1
        endif
    " }

    " markdown-preview {
        if isdirectory(expand("~/.vim/plugged/markdown-preview.vim"))
            nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
            imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
            nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
            imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式
        endif
    " }

    " Fugitive {
        if isdirectory(expand("~/.vim/plugged/vim-fugitive"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
        endif
    " }

    " Gitgutter {
        if isdirectory(expand("~/.vim/plugged/vim-gitgutter"))
            nmap <leader>hn <Plug>(GitGutterNextHunk)
            nmap <leader>hp <Plug>(GitGutterPrevHunk)
            nmap <leader>hs <Plug>(GitGutterStageHunk)
            nmap <leader>hu <Plug>(GitGutterUndoHunk)
            nmap <leader>hv <Plug>(GitGutterPreviewHunk)
        endif
    " }

    " Gv {
        if isdirectory(expand("~/.vim/plugged/gv.vim"))
            nnoremap <silent> <leader>gv :GV<CR>
        endif
    " }

    " Emmet {
        if isdirectory(expand("~/.vim/plugged/emmet-vim"))
            " https://github.com/mattn/emmet-vim/blob/master/doc/emmet.txt
            " html:5 <c-y>, 生成 html5 骨架
            " <C-y>, 生成标签
            " <C-y>j 切换成自闭合标签
            let g:user_emmet_leader_key = '<C-Y>'
        endif
    " }

    " go {
        if isdirectory(expand("~/.vim/plugged/vim-go"))
            let g:go_highlight_functions = 1
            let g:go_version_warning = 0
            let g:go_highlight_methods = 1
            let g:go_highlight_structs = 1
            let g:go_highlight_operators = 1
            let g:go_highlight_build_constraints = 1
            let g:go_fmt_command = "goimports"
            let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
            let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
            au FileType go nmap <Leader>im <Plug>(go-imports)
            au FileType go nmap <leader>in <Plug>(go-install)
            au FileType go nmap <leader>gr <Plug>(go-run)
            au FileType go nmap <leader>gb <Plug>(go-build)
        endif
    " }

    " pangu {
        if isdirectory(expand("~/.vim/plugged/pangu.vim"))
            autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
        endif
    " }

    " IndentLine {
        if isdirectory(expand("~/.vim/plugged/indentLine"))
            let g:vim_json_syntax_conceal = 0
        endif
    " }

" }

" Functions {

    function! s:ExpandFilenameAndExecute(command, file)
        execute a:command . " " . expand(a:file, ":p")
    endfunction

    function! s:EditSpf13Config()
        call <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
    endfunction

    execute "noremap " . s:pldaily_edit_config_mapping " :call <SID>EditSpf13Config()<CR>"
    execute "noremap " . s:pldaily_apply_config_mapping . " :source ~/.vimrc<CR>"

" }

