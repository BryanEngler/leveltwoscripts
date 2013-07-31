
;  AutoHotKeyU64.ahk file is in D:\Repos\leveltwoscripts\bryan

;  QUICK REFERENCE

;  capslock   command prompt on desktop  --  capslock  --  when explorer window is not active
;  capslock   current directory command prompt  --  capslock  --  when explorer window is active
;  ^d         delete data, temp, and work folders from liferay_home directory and copy license  --  control + d  --  when explorer window is active
;  ^!i        ip address  --  control + alt + i
;  ^g         git bash command prompt in portal repo directory  --  control + g
;  ^.         repo/hotfix menu  --  control + .
;  ^t         new text doc  --  control + t  --  when explorer window is active
;  ^+r        reload the ahk script  --  control + shift + r  --  when in sublime
;  ^r         create fix-pack-requirements.txt  --  control + r  --  when explorer window is active
;  ^y         create fix-pack-resolved-conflicts.txt  --  control + y  --  when explorer window is active
;  F9         run tomcat from liferay_home directory  --  F9  --  when explorer window is active
;  ^\         swap slash direction in clipboard  --  Ctrl + \ 
;  ^/         swap slash direction in clipboard  --  Ctrl + / 
;  ^!d        print current date  --  control + alt + d
;  ^v         paste in command prompt  --  control + v  --  when console window is active
;  F4         exit command prompt  --  F4  --  when console window is active
;  XButton1   mouse "back" button  --  mouse back button  --  within 7zip
;  XButton1   mouse "back" button  --  mouse back button  --  within vm
;  XButton2   mouse "forward" button  --  mouse forward button  --  within 7zip

;*******************************************************

;GLOBAL VARIABLES - these need to be defined by the user

emailAddress := "USERNAME@liferay.com"
emailPassword := "PASSWORD"
devToolPath := "D:/Liferay/Dev Tool"
devToolCachePath = "%devToolPath%/cache"
repoDir := "D:/Repos"
repoDirPortal = "%repoDir%/liferay-portal"
serverDir := "D:/Servers/liferay-portal"
tomcatVersion := "7.0.27"
mysqlDBname := "portal"
mysqlPassword := "password"
defaultPromptTitle := "Admin: C:\Windows\system32\cmd.exe"
propmtTitle := "Admin:  "
lic6010 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.0-liferaycom.xml"
lic6011 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.0sp1-liferaycom.xml"
lic6012 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.0sp2-liferaycom.xml"
lic61 := "D:\Liferay\LICENSE\license-portaldevelopment-developer-6.1-liferaycom.xml"

;*******************************************************

; SYMBOL MEANINGS
; ! Alt
; ^ Control
; + Shift
; # Windows Key

;*******************************************************

; command prompt on desktop  --  capslock  --  when explorer window is not active

#IfWinNotActive ahk_class CabinetWClass
CapsLock::
commandPromptDesktop()
Return
#IfWinActive

;******************************************************

; command prompt in current directory  --  capslock  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
CapsLock::
commandPromptDirectory()
Return
#IfWinActive

;******************************************************

; delete data, temp, and work folders from liferay_home directory and copy license  --  control + d  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^d::
deleteTemp()
Return
#IfWinActive

;******************************************************

; ip address  --  control + alt + i

^!i::
getIP()
Return

;*******************************************************

; git bash command prompt in portal repo directory  --  control + g

^g::
gitBash()
Return

;********************************************************

; repo/hotfix menu  --  control + .

^.::
MainMenu()
Return

;********************************************************

; new text doc  --  control + t  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^t::
newTextDoc()
Return
#IfWinActive

;******************************************************

; create fix-pack-requirements.txt  --  control + r  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^r::
newTextDocTitle("fix-pack-requirements")
Return
#IfWinActive

;******************************************************

; create fix-pack-resolved-conflicts.txt  --  control + y  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^y::
newTextDocTitle("fix-pack-resolved-conflicts")
Return
#IfWinActive

;********************************************************

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

; print current date  --  control + alt + d

^!d::
FormatTime,date,,ShortDate
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


::aa::ant all
Return

::ad::ant deploy
Return

::af::ant format-source
Return

::adusr::AUI().Get.script('https://raw.github.com/gist/6000522/add_users.js');
Return

::aw::ant war
Return

:o:clpe::ant create-lpe -Dlps=
Return

::cb::catalina.bat jpda run < nul
Return

::cda::cd D:/Repos/alloy-ui
Return

