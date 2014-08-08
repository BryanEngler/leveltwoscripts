
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
		tmpStatusFile="C:/Users/liferay/Desktop/Bryan/commands/tmp/status.txt"

		git status > $tmpStatusFile 2>nul

		if [ "$(grep "Unmerged" $tmpStatusFile)" != "" ]
			then
				echo "\e[1;34m$(__git_ps1)\e[0m"

		elif [ "$(grep "Untracked" $tmpStatusFile)" != "" ]
			then echo "\e[1;31m$(__git_ps1)\e[0m"

		elif [ "$(grep "staged" $tmpStatusFile)" != "" ]
			then
				echo "\e[1;33m$(__git_ps1)\e[0m"

		elif [ "$(grep "committed" $tmpStatusFile)" != "" ]
			then
				echo "\e[32m$(__git_ps1)\e[0m"

		elif [ "$(grep "behind" $tmpStatusFile)" != "" ]
			then
				echo "\e[35m$(__git_ps1)\e[0m"

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
alias cda="cd D:/Repos/alloy-ui; echo -ne '\e]0;Alloy\007'"
alias cdc="cd C:/Users/liferay/Desktop/Bryan/commands; echo -ne '\e]0;Commands\007'"
alias cdi="cd portal-impl"
alias cdj="cd D:/Liferay/JiraC/src; echo -ne '\e]0;JiraC\007'"
alias cdlts="cd D:/Repos/leveltwoscripts; echo -ne '\e]0;leveltwoscripts\007'"
alias cdl="cd D:/Repos/liferay-plugins; echo -ne '\e]0;Plugins Master\007'"
alias cdl2="cd D:/Repos/liferay-plugins-2; echo -ne '\e]0;Plugins 2\007'"
alias cdl60="cd D:/Repos/liferay-plugins-60x; echo -ne '\e]0;Plugins 60x\007'"
alias cdl61="cd D:/Repos/liferay-plugins-61x; echo -ne '\e]0;Plugins 61x\007'"
alias cdl62="cd D:/Repos/liferay-plugins-62x; echo -ne '\e]0;Plugins 62x\007'"
alias cdl70="cd D:/Repos/liferay-plugins-70x; echo -ne '\e]0;Plugins 70x\007'"
alias cdl6012="cd D:/Repos/liferay-plugins-6012; echo -ne '\e]0;Plugins 6012\007'"
alias cdl6110="cd D:/Repos/liferay-plugins-6110; echo -ne '\e]0;Plugins 6110\007'"
alias cdl6120="cd D:/Repos/liferay-plugins-6120; echo -ne '\e]0;Plugins 6120\007'"
alias cdl6130="cd D:/Repos/liferay-plugins-6130; echo -ne '\e]0;Plugins 6130\007'"
alias cdl6210="cd D:/Repos/liferay-plugins-6210; echo -ne '\e]0;Plugins 6210\007'"
alias cdp="cd D:/Repos/liferay-portal; echo -ne '\e]0;Portal Master\007'"
alias cdp2="cd D:/Repos/liferay-portal-2; echo -ne '\e]0;Portal 2\007'"
alias cdp60="cd D:/Repos/liferay-portal-60x; echo -ne '\e]0;Portal 60x\007'"
alias cdp61="cd D:/Repos/liferay-portal-61x; echo -ne '\e]0;Portal 61x\007'"
alias cdp62="cd D:/Repos/liferay-portal-62x; echo -ne '\e]0;Portal 62x\007'"
alias cdp70="cd D:/Repos/liferay-portal-70x; echo -ne '\e]0;Portal 70x\007'"
alias cdp6012="cd D:/Repos/liferay-portal-6012; echo -ne '\e]0;Portal 6012\007'"
alias cdp6110="cd D:/Repos/liferay-portal-6110; echo -ne '\e]0;Portal 6110\007'"
alias cdp6120="cd D:/Repos/liferay-portal-6120; echo -ne '\e]0;Portal 6120\007'"
alias cdp6130="cd D:/Repos/liferay-portal-6130; echo -ne '\e]0;Portal 6130\007'"
alias cdp6210="cd D:/Repos/liferay-portal-6210; echo -ne '\e]0;Portal 6210\007'"
alias cds="cd portal-service"
alias cdw="cd portal-web"
alias ed="explorer ."
alias fpr="st fix-pack-requirements.txt"
alias fprc="st fix-pack-resolved-conflicts.txt"
alias fpfi="st fix-pack-fixed-issues.txt"
alias fpi="st fix-pack-includes.txt"
alias fpe="st fix-pack-excludes.txt"
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
alias gf="git fetch upstream; pushBranches.sh; gft &"
alias gft="git fetch git@github.com:zsoltbalogh/liferay-portal-ee.git --tags --quiet && git fetch upstream --tags --quiet"
alias gmt="git mergetool"
alias gr="git reset"
alias grbc="git rebase --continue"
alias gs="git status"
alias mys="mysql -u root -ppassword"
alias myt="jira -a getissuelist --filter='Current Issues' --columns=key,'Date due',summary"


