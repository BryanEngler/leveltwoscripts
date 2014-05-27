#NoTrayIcon

;Windows Key + Right Click within active window
#RButton::
Send ^r
Sleep 20
Run,"C:\WINDOWS\system32\cmd.exe" /k cd `"%clipboard%`",%clipboard%
sleep 600
WinActivate C:\Windows\system32\cmd.exe
Return