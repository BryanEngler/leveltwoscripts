
PS1='\n[BASH] \T - \w `

git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]
	then 
		echo "|"
fi

` $(git log --pretty=%h -n 1 2>nul) `

git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]
	then
		echo "|"
fi

``
git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]
	then
		git status > C:/Users/liferay/Desktop/Bryan/commands/tmp/xstat.txt 2>nul

		if [ "$(grep "Unmerged" C:/Users/liferay/Desktop/Bryan/commands/tmp/xstat.txt)" == "# Unmerged paths:" ]
			then
				echo "\e[1;34m$(__git_ps1)\e[0m"

		elif [ "$(grep "Untracked" C:/Users/liferay/Desktop/Bryan/commands/tmp/xstat.txt)" == "# Untracked files:" ]
			then echo "\e[1;31m$(__git_ps1)\e[0m"

		elif [ "$(grep "staged" C:/Users/liferay/Desktop/Bryan/commands/tmp/xstat.txt)" == "# Changes not staged for commit:" ]
			then
				echo "\e[1;33m$(__git_ps1)\e[0m"

		elif [ "$(grep "committed" C:/Users/liferay/Desktop/Bryan/commands/tmp/xstat.txt)" == "# Changes to be committed:" ]
			then
				echo "\e[32m$(__git_ps1)\e[0m"

		else
			echo "\e[1;37m$(__git_ps1)\e[0m"

		fi
fi

`\n \$ '


if [ "$(pwd)" == "/d/Repos/liferay-portal" ]
	then
		echo -ne "\e]0;Portal Master\007";
fi

alias load=". ~/.bash_profile"
alias reload="bash -l"

alias aa="ant all"
alias ac="ant compile"
alias ad="ant deploy"
alias adf="ant deploy-fast"
alias af="ant format-source"
alias aw="ant war"
alias k=". k"
alias cda="cd D:/Repos/alloy-ui; echo -ne \"\\e]0;Alloy\\007\""
alias cdc="cd C:/Users/liferay/Desktop/Bryan/commands; echo -ne \"\\e]0;Commands\\007\""
alias cdl="cd D:/Repos/liferay-plugins; echo -ne \"\\e]0;Plugins Master\\007\""
alias cdl2="cd D:/Repos/liferay-plugins-2; echo -ne \"\\e]0;Plugins 2\\007\""
alias cdl60="cd D:/Repos/liferay-plugins-60x; echo -ne \"\\e]0;Plugins 60x\\007\""
alias cdl61="cd D:/Repos/liferay-plugins-61x; echo -ne \"\\e]0;Plugins 61x\\007\""
alias cdl62="cd D:/Repos/liferay-plugins-62x; echo -ne \"\\e]0;Plugins 62x\\007\""
alias cdl70="cd D:/Repos/liferay-plugins-70x; echo -ne \"\\e]0;Plugins 70x\\007\""
alias cdl6012="cd D:/Repos/liferay-plugins-6012; echo -ne \"\\e]0;Plugins 6012\\007\""
alias cdl6110="cd D:/Repos/liferay-plugins-6110; echo -ne \"\\e]0;Plugins 6110\\007\""
alias cdl6120="cd D:/Repos/liferay-plugins-6120; echo -ne \"\\e]0;Plugins 6120\\007\""
alias cdl6130="cd D:/Repos/liferay-plugins-6130; echo -ne \"\\e]0;Plugins 6130\\007\""
alias cdl6210="cd D:/Repos/liferay-plugins-6210; echo -ne \"\\e]0;Plugins 6210\\007\""
alias cdp="cd D:/Repos/liferay-portal; echo -ne \"\\e]0;Portal Master\\007\""
alias cdp2="cd D:/Repos/liferay-portal-2; echo -ne \"\\e]0;Portal 2\\007\""
alias cdp60="cd D:/Repos/liferay-portal-60x; echo -ne \"\\e]0;Portal 60x\\007\""
alias cdp61="cd D:/Repos/liferay-portal-61x; echo -ne \"\\e]0;Portal 61x\\007\""
alias cdp62="cd D:/Repos/liferay-portal-62x; echo -ne \"\\e]0;Portal 62x\\007\""
alias cdp70="cd D:/Repos/liferay-portal-70x; echo -ne \"\\e]0;Portal 70x\\007\""
alias cdp6012="cd D:/Repos/liferay-portal-6012; echo -ne \"\\e]0;Portal 6012\\007\""
alias cdp6110="cd D:/Repos/liferay-portal-6110; echo -ne \"\\e]0;Portal 6110\\007\""
alias cdp6120="cd D:/Repos/liferay-portal-6120; echo -ne \"\\e]0;Portal 6120\\007\""
alias cdp6130="cd D:/Repos/liferay-portal-6130; echo -ne \"\\e]0;Portal 6130\\007\""
alias cdp6210="cd D:/Repos/liferay-portal-6210; echo -ne \"\\e]0;Portal 6210\\007\""
alias cds="cd D:/Repos/leveltwoscripts; echo -ne \"\\e]0;leveltwoscripts\\007\""
alias cdj="cd D:/Liferay/JiraC/src"
alias cdi="cd portal-impl"
alias cdw="cd portal-web"
alias ed="explorer ."
alias ga="git add"
alias gaa="git add -A"
alias gbi="git bisect"
alias gbv="git bisect view &"
alias gcaa="git commit --amend --all"
alias gca="git commit --amend"
alias gcd="git clean -d"
alias gcf="git config --edit &"
alias gcfg="git config --global --edit &"
alias gch="git cherry-pick"
alias gcp="git cherry-pick --no-commit"
alias gdf="git diff"
alias gf="git fetch upstream; pushBranches"
alias gft="git fetch upstream --tags"
alias gg="git gui"
alias gmt="git mergetool"
alias gp='BRANCH=$(git rev-parse --abbrev-ref HEAD); git push origin $BRANCH -f'
alias gpp='BRANCH=$(git rev-parse --abbrev-ref HEAD); git push pr $BRANCH -f'
alias gr="git reset"
alias grbc="git rebase --continue"
alias gs="git status"
alias fpr="st fix-pack-requirements.txt"
alias fprc="st fix-pack-resolved-conflicts.txt"
alias fpfi="st fix-pack-fixed-issues.txt"
alias fpi="st fix-pack-includes.txt"
alias fpe="st fix-pack-excludes.txt"


function glog() {
	git ls-files | grep -i $1 | xargs gitk $2 &
}

function gmu() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git merge upstream/$BRANCH
}
