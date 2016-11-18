set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'luochen1990/rainbow'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'itchyny/calendar.vim'

call vundle#end()
filetype plugin indent on
filetype plugin on

" Allow to tigger background
function! ToggleBG()
  let s:tbg = &background
  if s:tbg == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction
nnoremap <F11> :call ToggleBG()<CR>


syntax on
set mouse=a
set mousehide

set enc=utf-8
set fencs=utf-8,gb2312,gbk,gb18030


if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif


set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1024
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-


set backup
set backupdir=~/.vim/backup
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
  set undodir=~/.vim/undo
endif

" Vim UI
set t_ut=
set t_u7=
autocmd ColorScheme * hi Normal ctermbg=none
colorscheme zenburn
if has('gui_running')
  set go=
  set guifont=monaco:h12
endif


set tabpagemax=15
set showmode

set cursorline

highlight clear SignColumn
highlight clear LineNr

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
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set mat=2
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set cmdheight=1
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
" set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set foldmethod=syntax
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set encoding=utf-8
set ffs=unix,dos,mac
set nowb
set noswapfile

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Formatting
set wrap
set ai                          " Indent at the same level of the previous line
set si
set ci
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set smarttab
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>

"map leader
let mapleader = ","
let g:mapleader = ","


map <silent> <leader>n :noh<cr>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>
" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

nnoremap <space> za


"Ycm
let g:acp_enableAtStartup = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['+', '~']
let g:tagbar_width = 25
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }
let g:tagbar_type_haskell = {
   \ 'ctagsbin'  : 'hasktags',
   \ 'ctagsargs' : '-x -c -o-',
   \ 'kinds'     : [
       \  'm:modules:0:1',
       \  'd:data: 0:1',
       \  'd_gadt: data gadt:0:1',
       \  't:type names:0:1',
       \  'nt:new types:0:1',
       \  'c:classes:0:1',
       \  'cons:constructors:1:1',
       \  'c_gadt:constructor gadt:1:1',
       \  'c_a:constructor accessors:1:1',
       \  'ft:function types:1:1',
       \  'fi:function implementations:0:1',
       \  'o:others:0:1'
   \ ],
   \ 'sro'        : '.',
   \ 'kind2scope' : {
       \ 'm' : 'module',
       \ 'c' : 'class',
       \ 'd' : 'data',
       \ 't' : 'type'
   \ },
   \ 'scope2kind' : {
       \ 'module' : 'm',
       \ 'class'  : 'c',
       \ 'data'   : 'd',
       \ 'type'   : 't'
   \ }
\ }

"nerdtree
nmap <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeDirArrows = 1
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '~'
let NERDTreeWinSize = 25
let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

"nerdcommenter
let g:NERDSpaceDelims = 1

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

"Undotree
nnoremap <F10> :UndotreeToggle<CR>
let g:undotree_SetFoucsWhenToggle=1
let g:undotree_SplitWidth = 32

"vimShell
" Use current directory as vimshell prompt.
au BufNewFile,BufRead *.rb map <leader>t  :VimShellInteractive --split='split \| resize 10' irb<CR>
let g:vimshell_prompt_expr =
      \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>c :tabclose<CR>
"let g:airline_left_sep='>'
"let g:airline_right_sep='<'

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" ag
let g:ag_working_path_mode="r"

"vim-multiple-cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"rainbow
let g:rainbow_active = 1

"putty
if &term =~"xterm-256color"
   "<t_co> color --
    let &t_Co=256
    if has("terminfo")
       let &t_Sf="\ESC[3%p1%dm"
       let &t_Sb="\ESC[4%p1%dm"
    else
       let &t_Sf="\ESC[3%dm"
       let &t_Sb="\ESC[4%dm"
    endif
endif

" function
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

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
