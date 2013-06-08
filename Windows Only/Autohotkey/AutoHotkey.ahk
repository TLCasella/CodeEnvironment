SetTitleMatchMode 2

XButton2::!`

#IfWinActive VIM
Capslock::Esc
^0::^Tab
^9::+Tab
#IfWinActive

#IfWinActive Sublime
Capslock::Esc
#IfWinActive

#IfWinActive Visual Studio
Capslock::Esc
`;:::

^n::
Send {Down}
return

^p::
Send {Up}
return

;Enter::
;Send {o} {Esc}
;return


;+Enter::
;Send {k} {o} {Esc}
;return