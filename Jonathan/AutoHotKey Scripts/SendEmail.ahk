#NoTrayIcon

 #!e::
{
InputBox, UserInput, Reminder, What do I need to remember?, , 380, 170
If Not ErrorLevel
{
Run, cscript.exe C:\Users\liferay\Documents\AutoHotKeyScripts\sendemail.vbs "jonathanemccann@yahoo.com" "%UserInput%" "",, Min
}
Return
}