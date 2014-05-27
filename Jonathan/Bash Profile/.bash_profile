# Reload .bash_profile
alias bp='. ~/.bash_profile'

# Reload scripts
alias cps='cp C:/Users/liferay/Scripts/* "C:/Program Files (x86)/Git/bin"'

# Ant commands
alias aa='ant all'
alias ad='ant deploy'
alias fs='ant format-source'
alias awar='ant -f build-dist.xml zip-portal-war'
alias adep='ant -f build-dist.xml zip-portal-dependencies'

# Git commands
alias ga='git add'
alias gb='git branch'
alias gbi='git bisect'
alias gbiv='git bisect visualize'
alias gc='git checkout'
alias gcom='git commit'
alias gcf='git checkout --force'
alias gd='git diff'
alias gdt='git difftool'
alias gf='git fetch upstream'
alias gpum='git pull upstream master'
alias gpom='git push origin master'
alias gr='git rebase'
alias grm='git rebase master'
alias gs='git status'
alias graph="git log --graph --all --pretty=format:'%Cred%h%Creset - %Cgreen(%cr)%Creset %s%C(yellow)%d%Creset' --abbrev-commit --date=relative"

# Git directories
alias r6010='cd /e/Repositories/6010'
alias r6011='cd /e/Repositories/6011'
alias r6012='cd /e/Repositories/liferay-portal-ee-6.0.12'
alias r60x='cd /e/Repositories/liferay-portal-ee-6.0.x'
alias r6110='cd /e/Repositories/liferay-portal-ee-6.1.10'
alias r6120='cd /e/Repositories/liferay-portal-ee-6.1.20'
alias r6130='cd /e/Repositories/liferay-portal-ee-6.1.30'
alias r6210='cd /e/Repositories/liferay-portal-ee-6.2.10'
alias r61x='cd /e/Repositories/liferay-portal-ee-6.1.x'
alias r62x='cd /e/Repositories/liferay-portal-ee-6.2.x'
alias rpl='cd /e/Repositories/liferay-plugins'
alias rple='cd /e/Repositories/liferay-plugins-ee'
alias rt='cd /e/Repositories/liferay-portal'
alias rte='cd /e/Repositories/liferay-portal-ee'

# Change Directory
alias cu='cd ..'
alias im='cd portal-impl'
alias sr='cd portal-service'
alias wb='cd portal-web'

#Git Pull Request
alias gitpr='/c/Users/Liferay/Scripts/git-pull-request-git-bash.py'

# Git functions
function bi() {
	cd portal-impl
	ant deploy
	cd ..
	r
}

function bs() {
	cd portal-service
	ant deploy
	cd ..
	r
}

function bu() {
	cd portal-util
	ant deploy
	cd ..
	r
}

function bw() {
	cd portal-web
	ant deploy
	cd ..
	r
}

function gls() {
	git ls-files | grep -i $1 | xargs "/c/Program Files/Sublime Text 2/sublime_text.exe"&
}

function glsv() {
	vim `git ls-files | grep -i $1`
}

function glog() {
	git ls-files | grep -i $1 | xargs gitk&
}

function gm() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git merge upstream/$BRANCH
}

function gp() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin $BRANCH
}

function gpf() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin $BRANCH --force
}

#Plugins EE requires the branch to be passed in (IE 6.1.x)
function pr() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)

	PWD=$(basename `pwd`)

	case $PWD in
		liferay-portal-ee-6.0.x)
			echo -e "\n""\033[32mPull Request for 6.0.x\033[0m"
			firefox https://github.com/jonathanmccann/liferay-portal-ee/pull/new/hhuijser:ee-6.0.x...jonathanmccann:$BRANCH
			;;
		liferay-portal-ee-6.1.x)
			echo -e "\n""\033[32mPull Request for 6.1.x\033[0m"
			firefox https://github.com/jonathanmccann/liferay-portal-ee/pull/new/hhuijser:ee-6.1.x...jonathanmccann:$BRANCH
			;;
		liferay-portal-ee-6.2.x)
			echo -e "\n""\033[32mPull Request for 6.2.x\033[0m"
			firefox https://github.com/jonathanmccann/liferay-portal-ee/pull/new/hhuijser:ee-6.2.x...jonathanmccann:$BRANCH
			;;	
		liferay-portal)
			echo -e "\n""\033[32mPull Request for Master\033[0m"
			firefox https://github.com/jonathanmccann/liferay-portal/pull/new/hhuijser:master...jonathanmccann:$BRANCH
			;;
		liferay-plugins-ee)
			echo -e "\n""\033[32mPull Request for Plugins $1\033[0m"
			firefox https://github.com/jonathanmccann/liferay-plugins-ee/pull/new/hhuijser:ee-$1...jonathanmccann:$BRANCH
			;;
		liferay-plugins)
			echo -e "\n""\033[32mPull Request for Plugins Master\033[0m"
			firefox https://github.com/jonathanmccann/liferay-plugins/pull/new/hhuijser:master...jonathanmccann:$BRANCH
			;;
		*)
	esac
}

function test() {
	ant test-class -Dtest.class=$1
}

function lps() {
	ticket_finder LPS-$1
}

function aui() {
	ticket_finder AUI-$1
}

function ticket_finder() {
	if [[ -n $1 ]]; then
		local log_var=$(git log --pretty=format:"%s" --grep=$1);

		if [[ -n $log_var ]]; then
			gitk --grep=$1 &
			#--color-words
		else
			echo 'No ticket found.';
		fi;
	fi;
}

function firefox() {
	"/c/Program Files (x86)/Mozilla Firefox/firefox.exe" $1
}

# Program commands
alias sub='"/c/Program Files/Sublime Text 2/sublime_text.exe"&'
alias subreq='"/c/Program Files/Sublime Text 2/sublime_text.exe" fix-pack-requirements.txt&'
alias diffmerge='"C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe"'