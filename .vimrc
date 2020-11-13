" 编码设置 {{{
set nocompatible
if &modifiable
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312
    set fileencodings+=big5,euc-jp,euc-kr,latin1
endif
set encoding=utf-8
let &termencoding=&encoding
" language messages zh_CN
language messages en_US
set synmaxcol=500
syntax on
"}}}

" 功能设置 {{{
let $VIMFILES = has('win32') ? $VIM.'/vimfiles' : $HOME.'/.vim'
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
set autoread
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
set sessionoptions-=options
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif
set wildignore=tags,*.ico,*.sw?,*.jpg,*.png,*.gif,*.pdf
set wildignore+=*.o,*.obj,*.so,*.py[co],*.exe,*.dll,*.lib,*.a
set wildignore+=*.zip,*.rar,*.7z,*.gz,*.tar,__pycache__
let mapleader=','
if bufname('%') == ''
    set bufhidden=wipe
endif
"}}}

" 插件设置 {{{
exe 'so '.$VIMFILES.'/vimrc.bundle'
" }}}

" 界面设置 {{{
set shortmess=atcIO
set guioptions-=m guioptions-=T guioptions-=r guioptions-=L
if has('win32')
    set guifont=Monaco:h11:cANSI
    set guifontwide=微软雅黑:h11:cGB2312
    set renderoptions=type:directx
endif

let s:currentmode={
      \ 'v'  : 'visual',
      \ 'V'  : 'visuall',
      \ ''  : 'visualb',
      \ 'i'  : 'insert',
      \}
set statusline=%!StatusLine()
function! StatusLine()
    let statusline = '%#VemStatusLineBranch# %n %#CursorColumn# %t %y%m %{getcwd()}%= '
    if &buftype ==# ''
        let mode = get(s:currentmode, mode(), '')
        if mode !=# ''
            let statusline .= '%#VemStatusLineMode# '.mode
            let statusline .= (&paste == 1) ? ' (paste)' : ''
        endif
        let statusline .= '%#VemStatusLineBranch# %{&fenc}/%{&ff} %p%% %l:%v '
    endif
    return statusline
endfunction
set laststatus=2
colorscheme vem-dark
"}}}

" 自定义设置 {{{
" The matchit plugin makes the % command work better, but it is not backwards
packadd! matchit
exe 'so '.$VIMFILES.'/vimrc.local'
"}}}
" vim:foldmethod=marker:
