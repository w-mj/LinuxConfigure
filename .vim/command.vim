" 查看当前光标下时间戳所代表的时间
function! A_Timestamp()
	let timestamp = expand("<cword>")
	exec "!date -d @" . timestamp
endfunction
command! LUWHtimestamp call A_Timestamp()

function! A_showDisplayableHexNum()
	let numh = expand("<cword>")
	let num = str2nr(numh, 16)
	let lst = " KMGTT"
	let i = 0
	while num > 1024
		if i > 4
			break
		endif
		let	num /= 1024
		let	i += 1
	endwhile
	echo printf("%f%c\n", num, strgetchar(lst, i))
endfunction
nmap <leader>o :call A_showDisplayableHexNum() <cr>

" 执行项目
" 从当前目录向上找，直到找到一个包含.git/的目录，认为是项目跟目录
" 在根目录中执行make run
function! A_Run()
	let cwd = getcwd()
	let par = cwd
	let tocheck = printf("%s/%s", par, ".git/")
	while par != '/home'
		if isdirectory(tocheck)
			echo printf("find project root at %s", par)
			execute printf("make -C %s run", par)
			break
		endif
		let par = fnamemodify(par, ':h')
		let tocheck = printf("%s/%s", par, ".git/")
	endwhile
endfunction
map <F12> :call A_Run()<cr>


" 刷新当前所用的CSCOPE
function! A_FlushCscope()
	exec "cs kill -1"
	exec "!cscope -Rbq"
	exec "cs add cscope.out"
endfunction
command! LUWHFlushCscope call A_FlushCscope()
"nmap <F12> :call A_FlushCscope(); <cr>

" 刷新js&html的cscope
function! A_FlushJsCscope()
    exec "!find html js -name '*.js' -or -name '*.html' > cscope.files"
    exec "!cscope -bkq -i cscope.files"
    exec "cs add cscope.out"
endfunction
command! LUWHFlushJsCscope call A_FlushJsCscope()

" 让修改过的Log重新变成root的
function! A_Log2Root()
	exec "!sudo chown root.root %"
endfunction
command! LUWHLog2Root call A_Log2Root()

" 强行保存
function! A_SudoWrite()
	exec "write !sudo tee %"
endfunction
command! SudoSave call A_SudoWrite()

function! A_F2_FormatCode()
	if &filetype == 'c' || &filetype == 'h'
		exec "w"
		exec "!astyle --options=$HOME/.c_astylerc %"
		exec "e!"
	elseif &filetype == 'cpp'
		exec "w"
		exec "!astyle --options=$HOME/.c_astylerc %"
		exec "e!"
	endif
endfunction
map <F2> :call A_F2_FormatCode()<cr>

function! A_F3_FormatCode()
	if &filetype == 'c' || &filetype == 'h'
		exec "w"
		exec "!astyle --options=$HOME/.kernel_c_astylerc %"
		exec "e!"
	endif
endfunction
map <F3> :call A_F3_FormatCode()<cr>