::cdp::cd D:/Repos/liferay-portal
Return

::cdl::cd D:/Repos/liferay-plugins
Return

:o:cdj::cd /d D:/Liferay/Jira
Return

::cdb::create database
Return

::ddb::drop database
Return

::e.::explorer .
Return

:*:fpi::fix-pack-includes{enter}
Return

:*:fpe::fix-pack-excludes{enter}
Return  

::ga::git add
Return

::gb::git branch
Return

::gbi::git bisect
Return

::gbv::git bisect view
Return

::gc::git checkout
Return

::gcb::git checkout -b
Return

::gce::git checkout ee-6.1.x
Return

::gcf::git config --edit
Return

::gcfg::git config --global --edit
Return

::gcd::git clean -d
Return

::gch::git cherry-pick
Return

::gcp::git cherry-pick --no-commit
Return

::gd::git branch -D
Return

::gdt::git difftool
Return

::gdf::git diff
Return

::gf::git fetch upstream
Return

:o:gfb::git fetch git@github.com:username_to_fetch_from/repo_name.git their_branch_to_fetch:my_new_branch{left 72}
Return

::gg::git gui
Return

::ggc::git gc --auto
Return

::gk::gitk
Return

:o:gkg::gitk --grep=LPS-
Return

::gl::git log --pretty=format:"%h  %C(cyan bold)%an    %CresetComitted: %cr    %C(yellow bold) %s" -5
Return

::gli::
SendInput C:\Windows\SysWOW64\cmd.exe /c ""C:\Program Files (x86)\Git\bin\sh.exe" --login -i"{enter}
Sleep 100
SendInput echo -ne "\e]0;Admin: Git\007"{enter}
Return

:o:gcm::git commit -a -m ""{Left}
Return

::gcma::git commit -a --amend
Return

::gmt::git mergetool
Return

:o:gm::git merge upstream/
Return

::gp::git push origin
Return

:o:gpr::git fetch git@github.com:BryanEngler/liferay-portal-ee.git LPS-:LPS-{left 5}
Return

:o:gprl::git fetch git@github.com:BryanEngler/liferay-plugins-ee.git LPS-:LPS-{left 5}
Return

::gr::git reset head
Return

:o:grs::git reset --soft head
Return

:o:grh::git reset --hard head
Return

::grb::git rebase
Return

::gs::git status
Return

::gsu::git submodule update
Return

:o:gti::echo -ne "\e]0;\007"{Left 5}
Return

::gwc::git whatchanged --pretty=format:"%C(cyan bold) %an %C(yellow bold) %s" -5
Return

::hf::Hotfix.sh     ;USAGE- Hotfix.sh [VERSION] [LPP] [LPE]
Return

::ipc::ipconfig
Return

::lremail::
SendRaw var input = AUI().one('#_137_pop3Host');input.val("pop.gmail.com");var input = AUI().one('#_137_pop3Port');input.val("995");var input = AUI().one('#_137_pop3User');input.val("%emailAddress%");var input = AUI().one('#_137_pop3Password');input.val("%emailPassword%");var input = AUI().one('#_137_smtpHost');input.val("smtp.gmail.com");var input = AUI().one('#_137_smtpPort');input.val("465");var input = AUI().one('#_137_smtpUser');input.val("%emailAddress%");var input = AUI().one('#_137_smtpPassword');input.val("%emailPassword%");
Return

::mys::
SendInput mysql -u root -p%mysqlPassword%
Return

::np::notepad
Return

::pa::patching-tool auto-discovery
Return

::pf::patching-tool info
Return

::pi::patching-tool install
Return

::rp::
SendInput cd /d %serverDir%/tomcat-%tomcatVersion%/bin{Enter}title TC{Enter}catalina.bat jpda run < nul{enter}
Return

