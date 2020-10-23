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
            set shell=/bin/bash
        endif

        if exists('+termguicolors')
            set termguicolors
        endif
    " }

" }

" Use plug config {

    let g:pldaily_plug_groups = [
                \   'general',
                \   'markdown',
                \   'css',
                \   'javascript'
                \ ]

    let g:coc_global_extensions = [
                \   'coc-css',
                \   'coc-cssmodules',
                \   'coc-docthis',
                \   'coc-ecdict',
                \   'coc-emmet',
                \   'coc-eslint',
                \   'coc-git',
                \   'coc-highlight',
                \   'coc-html',
                \   'coc-imselect',
                \   'coc-java',
                \   'coc-json',
                \   'coc-lists',
                \   'coc-marketplace',
                \   'coc-picgo',
                \   'coc-prettier',
                \   'coc-smartf',
                \   'coc-snippets',
                \   'coc-style-helper',
                \   'coc-stylelintplus',
                \   'coc-tabnine',
                \   'coc-terminal',
                \   'coc-tslint-plugin',
                \   'coc-tsserver',
                \   'coc-vetur',
                \   'coc-yank'
                \ ]

    call plug#begin('~/.vim/plugged')

    " General {
        if count(g:pldaily_plug_groups, 'general')
            Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
            Plug 'kristijanhusak/defx-icons'
            Plug 'vim-airline/vim-airline'
            Plug 'arcticicestudio/nord-vim'
            Plug 'Yggdroot/indentLine'
            Plug 'mbbill/undotree'
            Plug 'scrooloose/nerdcommenter'
            Plug 'raimondi/delimitMate'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'psliwka/vim-smoothie'
            Plug 'mg979/vim-visual-multi'
            Plug 'itchyny/calendar.vim'
            Plug 'dhruvasagar/vim-zoom'
            Plug 'matze/vim-move'
            Plug 'mhinz/vim-startify'
        endif
    " }

    " Markdown {
        if count(g:pldaily_plug_groups, 'markdown')
            Plug 'hotoo/pangu.vim'
            Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
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
            Plug 'posva/vim-vue', { 'for': 'vue' }
            Plug 'pangloss/vim-javascript'
            Plug 'mxw/vim-jsx'
            Plug 'peitalin/vim-jsx-typescript'
        endif
    " }

    " GoLang {
        if count(g:pldaily_plug_groups, 'golang')
            Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
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

    set guioptions-=r               " remove right-hand scroll bar
    set guioptions-=l               " remove left-hand scroll bar
    set guioptions-=L               " remove left-hand scroll bar even if there is a vertical split
    set guioptions-=b               " remove bottom scroll bar

    set scrolloff=3                 " scroll when 3 line
    set cursorline                  " Highlight current line
    set number                      " Line numbers on
    set relativenumber              " Line relative number on
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present

" }

" Formatting {

    set wrap                        " Do wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 2 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every 2 columns
    set softtabstop=2               " Let backspace delete indent
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current

    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx syntax=typescript.tsx
    autocmd BufNewFile,BufRead *.ts set filetype=typescript syntax=typescript
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx syntax=javascript.jsx
    autocmd BufNewFile,BufRead *.js set filetype=javascript syntax=javascript
    autocmd BufNewFile,BufRead *.mdx set filetype=mdx syntax=markdown
    autocmd FileType go,vim,java setlocal tabstop=4 shiftwidth=4 softtabstop=4

" }

" Key (re)Mappings {

    " The default leader is ' '
    let mapleader = ' '

    " The default local leader is ','
    let maplocalleader = ','

    " editing the configuration
    let s:pldaily_edit_config_mapping = '<leader>ev'

    " editing and applying the pldaily configuration
    let s:pldaily_apply_config_mapping = '<leader>sv'

    " Easier moving in tabs and windows
    nmap <C-J> <C-W>j
    nmap <C-K> <C-W>k
    nmap <C-L> <C-W>l
    nmap <C-H> <C-W>h

    " Switch next buffer
    nmap [b :bp<CR>
    nmap ]b :bn<CR>

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

    " quick jump line begin and end
    noremap H ^
    noremap L $

    " change root dir
    nnoremap <leader>cd :cd %:p:h<CR>

" }

" Plugins {

    " Nord {
        if isdirectory(expand("~/.vim/plugged/nord-vim"))
            let g:nord_cursor_line_number_background = 1
            colorscheme nord
        endif
    " }

    " Defx {
        if isdirectory(expand("~/.vim/plugged/defx.nvim"))
            let g:defx_icons_enable_syntax_highlight = 1
            let g:defx_icons_column_length = 1
            call defx#custom#option('_', {
                        \ 'columns': 'space:indent:icons:filename:type',
                        \ 'winwidth': 30,
                        \ 'split': 'vertical',
                        \ 'direction': 'rightbelow',
                        \ 'ignored_files': '*.swp,.git,.svn,.DS_Store',
                        \ 'show_ignored_files': 0,
                        \ 'toggle': 1,
                        \ 'resume': 1
                        \ })

            nnoremap <silent> <C-e>
                        \ :<C-u>Defx -buffer-name=tab`tabpagenr()` `getcwd()`<CR>
            nnoremap <silent> <localleader>e
                        \ :<C-u>Defx -buffer-name=tab`tabpagenr()` -search=`expand('%:p')` `getcwd()`<CR>

            function! s:defx_mappings() abort
                nnoremap <silent><buffer><expr> o
                            \ defx#is_directory() ?
                            \ defx#do_action('open_tree') :
                            \ defx#do_action('drop')

                nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
                nnoremap <silent><buffer><expr> s defx#do_action('drop', 'vsplit')
                nnoremap <silent><buffer><expr> i defx#do_action('drop', 'split')
                nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')
                nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
                nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
                nnoremap <silent><buffer><expr> C defx#do_action('cd', defx#get_candidate().action__path)
                nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
                nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth - 10)
                nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth + 10)
                nnoremap <silent><buffer><expr> md defx#do_action('remove')
                nnoremap <silent><buffer><expr> mm defx#do_action('rename')
                nnoremap <silent><buffer><expr> ma defx#do_action('new_file')
                nnoremap <silent><buffer><expr> mr defx#do_action('execute_command', 'open .')
                nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
            endfunction

            " https://github.com/Shougo/defx.nvim/issues/175
            function! s:open_defx_if_directory()
                try
                    let l:full_path = expand(expand('%:p'))
                catch
                    return
                endtry

                if isdirectory(l:full_path)
                    execute "Defx -split=no -search=`expand('%:p')` | bd " . expand('%:r')
                endif
            endfunction

            autocmd FileType defx setlocal nonumber
            autocmd FileType defx setlocal norelativenumber
            autocmd FileType defx call s:defx_mappings()
            autocmd BufEnter * call s:open_defx_if_directory()
        endif
    " }

    " Coc.nvim {
        if isdirectory(expand("~/.vim/plugged/coc.nvim"))
            " TextEdit might fail if hidden is not set.
            set hidden

            " Some servers have issues with backup files, see #649.
            set nobackup
            set nowritebackup

            " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
            " delays and poor user experience.
            set updatetime=300

            " Don't pass messages to |ins-completion-menu|.
            set shortmess+=c

            " Always show the signcolumn, otherwise it would shift the text each time
            " diagnostics appear/become resolved.
            if has("patch-8.1.1564")
                " Recently vim can merge signcolumn and number column into one
                set signcolumn=number
            else
                set signcolumn=yes
            endif

            " using `<TAB>`
            inoremap <silent><expr> <TAB>
                        \ pumvisible() ? "\<C-n>" :
                        \ <SID>check_back_space() ? "\<TAB>" :
                        \ coc#refresh()
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
            function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\s'
            endfunction

            " Use <C-d>, <cr> to confirm completion
            inoremap <silent><expr> <C-d> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
            inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

            " coc-prettier
            " Formatting selected code.
            vmap <leader>fp  <Plug>(coc-format-selected)

            " Apply AutoFix to problem on the current line.
            nmap <leader>fq  <Plug>(coc-fix-current)

            " Remap keys for applying codeAction to the current buffer.
            nmap <leader>fs <Plug>(coc-codeaction-line)
            nmap <leader>fa <Plug>(coc-codeaction)

            " Applying codeAction to the selected region.
            " Example: `<leader>aap` for current paragraph
            xmap <leader>a  <Plug>(coc-codeaction-selected)
            nmap <leader>a  <Plug>(coc-codeaction-selected)

            " Symbol renaming.
            nmap <leader>rn <Plug>(coc-rename)

            " Function refactor.
            nmap <leader>rf <Plug>(coc-refactor)

            " Remap keys for gotos
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gj <Plug>(coc-float-jump)
            " use <C-\><C-n> exit terminal mode
            tnoremap <Esc> <C-\><C-n>
            nmap <silent> gt <Plug>(coc-terminal-toggle)

            " gd prevent preview
            let g:coc_enable_locationlist = 0
            autocmd User CocLocationsChange CocList --normal location

            " navigate diagnostics
            nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
            nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
            nmap <silent> ]d <Plug>(coc-diagnostic-next)
            nmap <silent> [d <Plug>(coc-diagnostic-prev)

            " Use K to show documentation in preview window
            nnoremap <silent> K :call <SID>show_documentation()<CR>
            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                elseif (coc#rpc#ready())
                    call CocActionAsync('doHover')
                else
                    execute '!' . &keywordprg . " " . expand('<cword>')
                endif
            endfunction

            " Use CTRL-S for selections ranges.
            nmap <silent> <C-s> <Plug>(coc-range-select)
            xmap <silent> <C-s> <Plug>(coc-range-select)

            " Use `:Format` to format current buffer
            command! -nargs=0 Format :call CocAction('format')

            " use `:OR` for organize import of current buffer
            command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

            " Using CocList
            " Resume latest coc list
            nnoremap <silent> <localleader>p  :<C-u>CocListResume<CR>

            " Keymapping for grep word under cursor with interactive mode
            nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

            nnoremap <silent> <Leader>w  :exe 'CocList -I --input='.expand('<cword>').' words'<CR>

            nnoremap <silent><nowait> <Leader>ll :<C-u>CocList<cr>
            nnoremap <silent><nowait> <Leader>lb :<C-u>CocList buffers<cr>
            nnoremap <silent><nowait> <Leader>lm :<C-u>CocList mru<cr>
            nnoremap <silent><nowait> <Leader>lf :<C-u>CocList files<cr>
            nnoremap <silent><nowait> <Leader>lg :<C-u>CocList grep<cr>
            nnoremap <silent><nowait> <Leader>lc :<C-u>CocList commands<cr>
            nnoremap <silent><nowait> <Leader>ld :<C-u>CocList diagnostics<cr>
            nnoremap <silent><nowait> <Leader>lo :<C-u>CocList outline<cr>
            nnoremap <silent><nowait> <Leader>le :<C-u>CocList extensions<cr>
            nnoremap <silent><nowait> <Leader>ls :<C-u>CocList symbols<cr>
            nnoremap <silent><nowait> <Leader>lw :<C-u>CocList words<cr>

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
            nnoremap <silent> <Leader>gs :<C-u>CocList gstatus<CR>

            " Using coc-smartf
            " press <esc> to cancel.
            nmap s <Plug>(coc-smartf-forward)
            nmap S <Plug>(coc-smartf-backward)

            augroup Smartf
                " :highlight Conceal show default Conceal color
                autocmd User SmartfEnter :hi Conceal ctermfg=1 guifg=#BF616A
                autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=Grey30
            augroup end

            " Using coc-highlight
            " Highlight the symbol and its references when holding the cursor.
            autocmd CursorHold * silent call CocActionAsync('highlight')
        endif
    " }

    " Nerdcommenter {
        if isdirectory(expand("~/.vim/plugged/nerdcommenter"))
            " Add spaces after comment delimiters by default
            let g:NERDSpaceDelims = 1
            let g:NERDCustomDelimiters = {
                        \   'typescript.tsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
                        \   'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
                        \ }
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
            let g:airline#extensions#coc#enabled = 1
            let g:airline#extensions#hunks#coc_git = 1
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
            " autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
            nnoremap <Leader>pg :Pangu<CR>
        endif
    " }

    " MarkdownPreview {
        if isdirectory(expand("~/.vim/plugged/markdown-preview.nvim"))
            let g:mkdp_open_to_the_world = 1
            nnoremap <Leader>mp :MarkdownPreview<CR>
        endif
    " }

    " IndentLine {
        if isdirectory(expand("~/.vim/plugged/indentLine"))
            let g:vim_json_syntax_conceal = 0
            let g:indentLine_fileTypeExclude = ['calendar', 'defx', 'startify']
            let g:indentLine_bufTypeExclude = ['help', 'terminal']
        endif
    " }

    " Vue {
        if isdirectory(expand("~/.vim/plugged/vim-vue"))
            " vue NERDCommenter config
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

    " Calendar {
        if isdirectory(expand("~/.vim/plugged/calendar.vim"))
            let g:calendar_task_delete = 1
            nnoremap :Ca :Calendar<CR>
        endif
    " }

    " Zoom {
        if isdirectory(expand("~/.vim/plugged/vim-zoom"))
            nmap <Leader>z <C-w>m
        endif
    " }

    " Startify {
        if isdirectory(expand("~/.vim/plugged/vim-startify"))
            let g:startify_lists = [
                        \ { 'type': 'dir', 'header': ['   MRU '. getcwd()] },
                        \ ]
            let g:startify_enable_special = 0
            let g:startify_change_to_vcs_root = 1
            let g:startify_custom_footer = ['   Powered by PLDaily']
        endif
    " }

" }

" Functions {

    function! s:ExpandFilenameAndExecute(command, file)
        execute a:command . " " . expand(a:file, ":p")
    endfunction

    function! s:EditPldailyConfig()
        call <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
    endfunction

    execute "noremap " . s:pldaily_edit_config_mapping " :call <SID>EditPldailyConfig()<CR>"
    execute "noremap " . s:pldaily_apply_config_mapping . " :source ~/.vim/.vimrc<CR>"

" }
