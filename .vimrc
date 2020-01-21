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

    let g:pldaily_plug_groups = [
                \   'general',
                \   'markdown',
                \   'html',
                \   'css',
                \   'javascript',
                \   'golang'
                \ ]
    let g:coc_global_extensions = [
                \   'coc-html',
                \   'coc-css',
                \   'coc-json',
                \   'coc-yank',
                \   'coc-tabnine',
                \   'coc-tslint-plugin',
                \   'coc-stylelint',
                \   'coc-git',
                \   'coc-marketplace',
                \   'coc-lists',
                \   'coc-vetur',
                \   'coc-eslint',
                \   'coc-prettier',
                \   'coc-tsserver'
                \ ]

    call plug#begin('~/.vim/plugged')

    " General { 
        if count(g:pldaily_plug_groups, 'general')
            Plug 'scrooloose/nerdtree'
            Plug 'vim-airline/vim-airline'
            Plug 'arcticicestudio/nord-vim'
            Plug 'ryanoasis/vim-devicons'
            Plug 'Yggdroot/indentLine'
            Plug 'mbbill/undotree'
            Plug 'scrooloose/nerdcommenter'
            Plug 'raimondi/delimitMate'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'easymotion/vim-easymotion'
            Plug 'psliwka/vim-smoothie'
            " Plug 'kshenoy/vim-signature'
            " Plug 'scrooloose/im-slumlord'
            " Plug 'aklt/plantuml-syntax'
        endif
    " }

    " Markdown {
        if count(g:pldaily_plug_groups, 'markdown')
            Plug 'hotoo/pangu.vim'
        endif
    " }

    " Html {
        if count(g:pldaily_plug_groups, 'html')
            Plug 'mattn/emmet-vim'
        endif
    " }

    " Css {
        if count(g:pldaily_plug_groups, 'css')
            Plug 'cakebaker/scss-syntax.vim'
        endif
    " }

    " JavaScript {
        if count(g:pldaily_plug_groups, 'javascript')
            Plug 'elzr/vim-json'
            Plug 'leafgarland/typescript-vim'
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            Plug 'posva/vim-vue'
            Plug 'isRuslan/vim-es6'
            Plug 'heavenshell/vim-jsdoc'
        endif
    " }

    " GoLang {
        if count(g:pldaily_plug_groups, 'golang')
            Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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

    set suffixesadd=.ts,.js,.tsx,.jsx,.json   "gf extensions
    set foldmethod=indent
    set nofoldenable
    set foldlevel=99
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

    autocmd BufNewFile,BufRead *.tsx set syntax=typescript
    autocmd BufNewFile,BufRead *.mdx set filetype=mdx syntax=markdown
    autocmd FileType html,css,scss,less,javascript,typescript,json,typescriptreact,vue,mdx,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" }

" Key (re)Mappings {

    " The default leader is ' '
    let mapleader = ' '

    " The default local leader is ','
    let maplocalleader = ','

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
    nmap <leader>bp :bp<CR>
    nmap <leader>bn :bn<CR>

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

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

" }

