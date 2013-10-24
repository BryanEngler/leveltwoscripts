#.::
SetTitleMatchMode, 2
IfWinExist, Google Play - Mozilla Firefox
	ControlSend, ahk_parent, {right}
else
	OpenGooglePlay()
return

#,::
SetTitleMatchMode, 2
IfWinExist, Google Play - Mozilla Firefox
	ControlSend, ahk_parent, {left}
else
	OpenGooglePlay()
return

#p::
SetTitleMatchMode, 2
IfWinExist, Google Play - Mozilla Firefox
	ControlSend, ahk_parent, {space}
else
	OpenGooglePlay()
return

OpenGooglePlay()
{
	Run "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" -new-window https://play.google.com/music/listen?u=0#/all
}