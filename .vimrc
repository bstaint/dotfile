" 编码设置
set nocompatible
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312
set fileencodings+=big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding
set encoding=utf-8
language messages en_US
syntax on

execute pathogen#infect()
filetype plugin indent on

" 功能设置
set ambiwidth=double
set backspace=indent,eol,start
set number
set relativenumber
set ignorecase smartcase
set ruler
set showcmd
set autochdir
set incsearch
set hlsearch
set hidden
set sw=4 ts=4 et smarttab
set listchars=tab:?\ ,eol:?
set autoindent
set cindent
set foldmethod=indent
set foldlevel=1
set foldlevelstart=99
set guitablabel=%t
set virtualedit=all
set wildmenu
set showfulltag
set cpoptions+=ces$
set completeopt=menuone,longest
set pumheight=10
set formatoptions=croqn2mB1j
set wildignore=tags,*.git,*.svn,*.ico,*.swp
set wildignore+=*.o,*.obj,*.so,*.pyc,*.pyo
set wildignore+=*.jpg,*.png,*.gif,*.exe,*.dll
set wildignore+=*.pdf,*.zip,*.rar,*.7z,*.gz
let mapleader=','

" 界面设置
set shortmess=atI 
set guicursor=n-v-c:block-Cursor
set guioptions-=m guioptions-=T guioptions-=r guioptions-=L
set statusline=[#%n]\ %<%t%y%m\ %{getcwd()}
set statusline+=%=\ <%{&ff}\,%{&fenc}\ lin:%l,%v\/%L>
set laststatus=2
set guifont=DejaVu\ Sans\ Mono\ 11
set t_Co=256
colo wombat256mod

" 自定义命令组
augroup MyVim
    au InsertEnter,InsertLeave * set cul!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

function s:FasdFunc(cmd, words)
    if a:cmd == 'e'
        let ret = system('fasd -f ' . a:words)
        exec ':e ' . ret
    elseif a:cmd == 'cd'
        let ret = system('fasd -d ' . a:words)
        exec ':cd ' . ret
    endif
endfunction

function! FasdCompletionF(ArgLead, CmdLine, CursorPos)
    let ret = ""
    let argList = split(a:CmdLine)
    if len(argList) == 1
    " This is the first argument so nothing special here
    elseif len(argList) == 2 && a:CmdLine[-1:] != ' '
        if argList[0] == 'E'
            let ret = system('fasd -fl '. argList[1])
        elseif argList[0] == 'C'
            let ret = system('fasd -dl '. argList[1])
        endif
        return split(ret, '\n')
    endif
endfunction

command! -nargs=1 -complete=customlist,FasdCompletionF E call s:FasdFunc('e', <f-args>)
command! -nargs=1 -complete=customlist,FasdCompletionF C call s:FasdFunc('cd', <f-args>)

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" 按键映射
nmap <F5> :set ff=unix fenc=utf-8<CR>
nmap <F6> :setlocal autochdir!<CR>
nmap <C-Left> :tabp<CR>
nmap <C-Right> :tabn<CR>
nmap <S-Left> :bp<CR>
nmap <S-Right> :bn<CR>
noremap Q <ESC>
noremap gQ <ESC>
xnoremap p pgvy
nnoremap <silent> <C-l> :nohl<CR><C-l>
vnoremap . :normal .<CR>
nmap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" 避免xptemplate失去焦点就无法跳出
inoremap <expr> <Tab> search('\%#[]>)}''"]', 'n') ? '<Right>' : '<Tab>'
