let g:python_host_skip_check = 1
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_skip_check = 1
let g:python3_host_prog='/usr/bin/python3'
let g:python3_host_provider=1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set nocompatible
filetype off

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Rip-Rip/clang_complete', { 'for': [ 'c', 'cpp' ] }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'w0rp/ale', { 'on': 'ALEToggle' }
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion-overwin-w)' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/fcitx.vim'
Plug 'dag/vim-fish'
call plug#end()
filetype plugin indent on
filetype plugin on

syntax on
set mouse=a
set mousehide

set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030

set clipboard=unnamedplus

set shortmess+=filmnrxoOtTc
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1024
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

set backup
set backupdir=$HOME/.config/nvim/backup
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
    set undodir=$HOME/.config/nvim/undo
endif

set tabpagemax=15
set showmode
if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

set laststatus=2

set autoread
set so=7
set lazyredraw
set magic
set backspace=eol,start,indent  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
" set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set mat=2
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set cmdheight=1
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set wildmenu                    " Show list instead of just completing
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set nofoldenable                  " Auto fold code
set foldcolumn=0
nnoremap <space> za

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set encoding=utf-8
set ffs=unix,dos,mac
set nowb
set noswapfile

set noerrorbells
set novisualbell
set tm=500

set lbr
set tw=500

" Formatting
set wrap
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set ai                          " Indent at the same level of the previous line
set si
set ci

set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set smarttab
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"map leader
let mapleader = ","
let g:mapleader = ","

map <silent> <leader><cr> :noh<cr>
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
map <leader>pp :setlocal paste!<cr>
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" For when you forget to sudo.. Really Write the file.
cmap W! w !sudo tee % >/dev/null

" == c-family ==
autocmd FileType c,cpp setlocal foldmethod=syntax
set cino+=g0
let g:clang_library_path='/usr/lib/libclang.so.4.0'

" == python
autocmd FileType python setlocal foldmethod=indent

" == markdown ==
set conceallevel=2

" == haskell ==
" color
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
" indent
let g:haskell_backpack = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 0
let g:haskell_indent_guard = 4
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Vim UI
color janah
set cursorline
hi CursorLine cterm=none ctermbg=lightgray ctermfg=none

"Complete
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000
let g:deoplete#sources = {}
let g:deoplete#sources._ = [ 'around', 'file']
let g:deoplete#sources.haskell = [ 'around', 'file', 'ghc' ]
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"ale
" let g:ale_sign_column_always = 1
let g:ale_linters = {
            \   'cpp': ['clang'],
            \}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
nmap <F7> :ALEToggle<CR>
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
let g:ale_statusline_format = ['E: %d', 'W: %d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

"tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_width = 32

"nerdtree
nmap <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeMapOpenInTab='t'
let NERDTreeWinSize = 25
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen=1

"nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Fugitive
noremap <silent> <leader>gs :Gstatus<CR>
noremap <silent> <leader>gd :Gdiff<CR>
noremap <silent> <leader>gc :Gcommit<CR>
noremap <silent> <leader>gb :Gblame<CR>
noremap <silent> <leader>gl :Glog<CR>
noremap <silent> <leader>gp :Git push<CR>
noremap <silent> <leader>gr :Gread<CR>
noremap <silent> <leader>gw :Gwrite<CR>
noremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
noremap <silent> <leader>gi :Git add -p %<CR>
noremap <silent> <leader>gg :SignifyToggle<CR>

" Gundo
nnoremap <F10> :GundoToggle<CR>
let g:gundo_width = 32
let g:gundo_preview_height = 10
let g:gundo_right = 0
let g:gundo_prefer_python3 = 1

" lightline
nmap <A-Insert> :tabnew<CR>
nmap <A-Delete> :tabclose<CR>
nmap <A-1> 1gt
nmap <A-2> 2gt
nmap <A-3> 3gt
nmap <A-4> 4gt
nmap <A-5> 5gt
nmap <A-6> 6gt
nmap <A-7> 7gt
nmap <A-8> 8gt
nmap <A-9> 9gt
nmap <A-0> 10gt
imap <A-1> <ESC>1gt
imap <A-2> <ESC>2gt
imap <A-3> <ESC>3gt
imap <A-4> <ESC>4gt
imap <A-5> <ESC>5gt
imap <A-6> <ESC>6gt
imap <A-7> <ESC>7gt
imap <A-8> <ESC>8gt
imap <A-9> <ESC>9gt
imap <A-0> <ESC>10gt
let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'ale' ], ['ctrlpmark'] ],
            \   'right': [ ['lineinfo'], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightlineFugitive',
            \   'filename': 'LightlineFilename',
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'fileencoding': 'LightlineFileencoding',
            \   'mode': 'LightlineMode',
            \   'ctrlpmark': 'CtrlPMark',
            \   'ale': 'ALEGetStatusLine',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '┆', 'right': '┆' },
            \ }

function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let branch = fugitive#head()
            return winwidth(0) > 70 ? (branch !=# '' ? mark.branch : '') : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 40 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Ctrlp
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
    let g:ctrlp_use_caching = 1
endif

" ag
let g:ag_prg = "ag --vimgrep --smart-case -U"
let g:ag_working_path_mode = "r"
let g:ag_highkight = 1
let g:ag_mapping_message = 0
nmap <A-f> :Ag<space>

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
            \ 'ctermfgs': ['27', '220', '87', '105'],
            \}

" indentline
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd FileType c,cpp,vim,makefile,lex,yacc autocmd BufWritePre <buffer> call StripTrailingWhitespace()
