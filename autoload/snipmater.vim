" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: snipmater.vim
" Last Modified: 2018-04-17 16:55:21
" Vim: enc=utf-8

" Function: commenter#InitVariable() function
" 初始化變數
" Ref: https://github.com/scrooloose/nerdcommenter/blob/master/plugin/NERD_commenter.vim#L26
" Args:
"   -var: the name of the var to be initialised
"   -value: the value to initialise var to
"
" Returns:
"   1 if the var is set, 0 otherwise
function! snipmater#InitVariable(var, value) abort
    if !exists(a:var)
        execute 'let ' . a:var . ' = ' . "'" . a:value . "'"
        return 1
    endif
    return 0
endfunction

" Function: snipmater#ShowInfo(str) function
" 印出字串用
"
" Args:
"   -str: 要印出的字串
function! snipmater#ShowInfo(str) abort
    if g:snipmater_show_info
        redraw
        echohl WarningMsg
        echo a:str
        echohl NONE
    endif
endfunction


" Function: snipmater#Eatchar(pat) function
" Ignore char c if c is one member of pat after abbr
function! snipmater#Eatchar(pat) abort
    let c = nr2char(getchar(0))
    return (c =~ a:pat)? '': c
endfunction


" Function: snipmater#SetUpFiletype(filetype) function
" Set up filetype.
" Args:
"   -filetype
function! snipmater#SetUpFiletype(filetype) abort
    let b:ft = a:filetype
    let l:snippet_config_file = b:snipmater_plug_path . "/../snippets/" . b:ft . ".config"
    call snipmater#MapAllAbbr(l:snippet_config_file)
endfunction


" Function: snipmater#MapAbbr
" Map abbreviate
" Args:
"   -abbr: original string need to be abbr
"   -str: the result want to become abbr
function! snipmater#MapAbbr(abbr, str) abort
    execute "inoreab <buffer> <silent> " . a:abbr . " " . a:str .
                \ " <C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>"
endfunction


" Function: snipmater#MapAllAbbr() function
" Read config file and abbr all items in the congfig file
function! snipmater#MapAllAbbr(config_file) abort
    let l:str = []
    for l:line in readfile(a:config_file)
        if l:line[0] ==# '^'
            let l:abbr = l:line[1:]
        elseif l:line[0] ==# '$'
            call snipmater#MapAbbr(l:abbr, join(l:str, "\<CR>"))
            let l:str = []
        else
            call add(l:str, l:line)
        endif
    endfor
endfunction