::rpc::
SendInput cd /d %serverDir%{Enter}title TC{Enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic61% ..\deploy{Enter}echo drop database %mysqlDBname%; create database %mysqlDBname%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina.bat jpda run < nul{enter}
Return

::rpc0::
SendInput cd /d %serverDir%{Enter}title TC{Enter}rmdir /Q /S .\data{Enter}cd tomcat-%tomcatVersion%{Enter}rmdir /Q /S .\temp{Enter}rmdir /Q /S .\work{Enter}copy /y %lic6012% ..\deploy{Enter}echo drop database %mysqlDBname%; create database %mysqlDBname%; | mysql -u root -p%mysqlPassword%{Enter}cd bin{Enter}catalina.bat jpda run < nul{enter}
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


checkIfBlacklisted()
{
	global
	title := "Blacklist"
	commandPromptPath(devToolCachePath,title)
	InputBox, hotfix, Check The Blacklist, Enter The Number And Version (XXX-XXXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	Send grep hotfix-%hotfix% blacklist.txt{Enter}
}

commandPromptDesktop()
{
	commandPromptPath("C:/Users/liferay/Desktop","CMD")
}

commandPromptDirectory()
{
	ClipSaved := ClipboardAll
	Send !d
	Sleep 20
	Send ^c
	Sleep 30
	commandPromptPath(Clipboard,"CMD")
	Clipboard := ClipSaved
	ClipSaved =
}

commandPromptPath(path,title)
{
	global
	Run, cmd /K cd /d %path%
	Sleep 20
	WinWait %defaultPromptTitle%
	WinActivate %defaultPromptTitle%
	if (title != "") 
	{
		Send title %title%{Enter}
	}
}

customersInstalledHotfixes()
{
	global
	title := "Customer"
	commandPromptPath(devToolCachePath,title)	
	InputBox, customer, Show The Customers Hotfixes, Enter Customer Name:,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	Send GitLogin.bat{Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"{Enter}CustomersInstalledHotfixes.sh %customer%{Enter}
}

checkForCollisions()
{
	global
	title := "DT"
	commandPromptPath(devToolPath,title)
	InputBox, existing, Run The fp-dev-tool, Check An Existing Hotfix For A Different Customer? (Y or N):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	InputBox, version, Run The fp-dev-tool, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	if (existing = "y")
	{
		InputBox, hotfix, Run The fp-dev-tool, Enter Hotfix Number (XXX):,,,,,370
		WinActivate %propmtTitle%%title%
		if (ErrorLevel == 1)
		{
			Send exit{Enter}
			Return
		}
	}
	InputBox, customer, Run The fp-dev-tool, Enter Customer Name:,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	if (existing = "n")
	{
		InputBox, plugin, Run The fp-dev-tool, Is This A Plugins Patch? (Y or N):,,,,,370
		WinActivate %propmtTitle%%title%
		if (ErrorLevel == 1)
		{
			Send exit{Enter}
			Return
		}
	}
	WinActivate %propmtTitle%%title%
	if (existing = "y")
	{
		Send java -jar lib/fp-dev.jar %version% check hotfix-%hotfix% %customer%{Enter}
	}
	else if (plugin = "y")
	{
		Send java -jar lib/fp-dev.jar %version%-plugins %customer%{Enter}
	}
	else
	{
		Send java -jar lib/fp-dev.jar %version% %customer%{Enter}
	} 
}

deleteTemp()
{
	global
	title := "CMD"
	ClipSaved := ClipboardAll
	Send !d
	Sleep 20
	Send ^c
	Sleep 20
	commandPromptPath(Clipboard,title)
	Send rmdir /Q /S .\data{Enter}cd tomcat{Tab}
	Sleep 20
	Send {Enter}rmdir /Q /S .\temp{Enter}
	Sleep 20
	Send rmdir /Q /S .\work{Enter}
	InputBox, version, Copy A License, Enter Version Number (6010/6011/6012/61/n):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	if (version = "6010")
	{
		Send copy %lic6010% "%Clipboard%"\deploy{Enter}
	}
	else if (version = "6011")
	{
		Send copy %lic6011% "%Clipboard%"\deploy{Enter}
	}
	else if (version = "6012")
	{
		Send copy %lic6012% "%Clipboard%"\deploy{Enter}
	}
	else if (version = "61")
	{
		Send copy %lic61% "%Clipboard%"\deploy{Enter}
	}
	Send exit{Enter}
	Clipboard := ClipSaved
	ClipSaved =
}

existingHotfixesForLpe()
{
	global
	title := "Existing Hotfixes"
	commandPromptPath(devToolCachePath,title)
	InputBox, lpe, Find A Hotfix, Enter The LPE Number (XXXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	Send GitLogin.bat{Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"{Enter}ExistingHotfixesForLpe.sh %lpe%{Enter}
}

getIP()
{
	global
	title := "IP"
	commandPromptPath(`"%HOMEPATH%`\Desktop",title)
	Send ipconfig | grep "IPv4"{Enter}
}

gitBash()
{
	global
	commandPromptPath(repoDirPortal,"")
	Send GitLogin.bat{Enter}
}

lpesResolvedByHotfix()
{
	global
	title := "LPEs"
	commandPromptPath(devToolCachePath,title)
	InputBox, hotfix, Show Fixed Issues, Enter Hotfix Number (XXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	InputBox, version, Show Fixed Issues, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	Send GitLogin.bat{Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"{Enter}LpesResolvedByHotfix.sh %hotfix% %version%{Enter}
}

lppsAndCustomers()
{
	global
	title := "LPPs"
	commandPromptPath(devToolCachePath,title)
	InputBox, hotfix, Show LPP's and Customers With This Hotfix, Enter Hotfix Number (XXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
	InputBox, version, Show LPP's and Customers With This Hotfix, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}	
	Send grep hotfix-%hotfix%-%version% hotfix-list.txt{Enter}
}

MainMenu()
{
	InputBox, option, Repo / Hotfix Menu,
	(
1 - New Hotfix Branch
2 - Check For Collisions
3 - Specific LPE - Existing Hotfixes
4 - Single Hotfix - LPP's and Customer's
5 - Single Hotfix - LPE's Resolved
6 - Single Hotfix - Check If Blacklisted
7 - Single Customer - Installed Hotfixes 
8 - Update Dev Tool Cache
9 - Update Repos

Enter Number:
	),,400,300,,370

	if (ErrorLevel == 1)
	{
		Return
	}
	if (option = "1")
	{
		newHotfixBranch()
		Return
	}
	else if (option = "2")
	{
		checkForCollisions()
		Return
	}
	else if (option = "3")
	{
		existingHotfixesForLpe()
		Return
	}
	else if (option = "4")
	{
		lppsAndCustomers()
		Return
	}
	else if (option = "5")
	{
		lpesResolvedByHotfix()
		Return
	}
	else if (option = "6")
	{
		checkIfBlacklisted()
		Return
	}
	else if (option = "7")
	{
		customersInstalledHotfixes()
		Return
	}
	else if (option = "8")
	{
		updateDevTool()
		Return
	}
	else if (option = "9")
	{
		updateRepos()
		Return
	}
}

newHotfixBranch()
{
	global
	commandPromptPath(repoDir,"")
	Send GitLogin.bat{Enter}
	InputBox, version, Create A New Fix Pack Branch, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1)
	{
		Send exit{Enter}exit{Enter}
		Return
	}
	InputBox, lpp, Create A New Fix Pack Branch, Enter LPP Number:,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1)
	{
		Send exit{Enter}exit{Enter}
		Return
	}
	InputBox, lpe, Create A New Fix Pack Branch, Enter LPE Number (or none):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1)
	{
		Send exit{Enter}exit{Enter}
		Return
	}
	else
	{
		Send echo -ne "\e]0;LPP-%lpp%\007"{Enter}cd liferay-portal{Enter}Hotfix.sh %version% %lpp% %lpe%{Enter}
	}
}

newTextDoc()
{
	Send ^a!ei{AppsKey}wt
}

newTextDocTitle(title)
{
	newTextDoc()
	Sleep 200
	SendInput %title%{enter}
}

runTC()
{
	global
	ClipSaved := ClipboardAll
	Send !d
	Sleep 20
	Send ^c
	Sleep 20
	commandPromptPath(Clipboard,"TC")
	Clipboard := ClipSaved
	ClipSaved =
	Send cd to{Tab}{Enter}cd bin{Enter}catalina.bat jpda run < nul{Enter}
}

updateDevTool()
{
	global
	title := "Udate DT"
	commandPromptPath(devToolPath,title)
	InputBox, version, Update the Dev Tool, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1)
	{
		Send exit{Enter}
		Return
	}
  	Send fp-dev-tool.bat %version%{Enter}
}

updateRepos()
{
	global
	commandPromptPath(repoDir,"")
	Send GitLogin.bat{Enter}
	InputBox, repo, Update Git Repos, Which Repo Would You Like To Update?`n(alloy / plugins / portal / all):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1)
	{
		Send exit{Enter}exit{Enter}
		Return
	}
	Send echo -ne "\e]0;Updating Repos\007"
	Send {Enter}
	if (repo = "alloy" || repo = "all")
	{
		Send UpdateAlloy.sh{Enter}
	}
	if (repo = "plugins" || repo = "all")
	{
		Send UpdatePlugins.sh{Enter}
	}
	if (repo = "portal" || repo = "all")
	{
		Send UpdatePortal.sh{Enter}
	}
}