function abs() {
	ant build-service-$1
}

function acp() {
	#auto cherry pick commits
	#usage acp [REGEX IN COMMIT MESSAGE TO MATCH] [BRANCH] {limit} - acp LPS-12345 ee-6.1.x 3

	tempacp="C:/Users/liferay/Desktop/Bryan/commands/tmp/tempacpfile.txt"

	if [ $# -eq 2 ]
		then
			git log --pretty=format:"%h" --grep="$1" $2 | 
			tac.sh > $tempacp
			trimblank.sh $tempacp
			cat $tempacp | 
			
			while read ID
				do
					echo
					git cherry-pick $ID

					if [ $? != 0 ]
						then 
							echo
							echo Cherry Pick FAILED
							exit
					fi
				done

			rm $tempacp
		
		else
			git log --pretty=format:"%h" --grep="$1" $2 | 
			head -$3 | 
			tac.sh > $tempacp
			trimblank.sh $tempacp
			cat $tempacp |

			while read ID
				do
					echo
					git cherry-pick $ID
					
					if [ $? != 0 ]
						then 
							echo
							echo Cherry Pick FAILED
							exit
					fi
				done

			rm $tempacp
	fi
}

function gkl() {
	git ls-files | grep -i $1 | xargs gitk $2 &
}

function gm() {
	CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git merge upstream/$CURRENT_BRANCH
}

function gp() {
	if [ $# -eq 0 ]
		then 
			CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
			git push origin $CURRENT_BRANCH -f
		else 
			git push origin $1 -f
	fi
}

function gpp() {
	if [ $# -eq 0 ]
		then 
			CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
			git push pr $CURRENT_BRANCH -f
		else 
			git push pr $1 -f
	fi
}

function gpr() {
	echo
	echo Select Repo:
	repos="liferay-portal liferay-portal-ee liferay-plugins liferay-plugins-ee leveltwoscripts alloy-ui other"

	select choice in $repos;
	do
		repo=$choice
		break
	done

	if [ $repo == "other" ]
		then
			read -p "Enter Repo:" repo
	fi

	echo
	echo Select Reviewer:
	reviewers="jonathanmccann dustinryerson other"

	select choice in $reviewers;
	do
		reviewer=$choice
		break
	done

	if [ $reviewer == "other" ]
		then
			read -p "Enter Reviewer:" reviewer
	fi

	echo
	echo Select Reviewer\'s Base Branch:
	reviewersBaseBranches="master ee-7.0.x ee-6.2.x ee-6.1.x ee-6.0.x test-fix-pack-base-6210 other"

	select choice in $reviewersBaseBranches;
	do
		reviewersBaseBranch=$choice
		break
	done

	if [ $reviewersBaseBranch == "other" ]
		then
			read -p "Enter Base Branch:" reviewersBaseBranch
	fi

	echo
	echo Select Head Branch:
	headBranches="current other"

	select choice in $headBranches;
	do
		headBranch=$choice
		break
	done

	if [ $headBranch == "current" ]
		then
			headBranch=$(git rev-parse --abbrev-ref HEAD)
	fi

	if [ $headBranch == "other" ]
		then
			read -p "Enter Head Branch:" headBranch
	fi

	echo
	read -p "Use \"$headBranch\" as message? (y/n):" useHeadBranch

	if [ $useHeadBranch == "y" ]
		then
			hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch -m "$headBranch"
		else
			read -p "Enter Message:" message

			if [ message == "" ]
				then
					hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch
				else
					hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch -m "$message"
			fi
	fi
}

function Hotfix-LPP-VERSION() {
	cd D:/Repos/liferay-portal-$2
	echo -ne "\e]0;Portal `echo $2`\007"
	git checkout -b LPP-$1-$2 fix-pack-base-$2
}

function Hotfix-LPP-VERSION-SDH() {
	cd D:/Repos/liferay-portal-$2
	echo -ne "\e]0;Portal `echo $2`\007"
	git checkout -b LPP-$1-$2-SDH fix-pack-base-$2
}

function k() {
	#backs up one directory. or X directories if you supply an argument

	if [ $# -eq 0 ]
		then
			cd ..
		else
			for ((i=0; i<$1; i++));
				do 
					cd ..
				done
	fi
}

function st() {
	"C:\Program Files\Sublime Text 2\sublime_text.exe" $1
}
