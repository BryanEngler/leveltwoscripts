
;  QUICK REFERENCE

;  `          command prompt on desktop  --  `  --  when explorer window is not active
;  `          current directory command prompt  --  `  --  when explorer window is active
;  ^`         send backtick  --  Ctrl + `
;  ^g         git bash command prompt in portal repo directory  --  control + g
;  ^.         hotfix script menu  --  control + .
;  ^t         new text doc  --  control + t  --  when explorer window is active
;  ^+r        reload the ahk script  --  control + shift + r  --  when in sublime
;  F9         run tomcat from liferay_home directory  --  F9  --  when explorer window is active
;  ^\         swap slash direction in clipboard  --  Ctrl + \ 
;  ^/         swap slash direction in clipboard  --  Ctrl + / 
;  ^+d        print current date  --  control + shift + d
;  ^v         paste in command prompt  --  control + v  --  when console window is active
;  F4         exit command prompt  --  F4  --  when console window is active
;  XButton1   mouse "back" button  --  mouse back button  --  within 7zip
;  XButton1   mouse "back" button  --  mouse back button  --  within vm
;  XButton2   mouse "forward" button  --  mouse forward button  --  within 7zip

;*******************************************************

;GLOBAL VARIABLES - these need to be defined by the user

emailAddress := "liferaytest234@gmail.com"
emailPassword := "testtest234"
serverDir := "D:/Servers/liferay-portal"
serverDir8 := "D:/Servers/liferay-portal-2"
serverDir60x := "D:/Servers/liferay-portal-60x"
serverDir61x := "D:/Servers/liferay-portal-61x"
serverDir62x := "D:/Servers/liferay-portal-62x"
serverDir70 := "D:/Servers/liferay-portal-70x"
serverDir6012 := "D:/Servers/liferay-portal-6012"
serverDir6110 := "D:/Servers/liferay-portal-6110"
serverDir6120 := "D:/Servers/liferay-portal-6120"
serverDir6130 := "D:/Servers/liferay-portal-6130"
serverDir6210 := "D:/Servers/liferay-portal-6210"
tomcatVersion := "7.0.27"
mysqlDBname := "portal"
mysqlDBname2 := "portal2"
mysqlDBname60x := "portal60x"
mysqlDBname61x := "portal61x"
mysqlDBname62x := "portal62x"
mysqlDBname70x := "portal70x"
mysqlDBname6012 := "portal6012"
mysqlDBname6110 := "portal6110"
mysqlDBname6120 := "portal6120"
mysqlDBname6130 := "portal6130"
mysqlDBname6210 := "portal6210"
mysqlPassword := "password"
ojdbc := "D:\Liferay\misc\ojdbc14.jar"
defaultPromptTitle := "Admin: C:\Windows\system32\cmd.exe"
lic60 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.0sp2-liferaycom.xml"
lic61 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.1-liferaycom.xml"

;*******************************************************

; SYMBOL MEANINGS
; ! Alt
; ^ Control
; + Shift
; # Windows Key

;*******************************************************

; command prompt on desktop  --  `  --  when explorer window is not active

#IfWinNotActive ahk_class CabinetWClass
`::
runCommandPrompt("C:/Users/liferay/Desktop","CMD")
Return
#IfWinActive

;******************************************************

; command prompt in current directory  --  `  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
`::
initCommandPrompt("CMD")
Return
#IfWinActive

;******************************************************

; send backtick  --  Ctrl + `

^`::SendInput %A_LoopReadLine%``

;******************************************************

; git bash command prompt in portal repo directory  --  control + g

^g::
Run, GitBashLogin.bat
Return

;********************************************************

; hotfix script menu  --  control + .

^.::
MainMenu()
Return

;********************************************************

; new text doc  --  control + t  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^t::
Send ^a!ei{AppsKey}wt
Return
#IfWinActive

;******************************************************

; reload the ahk script  --  control + shift + r  --  when in sublime

#IfWinActive ahk_class PX_WINDOW_CLASS
^r::
Reload
Return
#IfWinActive

;******************************************************

; run tomcat from liferay_home directory  --  F9  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
F9::
runTC()
Return
#IfWinActive

;*******************************************************

; swap slashes in clipboard  --  Ctrl + /

^/::
Clipboard := RegExReplace(Clipboard, "\\", "/")
Return

;*******************************************************

; swap slashes in clipboard  --  Ctrl + \ 

