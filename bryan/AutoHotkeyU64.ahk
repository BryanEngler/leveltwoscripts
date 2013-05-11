
;  AutoHotKeyU64.ahk file is in C:\Users\liferay\Documents

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
;  F8         exit command prompt  --  F8  --  when console window is active
;  XButton1   mouse "back" button  --  mouse back button  --  within 7zip
;  XButton1   mouse "back" button  --  mouse back button  --  within vm
;  XButton2   mouse "forward" button  --  mouse forward button  --  within 7zip

;*******************************************************

;GLOBAL VARIABLES - these need to be defined by the user

devToolPath := "D:\Liferay\Dev Tool"
devToolCachePath = "%devToolPath%\cache"
repoDir := "D:\Repos"
repoDirPortal = "%repoDir%\liferay-portal"
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

; hotfix options  --  control + .

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

;********************************************************

; reload the ahk script  --  control + shift + r  --  when in sublime

#IfWinActive ahk_class PX_WINDOW_CLASS
^+r::
reload()
Return
#IfWinActive

;******************************************************

; create fix-pack-requirements.txt  --  control + r  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^r::
requirementsTXT()
Return
#IfWinActive

;******************************************************

; create fix-pack-resolved-conflicts.txt  --  control + y  --  when explorer window is active

#IfWinActive ahk_class CabinetWClass
^y::
resolvedConflictsTXT()
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
Send {Rbutton}
Return
#IfWinActive

;******************************************************

; exit command prompt  --  F8  --  when console window is active

#IfWinActive ahk_class ConsoleWindowClass
F8::
Send exit
Send {Enter}
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

;creates 3 new users in liferay 
::aus::AUI().Get.script('https://raw.github.com/gist/6000522/add_users.js');
Return

::aw::ant war
Return

::clpe::
Send ant create-lpe -Dlps=
Return

::cb::catalina.bat jpda run
Return

::cda::cd D:/Repos/alloy-ui
Return

::cdp::cd D:/Repos/liferay-portal
Return

::cdl::cd D:/Repos/liferay-plugins
Return

::cdj::
Send cd /d D:\Liferay\Jira
Return

::cdb::create database
Return

::ddb::drop database
Return

::dp::drop database portal; create database portal;
Return

::e.::explorer .
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

::gg::git gui
Return

::ggc::git gc --auto
Return

::gk::gitk
Return

::gkg::
Send gitk --grep=LPS-
Send {Space}{Left}
Return

::gl::git log --pretty=format:"%h  %C(cyan bold)%an    %CresetComitted: %cr    %C(yellow bold) %s" -5
Return

;log in to Git
::gli::C:\Windows\SysWOW64\cmd.exe /c ""C:\Program Files (x86)\Git\bin\sh.exe" --login -i"
Return

::gcm::
Send git commit -a -m ""
Send {Left}
Return

::gcma::git commit -a --amend
Return

::gmt::git mergetool
Return

::gm::
Send git merge upstream/
Send {Space}{Left}
Return

::gp::git push origin
Return

::gr::git reset head
Return

::grs::
Send git reset --soft head
Send {Space}
Send {Backspace}
Return

::grh::
Send git reset --hard head
Send {Space}
Send {Backspace}
Return

::grb::git rebase
Return

::gs::git status
Return

::gsu::git submodule update
Return

;change title of Git window
::gti::
Send echo -ne "\e]0;\007"
Send {Space}
Send {Backspace}{Left}{Left}{Left}{Left}{Left}
Return

::gwc::git whatchanged --pretty=format:"%C(cyan bold) %an %C(yellow bold) %s" -5
Return

;create new hotfix branch usage- hotfix.sh [VERSION] [LPP] [LPE]
::hf::Hotfix.sh
Return

::ipc::ipconfig
Return

::mys::mysql -u root -ppassword
Return

::pa::patching-tool auto-discovery
Return

::pf::patching-tool info
Return

::pi::patching-tool install
Return

::rp::
Send cd /d D:/Servers/liferay-portal/tomcat-7.0.27/bin
Send {Enter}
Send catalina.bat jpda run 
Send {Enter}
Return

::rpc::
Send cd /d D:/Servers/liferay-portal
Send {Enter}
Send rmdir /Q /S .\data
Send {Enter}
Send cd tomcat-7.0.27
Send {Enter}
Send rmdir /Q /S .\temp
Send {Enter}
Send rmdir /Q /S .\work
Send {Enter}
Send copy %lic61% ..\deploy
Send {Enter}
Send cd bin
Send {Enter}
Send mysql -u root -ppassword
Send {Enter}
Send drop database portal; create database portal;
Send {Enter}
Send exit
Send {Enter}
Send catalina.bat jpda run 
Send {Enter}
Return

