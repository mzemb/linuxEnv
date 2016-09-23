" cscope keymaping plugin
" (a tool to browse through C source files)
"

" if compiled with --enable-cscope
if has("cscope")
	if exists("g:loaded_cscope") || &cp
    		finish
	endif
	let g:loaded_cscope   = 1.0

	function! GoToDefinition()
		try
			execute "cscope find g " . expand("<cword>")
		catch /:E259:/
			try
				execute "tag " . expand("<cword>")
			catch /:E257:/
				execute "normal! gd"
				execute "nohlsearch"
				echomsg "not found"
			endtry
		endtry
	endfunction

	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	set cscopetag
	" use ctags before cscope
	set csto=0
	" add any cscope database in current directory
	if filereadable("cscope.out")
		cscope add cscope.out
	endif
	" add the database pointed by environment variable.
	" Cscope file added from db should contains full path to file. Otherwise they
	" should be added with cscope add PATH_TO_CSCOPE_FILE PATH_TO_SRC_ROOT
	if $CSCOPE_DB != ""
		if filereadable($CSCOPE_DB)
			cscope add $CSCOPE_DB
		endif
	endif
	" show message when any other cscope db added
	set cscopeverbose
	" open include file with F4 and split with shift+F4
	nmap <F4>   :cscope  find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <S-F4> :scscope find f <C-R>=expand("<cfile>")<CR><CR>
	" find this C symbol with F5 and split with shift+F5
	nmap <F5>   :cscope  find s <C-R>=expand("<cword>")<CR><CR>
	nmap <S-F5> :scscope find s <C-R>=expand("<cword>")<CR><CR>
	" go to definition with F6 and split with shift+F6 and use ctags with alt+shift+F6
	"nmap <F6>   :cscope  find g <C-R>=expand("<cword>")<CR><CR>
	nmap <F6>   :call GoToDefinition()<CR>
	nmap <S-F6> :scscope find g <C-R>=expand("<cword>")<CR><CR>
	nmap <M-S-F6> :tag <C-R>=expand("<cword>")<CR><CR>
	" go to calls with F7 and split with shift+F7
	nmap <F7>   :cscope  find c <C-R>=expand("<cword>")<CR><CR>
	nmap <S-F7> :scscope find c <C-R>=expand("<cword>")<CR><CR>
	" go to ... with 'ctrl+s letter' and go back with ctrl+t
	nmap <C-s>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-s>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-s>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-s>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-s>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-s>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-s>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-s>d :cscope find d <C-R>=expand("<cword>")<CR><CR>
	" split to ... with 'ctrl+space letter'
	nmap <C-@>s :scscope find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :scscope find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :scscope find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :scscope find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :scscope find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :scscope find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :scscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :scscope find d <C-R>=expand("<cword>")<CR><CR>
	" vertical split to ... with 'ctrl+space ctrl+space letter'
	nmap <C-@><C-@>s :vertical scscope find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vertical scscope find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vertical scscope find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vertical scscope find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vertical scscope find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vertical scscope find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :vertical scscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :vertical scscope find d <C-R>=expand("<cword>")<CR><CR>
	" s  symbol    find all references to the token under cursor
	"               //find this C symbol
	" g  global    find global definition of the token under cursor
	"               //find this definition
	" c  calls     find all calls to the function name under cursor
	"               //find function calling this function
	" d  called    find functions that function under cursor calls
	"               //find function called by this function
	" t  text      find all instances of the text under cursor
	"               //find this text string
	" e  egrep     egrep search for the word under cursor
	"               //find this egrep pattern
	" f  file      open the filename under cursor
	"               //find this file
	" i  includes  find files that include the filename under cursor
	"               //find files  #including this file



endif
