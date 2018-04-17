" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: snipmater.vim
" Last Modified: 2018-04-17 11:50:34
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