::rpc0::
Send cd /d D:/Servers/liferay-portal
Send {Enter}
Send rmdir /Q /S .\data
Send {Enter}
Send cd tomcat-7.0.27
Send {Enter}
Send rmdir /Q /S .\temp
Send {Enter}
Send rmdir /Q /S .\work
Send {Enter}
Send copy %lic6012% ..\deploy
Send {Enter}
Send cd bin
Send {Enter}
Send mysql -u root -ppassword
Send {Enter}
Send drop database portal; create database portal;
Send {Enter}
Send exit
Send {Enter}
Send catalina.bat jpda run 
Send {Enter}
Return

::sdb::show databases;
Return

::sopl::
Send System.out.println("");
Send {Space}
Send {Backspace}{Left}{Left}{Left}
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
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	Send grep hotfix-%hotfix% blacklist.txt
	Send {Enter}
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
	commandPromptPath(Clipboard,"CMD")
	Clipboard := ClipSaved
	ClipSaved =
}

commandPromptPath(path,title)
{
	global
	Run, cmd /K cd /d %path%
	WinWait %defaultPromptTitle%
	WinActivate %defaultPromptTitle%
	if (title != "") 
	{
		Send title %title%
		Send {Enter}
	}
}

customersInstalledHotfixes()
{
	global
	title := "Customer"
	commandPromptPath(devToolCachePath,title)	
	InputBox, customer, Show The Customers Hotfixes, Enter Customer Name:,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	Send GitLogin.bat
	Send {Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"
	Send {Enter}
	Send CustomersInstalledHotfixes.sh %customer%
	Send {Enter}
}

lppsAndCustomers()
{
	global
	title := "LPPs"
	commandPromptPath(devToolCachePath,title)
	InputBox, hotfix, Show LPP's and Customers With This Hotfix, Enter Hotfix Number (XXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	InputBox, version, Show LPP's and Customers With This Hotfix, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}	
	Send grep hotfix-%hotfix%-%version% hotfix-list.txt
	Send {Enter}
}

deleteTemp()
{
	global
	title := "CMD"
	ClipSaved := ClipboardAll
	Send !d
	Sleep 20
	Send ^c
	commandPromptPath(Clipboard,title)
	Send rmdir /Q /S .\data
	Send {Enter}
	Send cd tomcat 
	Send {tab}
	Sleep 20
	Send {Enter}
	Send rmdir /Q /S .\temp
	Send {Enter}
	Sleep 20
	Send rmdir /Q /S .\work
	Send {Enter}
	InputBox, version, Copy A License, Enter Version Number (6010/6011/6012/61/n):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	if (version = "6010")
	{
		Send copy %lic6010% "%Clipboard%"\deploy
		Send {Enter}
	}
	else if (version = "6011")
	{
		Send copy %lic6011% "%Clipboard%"\deploy
		Send {Enter}
	}
	else if (version = "6012")
	{
		Send copy %lic6012% "%Clipboard%"\deploy 
		Send {Enter}
	}
	else if (version = "61")
	{
		Send copy %lic61% "%Clipboard%"\deploy
		Send {Enter}
	}
	Send exit
	Send {Enter}
	Clipboard := ClipSaved
	ClipSaved =
}

checkForCollisions()
{
	global
	title := "DT"
	commandPromptPath(devToolPath,title)
	InputBox, existing, Run The fp-dev-tool, Check An Existing Hotfix For A Different Customer? (Y or N):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	InputBox, version, Run The fp-dev-tool, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	if (existing = "y")
	{
		InputBox, hotfix, Run The fp-dev-tool, Enter Hotfix Number (XXX):,,,,,370
		WinActivate %propmtTitle%%title%
		if (ErrorLevel == 1) ;hit cancel
		{
			Send exit
			Send {Enter}
			Return
		}
	}
	InputBox, customer, Run The fp-dev-tool, Enter Customer Name:,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	if (existing = "n")
	{
		InputBox, plugin, Run The fp-dev-tool, Is This A Plugins Patch? (Y or N):,,,,,370
		WinActivate %propmtTitle%%title%
		if (ErrorLevel == 1) ;hit cancel
		{
			Send exit
			Send {Enter}
			Return
		}
	}
	WinActivate %propmtTitle%%title%
	if (existing = "y")
	{
		Send java -jar lib/fp-dev.jar %version% check hotfix-%hotfix% %customer%
	}
	else if (plugin = "y")
	{
		Send java -jar lib/fp-dev.jar %version%-plugins %customer%
	}
	else
	{
		Send java -jar lib/fp-dev.jar %version% %customer%
	}
	Send {Enter}
}