^\::
Clipboard := RegExReplace(Clipboard, "/", "\")
Return

;********************************************************

; print current date  --  control + shift + d

^+d::
FormatTime,date,,yyyy-M-d
Send %date%
Return

;******************************************************

; paste in command prompt  --  control + v  --  when console window is active

#IfWinActive ahk_class ConsoleWindowClass
^v::
SendInput %Clipboard%
Return
#IfWinActive

;******************************************************

; exit command prompt  --  F4  --  when console window is active

#IfWinActive ahk_class ConsoleWindowClass
F4::
Send exit{Enter}
Return
#IfWinActive

;******************************************************

; mouse "back" button  --  mouse back button  --  within 7zip

#IfWinActive ahk_class FM
XButton1::             
Send {Backspace}
Return
#IfWinActive

;******************************************************

; mouse "back" button  --  mouse back button  --  within vm

#IfWinActive ahk_class VMPlayerFrame
XButton1::             
Send {Backspace}
Return
#IfWinActive

;******************************************************

; mouse "forward" button  --  mouse forward button  --  within 7zip

#IfWinActive ahk_class FM
XButton2::             
Send {Enter}
Return
#IfWinActive

;****************************************************************************************************

;****************************************************************************************************

;****************************************************************************************************
;ALIASES
;****************************************************************************************************

::adur::AUI().Get.script('https://cdn.rawgit.com/BryanEngler/6000522/raw/add_usersM5.js');
Return

::cdb::create database
Return

::ddb::drop database
Return

::gb::git branch
Return

::gbm::git branch -m
Return

::gbis::git bisect good
Return

::gc::git checkout
Return

::gcb::git checkout -b
Return

:o:gce::git checkout ee-
Return

:o:gcm::git commit -m ""{Left}
Return

:o:gcma::git commit -am ""{Left 1}  
Return

::gd::git branch -D
Return

::gdt::git difftool  &{left 3}
Return

::gfu::git fetch upstream
Return

:o:gfb::git fetch git@github.com:/liferay-portal.git :{left 21}
Return

:o:ghu::git@github.com:BryanEngler/liferay-portal-ee.git
Return

:o:fzfp::git fetch git@github.com:zsoltbalogh/liferay-portal-ee.git fix-pack-hotfix-:{left}
Return

:o:zfp::https://github.com/zsoltbalogh/liferay-portal-ee/commits/fix-pack-hotfix-
Return

::gk::gitk  &{left 3}
Return

:o:gkg::gitk --grep=LPS- &{left 2}
Return

:o:gkga::gitk --grep=AUI- &{left 2}
Return

:o:gkgs::gitk --grep=SOS- &{left 2}
Return

::gl::git log --pretty=format:"%h  %C(cyan bold)%an    %CresetComitted: %cr    %C(yellow bold) %s" -5
Return

:o:glg::git log --pretty=format:"%h %s" --grep=LPS-
Return

:o:gpd::git push origin : 
Return

:o:gppd::git push pr : 
Return 

::grb::git rebase
Return

:o:grbi::git rebase -i HEAD{^}
Return

:o:grh::git reset --hard{space} 
Return

:o:grhh::git reset --hard head{^}
Return

:o:grs::git reset --soft{space}
Return

:o:grsh::git reset --soft head{^}
Return

:o:gti::echo -ne "\e]0;\007"{Left 5}
Return

::gwc::git whatchanged --pretty=format:"%C(cyan bold) %an %C(yellow bold) %s" -5
Return

::gsol::c3332dbd-47fd-4727-b010-e3a22bc288b4
Return

::hf::Hotfix_LPP_VER    
Return

::hfs::Hotfix_LPP_VER-S    
Return

:o:ltd::cd /d D:\Liferay\JiraC{Enter}ant lpe-tool -Ddate=
Return

:o:ltl::cd /d D:\Liferay\JiraC{Enter}ant lpe-tool -Dlps=
Return

:o:ltq::cd /d D:\Liferay\JiraC{Enter}ant lpe-tool -Dquery=
Return

::lrmail::
SendRaw var input = AUI().one('#_137_pop3Host');input.val("pop.gmail.com");var input = AUI().one('#_137_pop3Port');input.val("995");var input = AUI().one('#_137_pop3User');input.val("%emailAddress%");var input = AUI().one('#_137_pop3Password');input.val("%emailPassword%");var input = AUI().one('#_137_smtpHost');input.val("smtp.gmail.com");var input = AUI().one('#_137_smtpPort');input.val("465");var input = AUI().one('#_137_smtpUser');input.val("%emailAddress%");var input = AUI().one('#_137_smtpPassword');input.val("%emailPassword%");
Return

::rp::
SendInput cd /d %serverDir%/tomcat-%tomcatVersion%/bin{Enter}title TC Master{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc::
SendInput cd /d %serverDir%{Enter}title TC Master{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname%; create database %mysqlDBname%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rpj::
SendInput cd /d %serverDir%/tomcat-%tomcatVersion%/bin{Enter}title TC Master{Enter}cls{enter}copy /y D:\Liferay\rebel.xml D:\Servers\liferay-portal\tomcat-7.0.27\webapps\ROOT\WEB-INF\classes{Enter}catalina jpda run jreb < nul{enter}
Return

::rpcj::
SendInput cd /d %serverDir%{Enter}title TC Master{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}copy /y D:\Liferay\rebel.xml D:\Servers\liferay-portal\tomcat-7.0.27\webapps\ROOT\WEB-INF\classes{Enter}echo drop database %mysqlDBname%; create database %mysqlDBname%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run jreb< nul{enter}
Return

::rp2::
SendInput cd /d %serverDir8%/tomcat-%tomcatVersion%/bin{Enter}title TC 8001{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc2::
SendInput cd /d %serverDir8%{Enter}title TC 8001{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname2%; create database %mysqlDBname2%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp60x::
SendInput cd /d %serverDir60x%/tomcat-%tomcatVersion%/bin{Enter}title TC 60x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc60::
SendInput cd /d %serverDir60x%{Enter}title TC 60x{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic60% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname60x%; create database %mysqlDBname60x%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp6012::
SendInput cd /d %serverDir6012%/tomcat-%tomcatVersion%/bin{Enter}title TC 6012{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc6012::
SendInput cd /d %serverDir6012%{Enter}title TC 6012{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic60% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname6012%; create database %mysqlDBname6012%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp61::
SendInput cd /d %serverDir61x%/tomcat-%tomcatVersion%/bin{Enter}title TC 61x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc61::
SendInput cd /d %serverDir61x%{Enter}title TC 61x{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname61x%; create database %mysqlDBname61x%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp6110::
SendInput cd /d %serverDir6110%/tomcat-%tomcatVersion%/bin{Enter}title TC 6110{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc6110::
SendInput cd /d %serverDir6110%{Enter}title TC 6110{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname6110%; create database %mysqlDBname6110%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp6120::
SendInput cd /d %serverDir6120%/tomcat-%tomcatVersion%/bin{Enter}title TC 6120{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc6120::
SendInput cd /d %serverDir6120%{Enter}title TC 6120{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname6120%; create database %mysqlDBname6120%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp6130::
SendInput cd /d %serverDir6130%/tomcat-%tomcatVersion%/bin{Enter}title TC 61x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc6130::
SendInput cd /d %serverDir6130%{Enter}title TC 61x{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname6130%; create database %mysqlDBname6130%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp62::
SendInput cd /d %serverDir62x%/tomcat-%tomcatVersion%/bin{Enter}title TC 62x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc62::
SendInput cd /d %serverDir62x%{Enter}title TC 62x{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname62x%; create database %mysqlDBname62x%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp6210::
SendInput cd /d %serverDir6210%/tomcat-%tomcatVersion%/bin{Enter}title TC 62x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc6210::
SendInput cd /d %serverDir6210%{Enter}title TC 6210{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname6210%; create database %mysqlDBname6210%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::rp70::
SendInput cd /d %serverDir70x%/tomcat-%tomcatVersion%/bin{Enter}title TC 70x{Enter}cls{enter}catalina jpda run < nul{enter}
Return

::rpc70::
SendInput cd /d %serverDir70x%{Enter}title TC 70x{Enter}cls{enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}copy /y %ojdbc% .\lib\ext{Enter}echo drop database %mysqlDBname70x%; create database %mysqlDBname70x%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina jpda run < nul{enter}
Return

::sdb::show databases;
Return

:o:sopl::System.out.println("");{Left 3}
Return


;****************************************************************************************************

;****************************************************************************************************

;****************************************************************************************************
;FUNCTIONS
;****************************************************************************************************


MainMenu()
{
	InputBox, option, Run Hotfix Scripts,
	(
1 - Check For Collisions
2 - Existing Hotfixes for LPE
3 - LPP's/Customers with Hotfix
4 - Customer's Installed Hotfixes 
5 - Customer's Fixed Issues
6 - Check if Hotfix is Blacklisted
7 - LPE's Resolved by Hotfix

Enter Number:
	),,300,280,,370

	if (ErrorLevel == 1)
	{
		Return
	}
	if (option = "1")
	{
		Run, sh.exe -c checkForCollisions
		Return
	}
	else if (option = "2")
	{
		Run, sh.exe -c existingHotfixesForLpe
		Return
	}
	else if (option = "3")
	{
		Run, sh.exe -c lppsAndCustomersWithHotfix
		Return
	}
	else if (option = "4")
	{
		Run, sh.exe -c customersInstalledHotfixes
		Return
	}
	else if (option = "5")
	{
		Run, sh.exe -c customersFixedIssues
		Return
	}
	else if (option = "6")
	{
		Run, sh.exe -c checkIfHotfixBlacklisted
		Return
	}
	else if (option = "7")
	{
		Run, sh.exe -c lpesResolvedByHotfix
		Return
	}
}

initCommandPrompt(title)
{
	ClipSaved := ClipboardAll
	Send !d
	Sleep 30
	Send ^c
	Sleep 30
	runCommandPrompt(Clipboard,title)
	Clipboard := ClipSaved
	ClipSaved =
}

runCommandPrompt(path,title)
{
	global
	Run, cmd /K cd /d %path%
	Sleep 20
	WinWait %defaultPromptTitle%
	WinActivate %defaultPromptTitle%
	SendInput title %title% && cls{Enter}
}

runTC()
{
	initCommandPrompt("TC")
	Sleep 400
	Send cd to{Tab}{Enter}cd bin{Enter}catalina run{Enter}
}

