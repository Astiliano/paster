Version = 2.0
Date = 6/15/2015
#SingleInstance force

IfNotExist, %SystemRoot%\Paster\settings.ini
{
msgbox,64,Paster - First Run, Looks like this is your first time running Paster! `nBe sure to read the instructions or contact me `n(Losjava@Amazon.com) if you have any questions.

FileCreateDir, %SystemRoot%\Paster
IniWrite, 1, %SystemRoot%\Paster\settings.ini, settings, Beep
IniWrite, 1, %SystemRoot%\Paster\settings.ini, settings, prompt
}
else
{
IniRead, Beep, %SystemRoot%\Paster\settings.ini, settings, Beep
IniRead, prompt, %SystemRoot%\Paster\settings.ini, settings, prompt
}

Sleep = 50

Menu, MySubMenu4, Add,Beep ,Beep
If (Beep > 0)
{
Menu, MySubmenu4,Check, Beep
}
else
{
Menu, MySubmenu4,UnCheck, Beep
}

Menu, MySubMenu4,Add,Paste Prompt ,Pasteprompt
If (prompt > 0)
{
Menu, MySubmenu4,Check,Paste Prompt
}
else
{
Menu, MySubmenu4,UnCheck,Paste Prompt
}

menu, tray, add,Settings,:MySubMenu4
Menu , tray , Icon , Settings , %A_WinDir%\syswow64\SHELL32.dll , 268
menu, tray, nostandard
menu, tray, add, Info
menu , tray , default , Info
Menu , tray , Icon , Info , %A_WinDir%\syswow64\SHELL32.dll , 278
menu, tray, add, Fresh Start, Fresh-Start
menu , tray , Icon , Fresh Start , %A_WinDir%\syswow64\SHELL32.dll , 113
menu, MySubMenu, Add,Support
menu, tray, add,Send Email, :MySubMenu
menu , tray , Icon , Send Email , %A_WinDir%\syswow64\SHELL32.dll , 222

Menu, MySubMenu2, Add,Default ,Speed-Default
Menu, MySubmenu2, Check, Default
Menu, MySubMenu2, Add,1/4 Sec ,Speed-1
Menu, MySubMenu2, Add,3/4 Sec ,Speed-2
Menu, MySubMenu2, Add,1 Sec ,Speed-3
Menu, MySubMenu2, Add,3 Sec ,Speed-4
Menu, MySubMenu2, Add,Custom ,Speed-Custom
Menu, tray, add,Paste Delay,:MySubMenu2
Menu, tray , Icon , Paste Delay , %A_WinDir%\syswow64\SHELL32.dll , 78

Menu, MySubMenu3, Add,Cheat Sheet,cheat
Menu, MySubMenu3, Add,Send Text ,sendtext
Menu, MySubMenu3, Add,Windows ,winset
Menu, MySubMenu3, Add,Pasting ,pasting
menu, tray, add,Instructions,:MySubMenu3
Menu , tray , Icon , Instructions , %A_WinDir%\syswow64\SHELL32.dll , 278

menu, tray, add, Exit
Menu , tray , Icon , Exit , %A_WinDir%\syswow64\SHELL32.dll , 28

