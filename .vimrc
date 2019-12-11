" 编码设置 {{{
set nocompatible
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312
set fileencodings+=big5,euc-jp,euc-kr,latin1
set encoding=utf-8
let &termencoding=&encoding
" language messages zh_CN
language messages en_US
set synmaxcol=500
syntax on
"}}}

" 功能设置 {{{
if has('win32')
    set viminfo+=n$TEMP\\vim\\_viminfo
endif
set pyxversion=3
set ambiwidth=double
set backspace=indent,eol,start
set number " relativenumber
set ignorecase smartcase
set ruler
set showcmd
set incsearch
set hlsearch
set hidden
set sw=4 ts=4 et smarttab
set listchars=tab:?\ ,eol:?
set autoindent
set cindent
set pastetoggle=<F4>
set foldmethod=indent
set foldlevel=1
set foldlevelstart=99
set guitablabel=%t
set virtualedit=all
set wildcharm=<Tab> wildmenu
set showfulltag
set cpoptions+=ces$
set cinoptions+=:0,g0
set completeopt=menuone,longest
set pumheight=10
set formatoptions=croqn2mB1j
if has('win32')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif
set wildignore=tags,*.ico,*.sw?,*.jpg,*.png,*.gif,*.pdf
set wildignore+=*.o,*.obj,*.so,*.py[co],*.exe,*.dll,*.lib,*.a
set wildignore+=*.zip,*.rar,*.7z,*.gz,*.tar,__pycache__
let mapleader=','
"}}}
"
if bufname('%') == ''
  set bufhidden=wipe
endif

let $VIMFILES = has('win32') ? $VIM.'/vimfiles' : $HOME.'/.vim'
" 插件设置 {{{
exe 'so '.$VIMFILES.'/vimrc.bundle'
" }}}

" 界面设置 {{{
set shortmess=atcIO
if has('win32')
    set guifont=Monaco:h10:cANSI
    set guifontwide=微软雅黑:h10:cGB2312
endif

set guioptions-=m guioptions-=T guioptions-=r guioptions-=L
set statusline=[#%n]\ %<%t%y%m\ %{getcwd()}
set statusline+=%=\ <%{&ff}\,%{&fenc}\ lin:%l,%v\/%L>
set laststatus=2
colorscheme vem-dark
"}}}

" 自定义autocmd {{{
augroup Local
    au FileType qf setlocal nobuflisted bufhidden=hide
    au TerminalOpen * setlocal nobuflisted bufhidden=hide
    au FocusGained * if &diff | wincmd = | endif " git mergetool
    au InsertEnter,InsertLeave * set cul!
augroup END
"}}}

" The matchit plugin makes the % command work better, but it is not backwards
packadd! matchit

" 按键映射 {{{
nnoremap <S-Tab> :b <Tab>
nmap <S-Left> :bp<CR>
nmap <S-Right> :bn<CR>

nmap <silent> <C-w>- :new<CR>
nmap <silent> <C-w>\| :vnew<CR>

nmap <silent> gm :call cursor(0, len(getline('.'))/2)<CR>
nmap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <Leader>. :cd %:p:h<CR>
vnoremap Y "*y
nnoremap gp `[v`]
noremap Q <ESC>
noremap gQ <ESC>
xnoremap p pgvy
vnoremap <silent> . :normal .<CR>
"}}}

" 载入自定义配置 {{{
exe 'so '.$VIMFILES.'/vimrc.local'
"}}}
