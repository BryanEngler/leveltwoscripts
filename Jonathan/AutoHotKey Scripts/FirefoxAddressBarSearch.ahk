#NoTrayIcon

;Activate the Firefox window, create a new tab, search for what is on the clipboard
#c::

; Copy currently selected item
Send ^c
ClipWait
clipboard = %clipboard%

; Switch to Firefox window
SetTitleMatchMode, 2
WinActivate, - Mozilla Firefox
WinWaitActive, - Mozilla Firefox

lpsPos := InStr(clipboard, "LPS")
lppPos := InStr(clipboard, "LPP")
lpePos := InStr(clipboard, "LPE")
lepPos := InStr(clipboard, "LEP")
sosPos := InStr(clipboard, "SOS")

if (lpsPos = 1 or lppPos = 1 or lpePos = 1 or lepPos = 1 or sosPos = 1)
{
	Send ^t
	Sleep 20
	send jira{SPACE}
	Send ^v
	Sleep 20
	Send {Enter}
}
else
{
	Send ^t
	Sleep 20
	Send ^k
	Sleep 20
	Send ^v
	Sleep 20
	Send {Enter}
}