TrayTip, WARNING!,Paster Has Arrived To Rock Your Day.. `nRight click my icon to see all my options!
SetTimer, RemoveTrayTip, 10000
return

RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
return

Pasteprompt:
Menu, MySubmenu4,ToggleCheck, Paste Prompt
If (prompt > 0)
{
	prompt=0
	IniWrite, 0, %SystemRoot%\Paster\settings.ini, settings, prompt
}
else
{
	prompt=1
	IniWrite, 1, %SystemRoot%\Paster\settings.ini, settings, prompt
}
return


Beep:
Menu, MySubmenu4,ToggleCheck, Beep
If (Beep > 0)
{
	Beep=0
	IniWrite, 0, %SystemRoot%\Paster\settings.ini, settings, Beep
}
else
{
	Beep=1
	IniWrite, 1, %SystemRoot%\Paster\settings.ini, settings, Beep
}
return


^SPACE::  
Winset, Alwaysontop, , A
WinGet,active_id, ID, A
WS_EX_TOPMOST := 0x00000008 ; Ex-style AlwaysOnTop
WinGet, ES, ExStyle,  ahk_id %active_id%

If (ES & WS_EX_TOPMOST) ; bitwise-and
{
TrayTip, Always On Top,Enabled for Window
SetTimer, RemoveTrayTip, 3000
}
Else
{
TrayTip, Always On Top,Disabled for Window
SetTimer, RemoveTrayTip, 3000
}
return

!Space::
WinGetTitle, Title, A
InputBox, ChangeTitle, Change Selected Window Title,Enter New Title Below: , , 250, 120
if ErrorLevel
    return
else
WinSetTitle, %Title%, , %ChangeTitle%
return

F1::
Pause , Toggle,1
return

~ESC::
continue = false
if (A_IsPaused)
{
pause
}
return

Start:
continue = true
if (A_IsPaused)
{
pause
}

list := "Angelina Brolie;Marco Brolo;Brosef Stalin;Brometheus;Tony Bromo;Brony Soprano;Bro Jackson;Pablo Picassbro;Brofessor X;C-3PBro;Apollo Brohno;Bro Diddley;Yo-Yo Brah;Bromeslice;Brobi-Wan Kenobi;Broman Brolanski;Teddy Broosevelt;Charles Brokowski;Edgar Allen Bro;Rice o Broni;Shaquille brO'Neal;Magnetbro;Tom Brody;Le Bro;Breh;Bruh;Bromanowski;Govna"
listsize := list#items(list, ";")
Random, rand, 1, %listsize%
Bro = % listGet(list, rand, ";")   

; return item at said position in said list
	listGet(list,pos=1,del=",") {
	StringSplit, item, list, %del%
	return item%pos%
}

	list#items(list, del=",") {
	ifEqual, list,, return 0
	StringReplace, var, list, % del,, useErrorLevel
	return ErrorLevel+1
}

If (prompt=1)
{
MsgBox, 68,Paster,This will start pasting where the cursor is `nPlease make sure it's in the desired location.. `n`nWe good to go %Bro%?
IfMsgBox No
    Return
}


ClipBoard = %ClipBoard%
sleep 100
SplashTextOn, 350, 100,  Paster Working,Press [F1] to pause.. `nPress [ESC] to stop.. `nThis window will close when complete.. `nBy:Losjava
StringReplace, ClipBoard, ClipBoard, %A_TAB%, %A_SPACE%, All
sleep 25
StringReplace, ClipBoard, ClipBoard, `,, `r`n, All
sleep 25
StringReplace, ClipBoard, ClipBoard, %A_SPACE%, `r`n, All
sleep 25

Loop
{
StringReplace, ClipBoard, ClipBoard,`r`n`r`n, `r`n, UseErrorLevel
    	if ErrorLevel = 0  ; No more replacements needed.
        break
}
sleep 25
StringReplace, ClipBoard, ClipBoard, %A_SPACE%,, All
sleep 25
StringSplit, SerialArray, ClipBoard, `n
sleep 75

skip1:
Loop, %SerialArray0%
{
    this_Serial := SerialArray%a_index%
    SendInput, {raw}%this_serial% 
    sleep %Sleep%
    if continue = false
	break
}

Sleep 100
If (Beep=1)
{
SoundBeep, 750, 500
}
SplashTextOff
return




^!v::
ClipBoard = %ClipBoard%
sleep 100
SplashTextOn, 350, 100,  Paster Working,Press [F1] to pause.. `nPress [ESC] to stop.. `nThis window will close when complete.. `nBy:Losjava
StringSplit, SerialArray, ClipBoard, `n
sleep 75

Loop, %SerialArray0%
{
    this_Serial := SerialArray%a_index%
    SendInput, {raw}%this_serial% 
    sleep %Sleep%
    if continue = false
	break
}

Sleep 100
If (Beep=1)
{
SoundBeep, 750, 500
}
SplashTextOff
return


^#v::  
goto start
return

; MENU GOTO BELOW -------------------------------------------
Exit:
ExitApp
return

Fresh-Start:
reload
return

Support:
run mailto:losjava@amazon.com?Body=--Please include what you were pasting and to what/from where and what the problem is-- &subject=Version %Version% Error/Bug
return

Paste-Speed:
return

Speed-Default:
Menu, MySubmenu2,UnCheck, 1/4 Sec
Menu, MySubmenu2,UnCheck, 3/4 Sec
Menu, MySubmenu2,UnCheck, 1 Sec
Menu, MySubmenu2,UnCheck, 3 Sec
Menu, MySubmenu2,UnCheck, Custom
Menu, MySubmenu2,Check, Default
Sleep = 50
return

Speed-1:
;1/4 Sec
Menu, MySubmenu2,UnCheck, Default
Menu, MySubmenu2,UnCheck, 3/4 Sec
Menu, MySubmenu2,UnCheck, 1 Sec
Menu, MySubmenu2,UnCheck, 3 Sec
Menu, MySubmenu2,UnCheck, Custom
Menu, MySubmenu2,Check, 1/4 Sec
Sleep = 250
return

Speed-2:
;3/4 Sec
Menu, MySubmenu2,UnCheck, Default
Menu, MySubmenu2,UnCheck, 1/4 Sec
Menu, MySubmenu2,UnCheck, 1 Sec
Menu, MySubmenu2,UnCheck, 3 Sec
Menu, MySubmenu2,UnCheck, Custom
Menu, MySubmenu2,Check, 3/4 Sec
Sleep = 750
return

Speed-3:
;1 Sec
Menu, MySubmenu2,UnCheck, Default
Menu, MySubmenu2,UnCheck, 1/4 Sec
Menu, MySubmenu2,UnCheck, 3/4 Sec
Menu, MySubmenu2,UnCheck, 3 Sec
Menu, MySubmenu2,UnCheck, Custom
Menu, MySubmenu2,Check, 1 Sec
Sleep = 1000
return

Speed-4:
;3 sec
Menu, MySubmenu2,UnCheck, Default
Menu, MySubmenu2,UnCheck, 1/4 Sec
Menu, MySubmenu2,UnCheck, 3/4 Sec
Menu, MySubmenu2,UnCheck, 1 Sec
Menu, MySubmenu2,UnCheck, Custom
Menu, MySubmenu2,Check, 3 Sec
Sleep = 3000
return


Speed-Custom:
Menu, MySubmenu2,UnCheck, Default
Menu, MySubmenu2,UnCheck, 1/4 Sec
Menu, MySubmenu2,UnCheck, 3/4 Sec
Menu, MySubmenu2,UnCheck, 1 Sec
Menu, MySubmenu2,UnCheck, 3 Sec
Menu, MySubmenu2,Check, Custom
InputBox:
InputBox, UserInput, Custom Pasting Delay, Please Enter Custom Delay: `n`nExamples:`n1000 = 1 Second`n1500 = 1.5 Seconds `n2000 = 2 Seconds etc. `n`nNo Input = 0 Delay, , 200,250
if ErrorLevel
{
	MsgBox,48, Reverting Delay, Setting Delay Back To Default
	goto Speed-Default
}

