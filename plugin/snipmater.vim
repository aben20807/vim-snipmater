" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: snipmater.vim
" Last Modified: 2018-04-17 16:17:15
" Vim: enc=utf-8

if exists("has_loaded_snipmater")
    finish
endif
if v:version < 700
    echoerr "Snipmater: this plugin requires vim >= 7."
    finish
endif
let has_loaded_snipmater = 1
" Get plug absolute path
" Ref: https://stackoverflow.com/a/18734557/6734174
let b:snipmater_plug_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

augroup comment
    autocmd BufEnter,BufRead,BufNewFile * call snipmater#SetUpFiletype(&filetype)
augroup END

call snipmater#InitVariable("g:snipmater_use_default_mapping",  1)
call snipmater#InitVariable("g:snipmater_show_info",            1)

function! Ffor()
    call snipmater#Eatchar('\m\s\<bar>\r')
    execute "put=readfile(b:snippet)[1:2]"
    " return b:snipmater_plug_path
endfunction


" Section: key map設定
function! s:SetUpKeyMap()
    " execute("inoreab <buffer> <silent> _for <C-R>=Ffor()<CR>")
endfunction


if g:snipmater_use_default_mapping
    call s:SetUpKeyMap()
endif
