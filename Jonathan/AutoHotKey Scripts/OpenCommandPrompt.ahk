#NoTrayIcon

;Windows Key + Right Click within active window
#IfWinActive ahk_class CabinetWClass
#RButton::
ClipSaved := ClipboardAll
Send !d
Sleep 20
Send ^c
Sleep 20
Run, cmd /K "cd /d `"%clipboard%`""
sleep 600
WinActivate C:\Windows\system32\cmd.exe
Clipboard := ClipSaved
ClipSaved =
Return
#IfWinActive

;Windows Key + Right Click anywhere else
#IfWinNotActive ahk_class CabinetWClass
#RButton::
Run, cmd /K "cd `"%HOMEPATH%`\Desktop""
sleep 600
WinActivate C:\Windows\system32\cmd.exe
Return
#IfWinActive