" mkm syntax file:
" add color syntax for .mkm files
" ***WARNING*** add: autocmd BufRead,BufNewFile *.mkm set ft=mkm to your .vimrc
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"" mkm syntax highlighting: ADD TO YOUR .VIMRC !
"if has("autocmd")                                                                                                                                                                           
"    autocmd BufRead,BufNewFile *.mkm set ft=mkm
"endif

syn keyword		m5BuiltIn	Append Assert Case CasePattern CountArg CurrentDir CurrentFile CurrentLine DebugFile DebugMode Decr Define Define1 Defined Defn Depend Div1000 DumpDefn Equal EqualFile EqualRaw ErrPrint Eval Exit ExitFile Find First ForEach Fork ForEver Format If Include Include1 IncludeErrList IncludeFile IncludeFile1 Included Incr Indirect IsBlank Kill Last Len Log LookUp Max Min Mul1000 MultiShift NewLine Paste PopDefn Prepend Print Process PushDefn PutEnv qBaseName qDefault qDirName qEnvList qGetEnv qGlobalSubst qIndent qInLine qNoBlank qSubstring qSystemOut qToLower qToUpper qTranslit Quote Random Repeat Shift Strip Subst System SystemErr SystemOut TmpFile TraceOff TraceOn Undefine Void While
syn keyword		lmakeBuiltIn	CheckSum depend Env EnvAll EnvPattern LocalPythonRule LocalRule newdep pyDepend PythonRule Rule Side Src Target Tool

syn region		lmakeComment	start="//" skip="\\$" end="$" keepend contains=@Spell
syn match		m5stem			"<[[:alnum:]-]*>"
syn match		pyStr 			:"[^"]*": contains=m5BuiltIn,lmakeBuiltIn

hi def link		pyStr       	Comment
hi def link		m5BuiltIn		Statement
hi def link		lmakeBuiltIn	PreProc
hi def link		lmakeComment	Comment
hi def link		m5stem			Special

let b:current_syntax = "mkm"

