"
" TODO:
" relecture/cleanup .vimrc
" rassembler les mappages des touches si possible
" mapper visual block sur ctrl-b (ou q) pour eviter les conflits avec le copier/coller
" virer la limite de taille de ligne de 80
" voir la connection a la base autotags existante si le gvim etait ouvert avant/ailleurs
" chercher le plugin autocomplete des fonctions + qui propose les prototypes dans un tooltip
" integration python ? doc / pytags
"

"
" note: use ctrl+w+w to switch between windows
"

set nocompatible	" Use Vim defaults (much better!)

set fileformat=unix

"source $HOME/.vim/mswin.vim
"source $HOME/.vim/colors/mysyncolor.vim

"Exhuberant ctags
"let Tlist_Ctags_Cmd = '~/ctags/bin/ctags'
"filetype on
"Taglist Plugin
"let Tlist_Process_File_Always = 1
"nmap <F8> :TlistToggle<CR>

"File type
autocmd! BufRead,BufNewFile *.lm       set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.ym       set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.vm       set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.vlm      set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.vmh      set filetype=tcsh"m5
"autocmd! BufRead,BufNewFile *.mkm      set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.smh      set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.sm,*.mS  set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.mh       set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.rfm      set filetype=tcsh"m5
"autocmd! BufRead,BufNewFile *.run      set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.list     set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.lst      set filetype=tcsh"m5
autocmd! BufRead,BufNewFile *.crdl     set filetype=python
autocmd! BufRead,BufNewFile *.py*      set filetype=python
autocmd! BufRead,BufNewFile *.ve,*.v   set filetype=vhdl
autocmd! BufRead,BufNewFile *.cm,*.ccm set filetype=c
autocmd! BufRead,BufNewFile *.scm      set filetype=c

"Any search with an uppercase character becomes a case sensitive search.
set ic
set scs
"do not wrap searcg around
"set nowrapscan

"set ignorecase smartcase
set autoindent
set shiftwidth=4 tabstop=4 expandtab
"set tags=~/tags

" First define default font, then try preferred other fonts...
set guifont=Liberation\ Mono\ 12
"set guifont=-*-lucidatypewriter-medium-r-normal-*-10-*-*-*-m-*
"set guifont=fixed
set guifont=-misc-fixed-medium-r-normal-*-*-100-*-*-c-*-iso8859-15
"set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-100-*-*-m-*-iso8859-1
set guifont=Monospace\ 10,LucidaTypewriter\ 9,-b&h-lucidatypewriter-medium-r-normal-*-9-*-*-*-m-*-iso10646-1
set guifont=LucidaTypewriter\ 11
set guifont=Monospace\ 9
"set guifont=-*-lucidatypewriter-medium-r-normal-*-10-*-*-*-m-*
"set guifont=fixed
"set guifont=-misc-fixed-medium-r-normal-*-*-100-*-*-c-*-iso8859-15
"set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-100-*-*-m-*-iso8859-1
"set guifont=LucidaTypewriter\ 11

" Switch off the Toolbar in GUI
"set guioptions-=T

" Display highlight parameters (and others) on console when launching vim
"set highlight is

" Do not break long lines, show < and > instead, show side-scrollbar
set textwidth=0
set sidescroll=8
set nowrap
"set wrap
set linebreak
"set showbreak=\ <<\ 
set guioptions+=b
set ruler
set laststatus=1
set showmatch

" Set autocompletion options (Tab key) on command line
" Function controlled via F5, F6, F7 keys
set suffixes=.bak,~,.va,.ve,.vea,.vmp,.v
" set wildignore=*.o,*.swp,*.dx,*.ncw,*.vmp,*.ncall,*.nca,*.nce,*.ncelab,*.ncdir/,*.wdir/,MAKE/,SCCS/,*_[0-9a-f][0-9a-f]*.*,*.sim.*
set wildmenu
set wildmode=longest,full

" Set printing paramters for :hardcopy command
set printfont=Courier_New:h6
"set printheader=%<%f%h%m%=Page\ %N
set printheader=%<%f%=Page\ %N
set printoptions=left:10mm,right:5mm,top:10mm,bottom:10mm,header:2,syntax:y,number:y,wrap:y,portrait:y,paper:A4