" Plugins {

    " Nord {
        if isdirectory(expand("~/.vim/plugged/nord-vim"))
            let g:nord_cursor_line_number_background = 1
            colorscheme nord
        endif
    " }

    " NerdTree {
        if isdirectory(expand("~/.vim/plugged/nerdtree"))
            map <C-e> :NERDTreeToggle<CR>
            map <localleader>e :NERDTreeFind<CR>

            let NERDTreeShowBookmarks = 1
            let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode = 0
            let NERDTreeQuitOnOpen = 0
            let NERDTreeMouseMode = 2
            let NERDTreeShowHidden = 1
            let NERDTreeKeepTreeInNewTab = 1
            let g:nerdtree_tabs_open_on_gui_startup = 0
            let NERDTreeDirArrowExpandable = "\u00a0"
            let NERDTreeDirArrowCollapsible = "\u00a0"
            let NERDTreeNodeDelimiter = "\x07"
        endif
    " }

    " Devicons {
        if isdirectory(expand("~/.vim/plugged/vim-devicons"))
            let g:DevIconsEnableFoldersOpenClose = 1
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
            vmap <leader>fp  <Plug>(coc-format-selected)
            nmap <leader>fp  <Plug>(coc-format-selected)

            " Remap keys for gotos
            nmap <silent> gd <Plug>(coc-definition)

            " Use K to show documentation in preview window
            nnoremap <silent> K :call <SID>show_documentation()<CR>
            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction

            " Use `:Format` to format current buffer
            command! -nargs=0 Format :call CocAction('format')

            " use `:OR` for organize import of current buffer
            command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

            " Using CocList
            " Resume latest coc list
            nnoremap <silent> <localleader>p  :<C-u>CocListResume<CR>

            " Keymapping for grep word under cursor with interactive mode
            nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

            nnoremap <silent> <Leader>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

            nnoremap <Leader>ll :CocList<CR>
            nnoremap <Leader>lb :CocList buffers<CR>
            nnoremap <Leader>lm :CocList mru<CR>
            nnoremap <Leader>lf :CocList files<CR>
            nnoremap <Leader>lg :CocList grep<CR>

            " Using coc-git
            " navigate chunks of current buffer
            nmap [g <Plug>(coc-git-prevchunk)
            nmap ]g <Plug>(coc-git-nextchunk)
            " show chunk diff at current position
            nmap gs <Plug>(coc-git-chunkinfo)
            " show commit contains current position
            nmap gc <Plug>(coc-git-commit)
            " create text object for git chunks
            omap ig <Plug>(coc-git-chunk-inner)
            xmap ig <Plug>(coc-git-chunk-inner)
            omap ag <Plug>(coc-git-chunk-outer)
            xmap ag <Plug>(coc-git-chunk-outer)
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

    " Airline {
        if isdirectory(expand("~/.vim/plugged/vim-airline"))
            let g:airline_powerline_fonts = 1
            let g:airline_theme = 'nord'
            let g:airline#extensions#coc#enabled = 1
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

    " Emmet {
        if isdirectory(expand("~/.vim/plugged/emmet-vim"))
            " https://github.com/mattn/emmet-vim/blob/master/doc/emmet.txt
            " html:5 <c-y>, 生成 html5 骨架
            " <C-y>, 生成标签
            " <C-y>j 切换成自闭合标签
            let g:user_emmet_leader_key = '<C-Y>'
        endif
    " }

    " Go {
        if isdirectory(expand("~/.vim/plugged/vim-go"))
            " build       compile packages and dependencies
            " install     compile and install packages and dependencies
            au FileType go nmap <leader>gi <Plug>(go-install)
            au FileType go nmap <leader>gr <Plug>(go-run)
        endif
    " }

    " Pangu {
        if isdirectory(expand("~/.vim/plugged/pangu.vim"))
            autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
        endif
    " }

    " IndentLine {
        if isdirectory(expand("~/.vim/plugged/indentLine"))
            let g:vim_json_syntax_conceal = 0
        endif
    " }

    " JsDoc {
        if isdirectory(expand("~/.vim/plugged/vim-jsdoc"))
            let g:jsdoc_enable_es6 = 1
            let g:jsdoc_return = 0
            nmap <silent> <leader>jd <Plug>(jsdoc)
        endif
    " }

    " Vue {
        if isdirectory(expand("~/.vim/plugged/vim-vue"))
            " vue 下 NERDCommenter 配置
            let g:ft = ''
            function! NERDCommenter_before()
                if &ft == 'vue'
                    let g:ft = 'vue'
                    let stack = synstack(line('.'), col('.'))
                    if len(stack) > 0
                        let syn = synIDattr((stack)[0], 'name')
                        if len(syn) > 0
                            exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
                        endif
                    endif
                endif
            endfunction
            function! NERDCommenter_after()
                if g:ft == 'vue'
                    setf vue
                    let g:ft = ''
                endif
            endfunction
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

