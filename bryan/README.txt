Install AutoHotKey and learn how to use it

Copy the contents of AutoHotkeyU64.ahk to your AutoHotkeyU64.ahk file and reload it
Set the paths of the GLOBAL VARIABLES in the AutoHotkeyU64.ahk file to match your environment

This goes in the repoDirPortal directory:
Hotfix.sh

These go in the repoDir directory:
UpdateAlloy.sh
UpdatePlugins.sh
UpdatePortal.sh
(you will probably have to tweak these depending on how youve set up your repos)

These go in the devToolCachePath directory:
CustomersInstalledHotfixes.sh
ExistingHotfixesForLpe.sh
LpesResolvedByHotfix.sh

GitLogin.bat goes in the devToolCachePath, repoDir, and repoDirPortal directories

Add "Hotfix.sh" and "GitLogin.bat" to your Git 'exclude' file (I committed mine as an example) which is in the repoDirPortal/.git/info directory