" Define characters to be listed in list mode (tab, eol, extends, precedes, trail
" Alternative charcters for listchars:  ° » « · ­ Þ ¤ ¶
" set listchars=tab:Þ·,extends:»,precedes:«,trail:¤
" set list
" highlight NonText    term=reverse cterm=NONE ctermbg=DarkMagenta ctermfg=Yellow gui=NONE guibg=DarkMagenta guifg=Yellow
" highlight SpecialKey term=italic  cterm=NONE ctermbg=LightGray ctermfg=Cyan     gui=NONE guibg=LightGray guifg=DarkGray
"silent source $HOME/.vim/script/list_some.vim

" Enable mouse also in vim on xterms etc.
"set mouse=a

" Map scroll up and down to Ctrl-Up and Ctrl-Down
map <C-Up> <C-Y>
map <C-Down> <C-E>

" Enable wheel mouse scrolling
"	:map <M-Esc>[62~ <MouseDown>
"	:map! <M-Esc>[62~ <MouseDown>
"	:map <M-Esc>[63~ <MouseUp>
"	:map! <M-Esc>[63~ <MouseUp>
"	:map <M-Esc>[64~ <S-MouseDown>
"	:map! <M-Esc>[64~ <S-MouseDown>
"	:map <M-Esc>[65~ <S-MouseUp>
"	:map! <M-Esc>[65~ <S-MouseUp>

" Function Keys:
" <F1>  - reserved fucking vi help
" <F2>  - pyDoc()
" <F3>  - Add comment (//) at beginning of line
" <F4>  - Remove comment (//) from beginning of line
" <F5>  - 
" <F6>  - go to definition
" <F7>  - 
" <F8>  - toggle functions & variables definition list
" <F9> - Clear search highlighting
" <F10> - not usable (Unix Menu)
" <F11>  - Clear match highlighting
" <F12> - Show/Hide special characters (EOL,Tab etc.)
  function Help()                                                                                                                                                                             
      try 
          if b:current_syntax == "python"
              :call ShowPyDoc(expand("<cword>"), 1)
		  else
			execute "Man " . expand("<cword>")
          endif
      catch /:E149:/
          execute "help " . expand("<cword>")
      endtry
  endfunction
  nmap <silent> <F2> :call Help()<CR>
  imap <F2> <Esc><F2>

" Add and remove comments at current cursor position, following lines (with Shift-key) or on selected area
  vmap <F3>   :s:^://:<CR>:nohlsearch<CR>
  nmap <F3>   0i//<ESC>
  nmap <S-F3> 0i//<ESC>j
  imap <F3>   <ESC><F3>la
  imap <S-F3> <ESC><F3>ji

  vmap <F4>   :s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  nmap <F4>   :. s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  nmap <S-F4> :.-1;/^[ 	]*\/\// s:^\([ 	\/]*\)\/\/:\1:<CR>:s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  imap <F4>   <ESC><F4>la
  imap <S-F4> <ESC><F4>ji

function GoToDefinition()
	try
		execute "cscope find g " . expand("<cword>")
	catch /:E259:/
		try
			execute "tag " . expand("<cword>")
		catch /:E257:/
			execute "normal! gd"
			execute "nohlsearch"
		endtry
	endtry
endfunction
" go to definition with F6
"  map <silent> <F6> :call GoToDefinition()<CR>
"  map <silent> <F6> :call Help()<CR>

" open/close tag list window with F8
  map <silent> <F8> :TlistToggle<CR>

" Remove temporarily search highlighting
  map <F11> :nohlsearch<CR>
  imap <F11> <ESC><F11>a

" <F10> not usable in GUI (system catches this key)

" Clear match highlighting
  map <F9> :match NONE<CR>
  imap <F9> <ESC><F9>a

" <F12> - Show/Hide special characters (EOL, Tab etc.), change coloring
" Note: <F12> is hardcoded in loaded scripts...
  map <F12> :source $HOME/.vim/script/list_full.vim<CR>
  imap <F12> <ESC><F12>a

