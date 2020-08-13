# Auto split sentences to Scapple
## Description:
1. Copy 1 paragraph that you want to import into Scapple

## Text instructions:
1. Right-Click on your desktop.

2. Find "New" in the menu.

3. Click "AutoHotkey Script" inside the "New" menu.

4. Give the script a new name. It must end with a .ahk extension. For example: MyScript.ahk

5. Find the newly created file on your desktop and right-click it.

6. Click "Edit Script".

7. A window should have popped up, probably Notepad. If so, SUCCESS!

8. Paste the script below:

```
^+s::
clipwait				; wait for data to get copied completely sometime it take time depend on data
new_string := clipboard
new_string := StrReplace(new_string,"`r`n"," ")
vPos :=1
prePos:=1
while vPos := RegExMatch(new_string, "[^A-Z][\.\?!] [A-Z0-9]", o, vPos){
    if (RegExMatch(new_string, "Mr. [A-Z]", o, vPos-5) or RegExMatch(new_string, "Mrs. [A-Z]", o, vPos-5) or   RegExMatch(new_string, "Ms. [A-Z]", o, vPos-5) or   RegExMatch(new_string, "Dr. [A-Z]", o, vPos-5)or vPos - prePos<5)
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
esc:: ExitApp
```
8. Save the File.

9. Double-click the file/icon in the desktop to run it.
