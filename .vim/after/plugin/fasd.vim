function! s:FasdFunc(cmd, words)
    let ret = ''
    if a:cmd == 'e'
        let ret = system('fasd -f ' . a:words)
    elseif a:cmd == 'cd'
        let ret = system('fasd -d ' . a:words)
    endif

    if len(ret) > 0
        exec printf(':%s %s', a:cmd, ret)
    endif
endfunction

function! FasdCompletion(ArgLead, CmdLine, CursorPos)
    let ret = ''
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

command! -nargs=1 -complete=customlist,FasdCompletion E call s:FasdFunc('e', <f-args>)
command! -nargs=1 -complete=customlist,FasdCompletion C call s:FasdFunc('cd', <f-args>)
