#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


shift & v::
clipwait				; wait for data to get copied completely sometime it take time depend on data
new_string := clipboard
new_string := StrReplace(new_string,"`r`n"," ")
vPos :=1
prePos:=1
while vPos := RegExMatch(new_string, "[^A-Z][\.\?:!] [A-Z]", o, vPos){
    if (RegExMatch(new_string, "Mr. [A-Z]", o, vPos-5) or RegExMatch(new_string, "Mrs. [A-Z]", o, vPos-5) or   RegExMatch(new_string, "Ms. [A-Z]", o, vPos-5) or   RegExMatch(new_string, "Dr. [A-Z]", o, vPos-5) or vPos - prePos<5)
    {
    vPos+=2
    continue
    }
    length := vPos - prePos+1
    temp_string := SubStr(new_string, prePos+1,length)
    prePos+=length
	vPos +=2
	clipwait				; wait for data to get copied completely sometime it take time depend on data
    clipboard :=temp_string
    Send, {CtrlDown}{Enter}{CtrlUp}
    Send, {CtrlDown}v{CtrlUp}				; paste
	}
temp_string := SubStr(new_string, prePos+1)
clipwait				; wait for data to get copied completely sometime it take time depend on data
clipboard :=temp_string
Send, {CtrlDown}{Enter}{CtrlUp}
Send, {CtrlDown}v{CtrlUp}				; paste

return
