" Vim syntax file
" Language:	GScript 2
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/gscript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2010 Mar 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet gscript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'gscript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("gscript_fold")
  unlet gscript_fold
endif


syn keyword gscriptCommentTodo      TODO FIXME XXX TBD contained
syn match   gscriptLineComment      "\/\/.*" contains=@Spell,gscriptCommentTodo
syn match   gscriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  gscriptComment	       start="/\*"  end="\*/" contains=@Spell,gscriptCommentTodo
syn match   gscriptSpecial	       "\\\d\d\d\|\\."
syn region  gscriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=gscriptSpecial,@htmlPreproc
syn region  gscriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=gscriptSpecial,@htmlPreproc

syn match   gscriptSpecialCharacter "'\\.'"
syn match   gscriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  gscriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword gscriptConditional	        if else switch elseif
syn keyword gscriptRepeat		while for do in
syn keyword gscriptBranch		break continue
syn keyword gscriptOperator		new name
syn keyword gscriptType		        TStaticVar
syn keyword gscriptStatement		return with
syn keyword gscriptBoolean		true false
syn keyword gscriptNull		        null nil NULL NIL pi
syn keyword gscriptIdentifier	        this temp level player serverr server clientr client
syn keyword gscriptLabel		case default
"syn keyword gscriptException		try catch finally throw
syn keyword gscriptMessage		echo trigger triggeraction triggerclient triggerserver say2 setcharani setcharprop setplayerprop setshape setshape2 sleep message scheduleevent join findimg findplayer addweapon destroy resetfocus 
syn keyword gscriptGlobal		int onCreated onActionServerside onMouseDown onActionClientside onInitialized onServerListerConnect onTimeout onActionPlayerOnline onRCChat onPlayerChats onPlayerEnters onKeyPressed onPlayerDies onPlayerLeaves
"syn keyword gscriptMember		
"document event location 
"syn keyword gscriptDeprecated	        escape unescape
syn keyword gscriptReserved		enum public class //#CLIENTSIDE const
"abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

if exists("gscript_fold")
    syn match	gscriptFunction	"\<function\>"
    syn region	gscriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match gscriptSync	grouphere gscriptFunctionFold "\<function\>"
    syn sync match gscriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword gscriptFunction	function
    syn match	gscriptBraces	   "[{}\[\]]"
    syn match	gscriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "gscript"
  syn sync ccomment gscriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gscript_syn_inits")
  if version < 508
    let did_gscript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink gscriptComment		Comment
  HiLink gscriptLineComment		Comment
  HiLink gscriptCommentTodo		Todo
  HiLink gscriptSpecial		Special
  HiLink gscriptStringS		String
  HiLink gscriptStringD		String
  HiLink gscriptCharacter		Character
  HiLink gscriptSpecialCharacter	gscriptSpecial
  HiLink gscriptNumber		gscriptValue
  HiLink gscriptConditional		Conditional
  HiLink gscriptRepeat		Repeat
  HiLink gscriptBranch		Conditional
  HiLink gscriptOperator		Operator
  HiLink gscriptType			Type
  HiLink gscriptStatement		Statement
  HiLink gscriptFunction		Function
  HiLink gscriptBraces		Function
  HiLink gscriptError		Error
  HiLink javaScrParenError		gscriptError
  HiLink gscriptNull			Keyword
  HiLink gscriptBoolean		Boolean
  HiLink gscriptRegexpString		String

  HiLink gscriptIdentifier		Type
  HiLink gscriptLabel		Label
  HiLink gscriptException		Exception
  HiLink gscriptMessage		Identifier
  HiLink gscriptGlobal		Keyword
  HiLink gscriptMember		Keyword
  HiLink gscriptDeprecated		Exception 
  HiLink gscriptReserved		Keyword
  HiLink gscriptDebug		Debug
  HiLink gscriptConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "gscript"
if main_syntax == 'gscript'
  unlet main_syntax
endif

" vim: ts=8