If UserInput is not digit
{
	MsgBox,16,Invalid Input,Please Enter Only Numbers
	goto InputBox
}
Sleep = %UserInput%
return
; MENU GOTO ABOVE -------------------------------------------


; TO PASTE TO A SPECIFIED WINDOW BELOW ---------------------------
^!F12::
SplashTextOn,385,125, Select Window, Please select what window `nyou want to paste to and press CTRL+F12 `n`n Afterwards just press Ctrl+Alt+A when you have text selected to send it to selected window
return

^F11::
active_pid =
return

^F12::
SplashTextOff
WinGet, active_pid, PID, A

TrayTip, Successful Selection,Output Window For CTRL+ALT+A Set,,1
SetTimer, RemoveTrayTip, 5000
return


^!a::
Send ^c
if active_pid =
{
	TrayTip, No Window Selected,Please initiate: `nCTRL+ALT+F12 before using CTRL+ALT+A,,3
	SetTimer, RemoveTrayTip, 5000
	return
}
Loop
{
Clipboard = %Clipboard%
sleep 500
StringReplace, ClipBoard, ClipBoard,`r`n`r`n, `r`n, UseErrorLevel
    	if ErrorLevel = 0  ; No more replacements needed.
        break
}
ControlSendRaw, ,%clipboard%, ahk_pid %active_pid% 
ControlSend, , `r`n,ahk_pid %active_pid% 
if ErrorLevel
{
	TrayTip, No Where To Send,Previously selected window no longer active `nPlease initiate CTRL+ALT+F12 again..,,3
	SetTimer, RemoveTrayTip, 5000
	active_pid =
	return
}
return
; TO PASTE TO A SPECIFIED WINDOW ABOVE ---------------------------

^#!h::
cheat:
MsgBox,262144,Cheat Sheet,
(
------Normal Use---------
Paste #1 (Input Paste) -------	CTRL + WIN + V
Paste #2 ("Type out Paste")	CTRL + ALT + V

----Multiple Clipboards--------
Copy To Clipboard 1: CTRL+1  To Paste ALT+1
Copy To Clipboard 2: CTRL+2  To Paste ALT+2
Copy To Clipboard 3: CTRL+3  To Paste ALT+3

------Send Text To Window---------
Select Window:  CTRL + F12
To Send to Window:
Select Text > Press CTRL + ALT + A

------Window Settings---------
Set Window to "Always On Top"
Select Window > CTRL + SPACE

Change Window Title:
Select Window > ALT + SPACE
)
return

pasting:
MsgBox,262144,Instructions: Pasting,
(
The Idea:
To be able to select a list of text and be able to paste it
into either an application or window that requires Enter key to be pressed
after each value/string. Also this will seperate and create a list from 
text by the following characters:[TAB] [,] [SPACE] [ENTER]
--Send me an email if you want it to seperate additional characters--
This will also remove blanks and extra spaces EXCEPT if first line is blank.

In order to begin you copy normally:
CTRL + C or Right Click > Copy
To Start Past+Enter use:
CTRL + WIN + V 
Which will take something like 1,2,3 and turn it into
1 [Enter Key]
2 [Enter Key]
3 [Enter Key]
During this you can press F1 to pause and ESC to stop. If pasting a Looong 
string and you press F1 it will pause AFTER it completes the string.

Also you can use:  CTRL + ALT + V
This will not parse the clipboard and send as-is
As an example, you can copy a script text and literally paste it into
a host "creating" the script by "typing" it out - I have tested this.
This is a great alternative for when CTRL+V cuts off in console.
------------------------------------------------------------------
Sometimes the default pasting speed is too fast for certain
uses, adjust the pasting delay by Right clicking and using the 
'Paste Delay' sub menu.

SETTINGS: RightClick Tray Icon > Settings 
To disable completion Beep or Paste Prompt
)
return

sendtext:
MsgBox,262144,Instructions: Sending Text,
(
The Idea:
Selecting a window or application and being able to minimize it
and send text to it rather than Copy, switch window, paste
with this you can select a window, select text and send it.

In order to get used to this use CTRL + ALT + F12
(currently no exit key so just select something)

So once you select a window with CTRL + F12 you will see
a little bubble letting you know "Successful Selection"

So now you can, for example, open a notepad window and 
select it with CTRL + F12
Then open Firefox, select text and press CTRL + ALT + A
which will send it to notepad even if it's minimized

CURRENTLY there are some issues sending it to the USB KVM software
it will not send characters that require SHIFT, be it capital or
punctuation. So instead of sending ? {Shift /} it will send /
)
return

winset:
MsgBox,262144,Instructions: Window Settings,
(
The Idea:
First, having the ability to set any window as
"Always on Top" in order to prevent alt-tab spam
and window minimize/maximize wombo combo.

Additionally, solving the problem of using an
application (ex: Cygwin) where you will have
multiple instances running and have difficulty
keeping track of which window is which.

To keep a window on top of all the rest:
Select Window > CTRL + SPACE

To rename the title of a window:
Select Window > ALT + SPACE

Note:
Renaming a title will only stick as long as
there are no events that would change/refresh it.

Examples -
Putty changing title to username when using ssh
Saving a document (Refreshes name)
)
return

Info:
MsgBox,262144,Quick Info,
(
Questions? Suggestions?
Send me an email! Please use Tray Menu to send email*
-- Helps keep emails per v.# organized --

Just want a list of all the commands?
Commands Cheat Sheet CTRL + WIN + ALT + H

For detailed instructions/explanation
Right click tray icon > Instructions

Current Uses:
-Pasting and pressing [Enter] after each entry
-"Paste" to a hidden/minimized window (ex:notepad)
-Setting a window to be always on top of the rest
-Changing the title of a Window (ex:Untitled - Notepad)

**By: Losjava@
Losjava: www.Avalos.info
%date% | v%Version%
)
return



^1::
ClipOriginal = %ClipboardAll%
Send ^c
sleep 75
Clip1 = %ClipBoard%
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%           ; Restore original ClipBoard
sleep 50
return

!1::
Clipboard = %Clip1%
ClipWait,0
if ErrorLevel
{
TrayTip, ClipBoard #1,Nothing to paste..,,3
SetTimer, RemoveTrayTip, 2000
return
}
Send ^v
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%          ; Restore original ClipBoard
sleep 50
return

^2::
ClipOriginal = %ClipboardAll%
Send ^c
sleep 75
Clip2 = %ClipBoard%
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%          ; Restore original ClipBoard
sleep 50
return

!2::
ClipBoard = %Clip2%
ClipWait,0
if ErrorLevel
{
TrayTip, ClipBoard #2,Nothing to paste..,,3
SetTimer, RemoveTrayTip, 2000
return
}
Send ^v
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%         ; Restore original ClipBoard
sleep 50
return


^3::
ClipOriginal = %ClipboardAll%
Send ^c
sleep 75
Clip3 = %ClipBoard%
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%          ; Restore original ClipBoard
sleep 50
return

!3::
ClipBoard = %Clip3%
ClipWait,0
if ErrorLevel
{
TrayTip, ClipBoard #3,Nothing to paste..,,3
SetTimer, RemoveTrayTip, 2000
return
}
Send ^v
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
ClipBoard = %ClipOriginal%          ; Restore original ClipBoard
sleep 50
return
