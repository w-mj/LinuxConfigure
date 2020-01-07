" 在创建特定类型的文件时自动为其加入一部分内容

autocmd BufNewFile *.sh call HEADER_SHELL()

function! HEADER_SHELL()
	call setline(1, "\#!/bin/bash")
	call setline(2, "")
	call setline(3, "")
	normal G
endfunction


autocmd BufNewFile *.h call HEADER_H()

function! HEADER_H()
	call setline(1, "#progma once")
	call setline(2, "")
	normal G
endfunction

" autocmd BufNewFile *.md call HEADER_MARKDOWN()
" 
" function! HEADER_MARKDOWN()
" 	call setline(1, "[TOC]")
" 	call setline(2, "")
" 	call setline(3, "# ")
" 	normal GA
" endfunction

