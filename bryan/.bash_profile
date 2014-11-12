
PS1='\n[BASH] \T - \w `

git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]; then 
	echo "|"
fi

` $(git log --pretty=%h -n 1 2>nul) `

git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]; then
	echo "|"
fi

``
git rev-parse --is-inside-work-tree 1>nul 2>nul

if [ $? == 0 ]; then
	tmpStatusFile="C:/Users/liferay/Desktop/Bryan/commands/tmp/status.txt"

	git status > $tmpStatusFile 2>nul

	if [ "$(grep "Unmerged" $tmpStatusFile)" != "" ]; then
		echo "\e[1;34m$(__git_ps1)\e[0m"

	elif [ "$(grep "Untracked" $tmpStatusFile)" != "" ]; then 
		echo "\e[1;31m$(__git_ps1)\e[0m"
	
	elif [ "$(grep "staged" $tmpStatusFile)" != "" ]; then
		echo "\e[1;33m$(__git_ps1)\e[0m"
	
	elif [ "$(grep "committed" $tmpStatusFile)" != "" ]; then
		echo "\e[32m$(__git_ps1)\e[0m"
	
	elif [ "$(grep "behind" $tmpStatusFile)" != "" ]; then
		echo "\e[35m$(__git_ps1)\e[0m"
	
	else
		echo "\e[1;37m$(__git_ps1)\e[0m"
	fi
fi

