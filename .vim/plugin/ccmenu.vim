" CC Menu plugin:
" CC make you enjoy the right click button!
" Custom right click menu to call cscope functions

if exists("loaded_ccmenu")
  finish
endif
let loaded_ccmenu = 1
set mousemodel=popup

function! PopulateMenu()
	" clean existing commands
	exe "aunmenu PopUp.-SEP1-"
	exe "aunmenu PopUp.-SEP2-"
	exe "aunmenu PopUp.Undo"
	exe "aunmenu PopUp.Paste"
	exe "aunmenu PopUp.Select\\ Word"
	exe "aunmenu PopUp.Select\\ Sentence"
	exe "aunmenu PopUp.Select\\ Paragraph"
	exe "aunmenu PopUp.Select\\ Line"
	exe "aunmenu PopUp.Select\\ Block"
	exe "aunmenu PopUp.Select\\ All"
	" add ours
	exe "amenu PopUp.File<Tab><F4>                  :cscope find f <C-R>=expand('<cfile>')<CR><CR>"
	exe "amenu PopUp.Symbol<Tab><F5>                :cscope find s <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Definition<Tab><F6>            :call GoToDefinition()<CR>"
	exe "amenu PopUp.Call<Tab><F7>                  :cscope find c <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Text<Tab>                      :cscope find t <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Egrep<Tab>                     :cscope find e <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.GoBack<Tab><Ctrl-t>            <C-t>"
	exe "amenu PopUp.-Sep-                          :"
	exe "amenu PopUp.DatabaseRebuild<Tab><F3>       :call AutotagsUpdate()<CR>"
	exe "amenu PopUp.DatabaseConnect<Tab>           :call AutotagsUpdatePath()<CR>"
	exe "amenu PopUp.AddExtDatabase<Tab><Shift-F3>  :call AutotagsAdd()<CR>"
endfunc


if has("vim_starting")
	augroup LoadBufferPopup
	au! VimEnter * call PopulateMenu()
	au  VimEnter * au! LoadBufferPopup
	augroup END
else
	call PopulateMenu()
endif