existingHotfixesForLpe()
{
	global
	title := "Existing Hotfixes"
	commandPromptPath(devToolCachePath,title)
	InputBox, lpe, Find A Hotfix, Enter The LPE Number (XXXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	Send GitLogin.bat
	Send {Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"
	Send {Enter}
	Send ExistingHotfixesForLpe.sh %lpe%
	Send {Enter}
}

getIP()
{
	global
	title := "IP"
	commandPromptPath(`"%HOMEPATH%`\Desktop",title)
	Send ipconfig | grep "IPv4"
	Send {Enter}
}

gitBash()
{
	global
	commandPromptPath(repoDirPortal,"")
	Send GitLogin.bat
	Send {Enter}
}

newHotfixBranch()
{
	global
	commandPromptPath(repoDir,"")
	Send GitLogin.bat
	Send {Enter}
	InputBox, version, Create A New Fix Pack Branch, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Send exit
		Send {Enter}
		Return
	}
	InputBox, lpp, Create A New Fix Pack Branch, Enter LPP Number:,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Send exit
		Send {Enter}
		Return
	}
	InputBox, lpe, Create A New Fix Pack Branch, Enter LPE Number (or none):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Send exit
		Send {Enter}
		Return
	}
	else
	{
		Send echo -ne "\e]0;LPP-%lpp%\007"
		Send {Enter}
		Send cd liferay-portal
		Send {Enter}
		Send Hotfix.sh %version% %lpp% %lpe%
		Send {Enter}
	}
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

	if (ErrorLevel == 1) ;hit cancel
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

newTextDoc()
{
	Send ^a
	Send !e
	Send i
	Send {AppsKey}
	Send w
	Send t
}

reload()
{
	Reload
	Sleep 300 ;If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, The script could not be reloaded.
}

requirementsTXT()
{
	Send ^a
	Send !e
	Send i
	Send {AppsKey}
	Send w
	Send t
	Sleep 400
	Send ^a
	Send fix-pack-requirements.txt
}

resolvedConflictsTXT()
{
	Send ^a
	Send !e
	Send i
	Send {AppsKey}
	Send w
	Send t
	Sleep 400
	Send ^a
	Send fix-pack-resolved-conflicts.txt
}

runTC()
{
	global
	ClipSaved := ClipboardAll
	Send !d
	Sleep 20
	Send ^c
	commandPromptPath(Clipboard,"TC")
	Clipboard := ClipSaved
	ClipSaved =
	Send cd to
	Send {Tab}
	Send {Enter}
	Send cd bin
	Send {Enter}
	Send catalina.bat jpda run
	Send {Enter}
}

lpesResolvedByHotfix()
{
	global
	title := "LPEs"
	commandPromptPath(devToolCachePath,title)
	InputBox, hotfix, Show Fixed Issues, Enter Hotfix Number (XXX):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	InputBox, version, Show Fixed Issues, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
	Send GitLogin.bat
	Send {Enter}
	Sleep 1000
	Send echo -ne "\e]0;%title%\007"
	Send {Enter}
	Send LpesResolvedByHotfix.sh %hotfix% %version%
	Send {Enter}
}

updateDevTool()
{
	global
	title := "Udate DT"
	commandPromptPath(devToolPath,title)
	InputBox, version, Update the Dev Tool, Enter Version Number (6012/6110/6120):,,,,,370
	WinActivate %propmtTitle%%title%
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Return
	}
  	Send fp-dev-tool.bat %version%
  	Send {Enter}
}

updateRepos()
{
	global
	commandPromptPath(repoDir,"")
	Send GitLogin.bat
	Send {Enter}
	InputBox, repo, Update Git Repos, Which Repo Would You Like To Update?`n(alloy / plugins / portal / all):,,,,,370
	WinActivate %propmtTitle%GIT
	if (ErrorLevel == 1) ;hit cancel
	{
		Send exit
		Send {Enter}
		Send exit
		Send {Enter}
		Return
	}
	Send echo -ne "\e]0;Updating Repos\007"
	Send {Enter}
	if (repo = "alloy" || repo = "all")
	{
		Send UpdateAlloy.sh
		Send {Enter}
	}
	if (repo = "plugins" || repo = "all")
	{
		Send UpdatePlugins.sh
		Send {Enter}
	}
	if (repo = "portal" || repo = "all")
	{
		Send UpdatePortal.sh
		Send {Enter}
	}
}