`\n \$ '


if [ "$(pwd)" == "/d/Repos/liferay-portal" ]; then
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
alias cdp6010="cd D:/Repos/liferay-portal-6010; echo -ne '\e]0;Portal 6010\007'"
alias cdp6011="cd D:/Repos/liferay-portal-6011; echo -ne '\e]0;Portal 6011\007'"
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
alias gbg="git branch -a | grep $@"
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
alias gf="git fetch upstream --no-tags; pushBranches.sh"
alias gfu="git fetch upstream --no-tags"
#alias gfa="git fetch upstream; pushBranches.sh; gftq &"
#alias gft="git fetch git@github.com:zsoltbalogh/liferay-portal-ee.git --tags && git fetch upstream --tags"
#alias gftq="git fetch git@github.com:zsoltbalogh/liferay-portal-ee.git --tags --quiet && git fetch upstream --tags --quiet"
alias ggcf="git gc"
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

	if [ $# -eq 2 ]; then
		git log --pretty=format:"%h" --grep="$1" $2 | 
		tac.sh > $tempacp
		trimblank.sh $tempacp
		cat $tempacp | 
		
		while read ID; do
			echo
			git cherry-pick $ID

			if [ $? != 0 ]; then 
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

		while read ID; do
			echo
			git cherry-pick $ID
			
			if [ $? != 0 ]; then 
				echo
				echo Cherry Pick FAILED
				exit
			fi
		done

		rm $tempacp
	fi
}

function bpr() {
	read -p "Enter LPS (LPS-XXXXX):" lps

	echo Select Backport Version:
	version="6.2_EE_(fix_pack) 6.1_EE_GA3_(fix_pack) 6.0.x_(branch_commit_only) 6.2_EE_(testing_branch_only) 6.1_EE_GA3_(testing_branch_only) Plugin:_6.2_EE Plugin:_6.1_EE_GA2,_GA3 Plugin:_6.1_EE_GA1 Plugin:_6.0_EE_SP2 Plugin:_6.2.x_(development) Plugin:_6.1.x_(development) Plugin:_6.0.x_(development)"

	select choice in $version; do
		version=$choice
		break
	done

	if [ $version == "6.2_EE_(fix_pack)" ]; then
		version="16327"
		prefix="62x"

	elif [ $version == "6.1_EE_GA3_(fix_pack)" ]; then
		version="16325"
		prefix="61x"

	elif [ $version == "6.0.x_(branch_commit_only)" ]; then
		version="16323"
		prefix="60x"
	
	elif [ $version == "Plugin:_6.2_EE" ]; then
		version="17010"
		prefix="6210"
	
	elif [ $version == "Plugin:_6.1_EE_GA2,_GA3" ]; then
		version="17011"
		prefix="6120"
	
	elif [ $version == "Plugin:_6.1_EE_GA1" ]; then
		version="17012"
		prefix="6110"
	
	elif [ $version == "Plugin:_6.0_EE_SP2" ]; then
		version="17013"
		prefix="6012"
	
	elif [ $version == "Plugin:_6.2.x_(development)" ]; then
		version="17222"
		prefix="62x"
	
	elif [ $version == "Plugin:_6.1.x_(development)" ]; then
		version="17223"
		prefix="61x"
	
	elif [ $version == "Plugin:_6.0.x_(development)" ]; then
		version="17224"
		prefix="60x"
	fi

	echo
	echo Creating Issue...

	jira -a createIssue --project BPR --type "Backport Request" --summary "$prefix $lps" --priority Minor --custom customfield_14424:$version,customfield_11531:Support

	read -p "Enter BPR (BPR-XXXX):" bpr

	jira -a linkIssue --issue $lps --toIssue $bpr --link Relationship
	jira -a progressIssue --issue $bpr --step "Awaiting for Original Fix"
}

function gfb() {
	echo
	echo Select User:
	users="liferay zsoltbalogh other"

	select choice in $users; do
		user=$choice
		break
	done

	if [ $user == "other" ]; then
		read -p "Enter User:" user
	fi

	echo
	echo Select Repo:
	repos="liferay-portal liferay-portal-ee liferay-plugins liferay-plugins-ee leveltwoscripts alloy-ui other"

	select choice in $repos; do
		repo=$choice
		break
	done

	if [ $repo == "other" ]; then
		read -p "Enter Repo:" repo
	fi

	echo
	read -p "Enter Their Branch or Tag:" theirBranch
	
	echo
	read -p "Use the same name for your branch? (y/n):" sameBranch

	if [ $sameBranch == 'n' ]; then
		echo
		read -p "Enter the new branch name:" myBranch
		echo Fetching branch...
		git fetch git@github.com:$user/$repo.git $theirBranch:$myBranch --no-tags
	else
		echo Fetching branch...
		git fetch git@github.com:$user/$repo.git $theirBranch:$theirBranch --no-tags
	fi
}

function gk() {
	gitk $@ &
}

function gkg() {
	gitk --grep=$@ &
}

function gkl() {
	git ls-files | grep -i $1 | xargs gitk $2 &
}

function gl() 
{
	git log --pretty=format:"  %h   %C(cyan bold)%an    %C(yellow bold)%s    %CresetComitted: %cr" $@
}

function glg() {
	git log --pretty=format:"  %h   %C(cyan bold)%an    %C(yellow bold)%s    %CresetComitted: %cr" --grep=$@
}

function gm() {
	CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git merge upstream/$CURRENT_BRANCH
}

function gp() {
	if [ $# -eq 0 ]; then 
		CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
		git push origin $CURRENT_BRANCH -f
	else 
		git push origin $1 -f
	fi
}

function gpp() {
	if [ $# -eq 0 ]; then 
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

	select choice in $repos; do
		repo=$choice
		break
	done

	if [ $repo == "other" ]; then
		read -p "Enter Repo:" repo
	fi

	echo
	echo Select Reviewer:
	reviewers="jonathanmccann dustinryerson iamgeorgechi other"

	select choice in $reviewers; do
		reviewer=$choice
		break
	done

	if [ $reviewer == "other" ]; then
		read -p "Enter Reviewer:" reviewer
	fi

	echo
	echo Select Reviewer\'s Base Branch:
	reviewersBaseBranches="master ee-7.0.x ee-6.2.x ee-6.1.x ee-6.0.x test-fix-pack-base-6210 other"

	select choice in $reviewersBaseBranches; do
		reviewersBaseBranch=$choice
		break
	done

	if [ $reviewersBaseBranch == "other" ]; then
		read -p "Enter Base Branch:" reviewersBaseBranch
	fi

	echo
	echo Select Head Branch:
	headBranches="current-->$(git rev-parse --abbrev-ref HEAD) other"

	select choice in $headBranches; do
		headBranch=$choice
		break
	done

	if [ $headBranch == "current-->$(git rev-parse --abbrev-ref HEAD)" ]; then
		headBranch=$(git rev-parse --abbrev-ref HEAD)
	fi

	if [ $headBranch == "other" ]; then
		read -p "Enter Head Branch:" headBranch
	fi

	echo
	read -p "Use \"$headBranch\" as message? (y/n):" useHeadBranch

	if [ $useHeadBranch == "y" ]; then
		hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch -m "$headBranch"
	else
		read -p "Enter Message:" message

		if [ message == "" ]; then
			hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch
		else
			hub pull-request -b $reviewer/$repo:$reviewersBaseBranch -h BryanEngler/$repo:$headBranch -m "$message"
		fi
	fi
}

function gti() {
	read -p "Enter Title:" title
	echo -ne "\e]0;$title\007"
}

function gwc() 
{
	git whatchanged --pretty=format:"  %h  %C(yellow bold) %s    %C(cyan bold)%an    %CresetComitted: %cr" $@
}

function Hotfix-VERSION-LPP() {
	if [ $1 == "6210-sp7" ]; then
		cd D:/Repos/liferay-portal-6210
		echo -ne "\e]0;Portal 6210\007"

	elif [ $1 == "6130-sp3" ]; then
		cd D:/Repos/liferay-portal-6130
		echo -ne "\e]0;Portal 6130\007"

	else
		cd D:/Repos/liferay-portal-$1
		echo -ne "\e]0;Portal $1\007"
	fi
	
	git checkout -b LPP-$2-$1 fix-pack-base-$1
}

function k() {
	#backs up one directory. or X directories if you supply an argument

	if [ $# -eq 0 ]; then
		cd ..
	else
		for ((i=0; i<$1; i++)); do 
			cd ..
		done
	fi
}

function st() {
	"C:\Program Files\Sublime Text 2\sublime_text.exe" $1
}
