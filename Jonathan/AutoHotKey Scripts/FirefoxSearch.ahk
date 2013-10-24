#NoTrayIcon

;Activate the Firefox window, create a new tab, search for what is on the clipboard
#c::
Send ^c
SetTitleMatchMode, 2
WinActivate, - Mozilla Firefox
WinWaitActive, - Mozilla Firefox
Send ^t
Sleep 20
Send ^k
Sleep 20
Send ^v
Sleep 20
Send {Enter}