" +++++++++++++++++++++++++++++++++++++++++++++++++
" Temporary mappings
"
"map <F6> :s:[ 	]*\/\/ PMN [+-][ ]*::<CR>:nohlsearch<CR>0j
"map <F7> 0i//<ESC>80A <ESC>A// PMN -<ESC>080\|dw0j
"map <S-F7> 0i//<ESC>A // PMN -<ESC>0j
"map <F8> 80A <ESC>A// PMN +<ESC>080\|dw0j
"map <S-F8> A // PMN +<ESC>0j
"
" +++++++++++++++++++++++++++++++++++++++++++++++++

" Deleting text in normal mode
" using the BackSpace and Delete keys:
  nmap <BS>  X
  nmap <DEL> x

" Add backquote/quote to matching pairs
set matchpairs+=`:'

" From PMN environment
set bs=2                " allow backspacing over everything in insert mode
"set nobackup            " keep a backup file
set writebackup         " keep a backup until file properly saved, then automatically removed
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
" Ignore white space differences for diff mode of vim
set diffopt=filler,iwhite

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  "syntax on      " Use standard color definition file
  syntax enable  " Use my own color definition file

  syntax sync minlines=150
  " Also switch on highlighting the last used search pattern.
  set hlsearch
  " and the currently performed search
  set incsearch

  colorscheme desert
  "colorscheme peachpuff
	
endif

"hi PreProc  term=underline ctermfg=blue guifg=#ff80ff

augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

"augroup gzip
"  " Remove all gzip autocommands
"  au!
"
"  " Enable editing of gzipped files
"  "	  read:	set binary mode before reading the file
"  "		uncompress text in buffer after reading
"  "	 write:	compress file after writing
"  "	append:	uncompress file, append, compress file
"  autocmd BufReadPre,FileReadPre	*.gz set bin
"  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
"  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
"  autocmd BufReadPost,FileReadPost	*.gz set nobin
"  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
"  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
"
"  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
"  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r
"
"  autocmd FileAppendPre			*.gz !gunzip <afile>
"  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
"  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
"  autocmd FileAppendPost		*.gz !gzip <afile>:r
"augroup END

au GUIEnter * set lines=65 columns=120

set nu!

:command W w
:command Reload edit

"
" enable bracket folding
"
"zf#j creates a fold from the cursor down # lines.
"zf/string creates a fold from the cursor to string .
"zj moves the cursor to the next fold.
"zk moves the cursor to the previous fold.
"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zm increases the foldlevel by one.
"zM closes all open folds.
"zr decreases the foldlevel by one.
"zR decreases the foldlevel to zero -- all folds will be open.
"zd deletes the fold at the cursor.
"zE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.
" fold form this bracket
nmap <F10> zfa{<CR><CR>
" unfold or use End
nmap <S-F10> zo<CR><CR>

" mkm syntax highlighting
if has("autocmd")                                                                                                                                                                           
    autocmd BufRead,BufNewFile *.mkm set ft=mkm
endif


" 
" disable swap to speed up file editing on heavy machine loads
" 
set nobackup "not leave any additional file(s) around after having closed VIM.
"set nowritebackup "do not keep a backup file while the file is being worked
set noswapfile "keep everything in memory, dont use this for big files.


"
" tlist options
"
let Tlist_Use_Right_Window = 1


""""""""""""""""""""""""""""""""""""""""""""""""""
"Omni-completion par CTRL-X_CTRL-O
"""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType html        set omnifunc=htmlcomplete#CompleteTags 
au FileType css         set omnifunc=csscomplete#CompleteCSS 
au FileType javascript  set omnifunc=javascriptcomplete#CompleteJS 
au FileType c           set omnifunc=ccomplete#Complete 
au FileType php         set omnifunc=phpcomplete#CompletePHP 
au FileType ruby        set omnifunc=rubycomplete#Complete 
au FileType sql         set omnifunc=sqlcomplete#Complete 
au FileType python      set omnifunc=pythoncomplete#Complete 
au FileType xml         set omnifunc=xmlcomplete#CompleteTags


"
" define Q as key to start visual block, as ctrl-v is used for paste
"
":nnoremap q <c-v>


"" set status line
"set statusline=%<%f\ %h%w%m%r%3.(\ %)%=%([%{Tlist_Get_Tagname_By_Line()}]%)%3.(\ %)%-14.(%l,%c%V%)\ %P

"
" remove menus
"
":set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

