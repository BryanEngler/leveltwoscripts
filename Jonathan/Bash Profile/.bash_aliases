GITHUB_USERNAMES="adolfopa, brandizzi, dustinryerson, epgarcia, hhuijser, holatuwol, igorspasic, johnnyhowey, jonmak08, jorgeferrer, juliocamarero, marcellustavares, matethurzo, mhan810, rotty3000, sergiogonzalez, shinnlok, shuyangzhou, topolik"

OAUTHTOKEN=""

export ANT_OPTS="-Xmx2048m -XX:MaxPermSize=1024m"

export JAVA_HOME=/opt/java/jdk1.7.0_67

export JRE_HOME=/opt/java/jdk1.7.0_67/jre

export PATH=$PATH:$HOME/scripts

# Reload bashrc
alias bp='source ~/.bashrc'

# Edit .bash_aliases
alias ba='sub ~/.bash_aliases'

# Apt-get
alias sag='sudo apt-get'
alias sagi='sudo apt-get install'

# Convenience
alias ll='ls -la'

# Sublime
alias sub='sublime-text'

# Hub
alias git=hub

# Ant commands
alias aa='ant all'
alias ad='ant deploy'
alias adf='ant deploy-fast'
alias fs='ant format-source'
alias awar='ant -f build-dist.xml zip-portal-war'
alias adep='ant -f build-dist.xml zip-portal-dependencies'

# Git commands
alias ga='git add'
alias gb='git branch'
alias gbi='git bisect'
alias gbiv='git bisect visualize'
alias gbr='git browse'
alias gc='git checkout'
alias gcom='git commit'
alias gcomaa='git commit -a --amend'
alias gcomam='git commit -am'
alias gcf='git checkout --force'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdt='git difftool'
alias gf='git fetch upstream'
alias gpum='git pull upstream master'
alias gpom='git push origin master'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grm='git rebase master'
alias gs='git status'
alias graph="git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen(%cr)%Creset %s%C(yellow)%d%Creset' --abbrev-commit --date=relative -10"
alias gwc='git whatchanged -p'

# Git directories
alias r6010='cd ~/repositories/6010'
alias r6011='cd ~/repositories/6011'
alias r6012='cd ~/repositories/liferay-portal-ee-6.0.12'
alias r60x='cd ~/repositories/liferay-portal-ee-6.0.x'
alias r6110='cd ~/repositories/liferay-portal-ee-6.1.10'
alias r6120='cd ~/repositories/liferay-portal-ee-6.1.20'
alias r6130='cd ~/repositories/liferay-portal-ee-6.1.30'
alias r6210='cd ~/repositories/liferay-portal-ee-6.2.10'
alias r61x='cd ~/repositories/liferay-portal-ee-6.1.x'
alias r62x='cd ~/repositories/liferay-portal-ee-6.2.x'
alias r70x='cd ~/repositories/liferay-portal-ee-7.0.x'
alias rpl='cd ~/repositories/liferay-plugins'
alias rple='cd ~/repositories/liferay-plugins-ee'
alias rp60x='cd ~/repositories/liferay-plugins-ee-6.0.x'
alias rp6120='cd ~/repositories/liferay-plugins-ee-6.1.20'
alias rp61x='cd ~/repositories/liferay-plugins-ee-6.1.x'
alias rp6210='cd ~/repositories/liferay-plugins-ee-6.2.10'
alias rp62x='cd ~/repositories/liferay-plugins-ee-6.2.x'
alias rp70x='cd ~/repositories/liferay-plugins-ee-7.0.x'
alias rt='cd ~/repositories/liferay-portal'
alias rte='cd ~/repositories/liferay-portal-ee'

# Change Directory
alias cu='cd ..'
alias im='cd portal-impl'
alias sr='cd portal-service'
alias pw='cd portal-web'

# MySQL
alias mysql='mysql --user=root --password=test'

function mysqlc() {
	echo "create database $2" | mysql -u root -ptest

	mysqldump -u root -ptest $1 | mysql -u root -ptest $2
}

# Change Java versions
function java7() {
	sudo update-alternatives --install "/usr/bin/java" "java" "/opt/java/jdk1.7.0_71/bin/java" 1
	sudo update-alternatives --set java /opt/java/jdk1.7.0_71/bin/java
	sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/jdk1.7.0_71/bin/javac" 1
	sudo update-alternatives --set javac /opt/java/jdk1.7.0_71/bin/javac
	export JAVA_HOME=/opt/java/jdk1.7.0_71
}

function java8() {
	sudo update-alternatives --install "/usr/bin/java" "java" "/opt/java/jdk1.8.0_31/bin/java" 1
	sudo update-alternatives --set java /opt/java/jdk1.8.0_31/bin/java
	sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/jdk1.8.0_31/bin/javac" 1
	sudo update-alternatives --set javac /opt/java/jdk1.8.0_31/bin/javac
	export JAVA_HOME=/opt/java/jdk1.8.0_31
}

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
	git ls-files | grep -i $1 | xargs sublime-text&
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

#
# Functions for reviewing pull requests
#

function getLPSOrSOS() {
	echo $1 | grep -i -o '\(LPS\|SOS\)\-[0-9]*'
}

function getPullRequestNumber() {
	echo $1 | grep -i -o '\(\?\:pull-request-\)\?[0-9]*' | head -1
}

function getPullRequestTitleAndBody() {
	#
	# $1 is the LPS number
	#
	# If there is no author (IE current user is sending a new pull request) there will be no body
	#

	AUTHOR=$(gs | grep -io "'.*/" | tr -d "'/")
	BODY=""

	if [[ ! -z "$AUTHOR" ]]
	then
		BODY="/cc @$AUTHOR"
	fi

	MESSAGE="$1

	$BODY"

	echo -n "$MESSAGE"
}

function getReviewerActualName() {
	case "$1" in
		"adolfopa") echo "Adolfo"
			;;
		"brandizzi") echo "Adam"
			;;
		"brianchandotcom") echo "Brian"
			;;
		"dustinryerson") echo "Dustin"
			;;
		"ealonso") echo "Eudaldo"
			;;
		"epgarcia") echo "Eduardo"
			;;
		"hhuijser") echo "Hugo"
			;;
		"holatuwol") echo "Minhchau"
			;;
		"igorspasic") echo "Igor"
			;;
		"ipeychev") echo "Iliyan"
			;;
		"johnnyhowey") echo "Jon"
			;;
		"jonmak08") echo "Jon"
			;;
		"jorgeferrer") echo "Jorge"
			;;
		"juliocamarero") echo "Julio"
			;;
		"marcellustavares") echo "Marcellus"
			;;
		"matethurzo") echo "Mate"
			;;
		"mhan810") echo "Mike"
			;;
		"mikakoivisto") echo "Mika"
			;;
		"rotty3000") echo "Ray"
			;;
		"sergiogonzalez") echo "Sergio"
			;;
		"shinnlok") echo "Shinn"
			;;
		"shuyangzhou") echo "Shuyang"
			;;
		"topolik") echo "Tomáš"
			;;
		*) echo "Invalid choice"
			;;
	esac
}

function getReviewerJIRAName() {
	case "$1" in
		"adolfopa") echo "adolfo.perez"
			;;
		"brandizzi") echo "adam.brandizzi"
			;;
		"brianchandotcom") echo "brian.chan"
			;;
		"dustinryerson") echo "dustin.ryerson"
			;;
		"ealonso") echo "eudaldo.alonso"
			;;
		"epgarcia") echo "eduardo.garcia"
			;;
		"hhuijser") echo "hugo.huijser"
			;;
		"holatuwol") echo "minhchau.dang"
			;;
		"igorspasic") echo "igor.spasic"
			;;
		"ipeychev") echo "iliyan.peychev"
			;;
		"johnnyhowey") echo "jonathan.lee"
			;;
		"jonmak08") echo "jonathan.mak"
			;;
		"jorgeferrer") echo "jorge.ferrer"
			;;
		"juliocamarero") echo "julio.camarero"
			;;
		"marcellustavares") echo "marcellus.tavares"
			;;
		"matethurzo") echo "mate.thurzo"
			;;
		"mhan810") echo "michael.han"
			;;
		"mikakoivisto") echo "koivimik"
			;;
		"rotty3000") echo "rotty"
			;;
		"sergiogonzalez") echo "sergio.gonzalez"
			;;
		"shinnlok") echo "shinn.lok"
			;;
		"shuyangzhou") echo "shuyang.zhou"
			;;
		"topolik") echo "tomas.polesovsky"
			;;
		*) echo "Invalid choice"
			;;
	esac
}

function gitprclose() {
	# $1 is the repository of the person being reviewed (liferay-portal, liferay-portal-ee, etc.)
	# $2 is the pull request number
	curl --silent --request PATCH -u $OAUTHTOKEN:x-oauth-basic --data '{"state":"closed"}' https://api.github.com/repos/jonathanmccann/$1/pulls/$2 > /dev/null
}

function gitprsubmitcomment() {
	#
	# $1 is the next reviewer
	# $2 is the link to the next pull request
	# $3 is the repository of the person being reviewed
	# $4 is the pull request number
	#
	# Models: https://api.github.com/repos/jonathanmccann/liferay-portal/issues/347/comments
	REVIEWERACTUALNAME=$(getReviewerActualName $1)

	BODY="Reviewed and sent to $REVIEWERACTUALNAME for further review: $2"

	curl --silent -u $OAUTHTOKEN:x-oauth-basic --data '{"body":"'"$BODY"'"}' https://api.github.com/repos/jonathanmccann/$3/issues/$4/comments > /dev/null
}

function gitprf() {
	# Get the current directory
	PWD=$(basename `pwd`)

	# Get pull request data from GitHub based on the current directory
	if [[ "$PWD" == liferay-portal ]]
	then
		git checkout https://github.com/jonathanmccann/liferay-portal/pull/$1
	elif [[ "$PWD" == liferay-plugins ]]
	then
		git checkout https://github.com/jonathanmccann/liferay-plugins/pull/$1
	elif [[ "$PWD" == liferay-portal-ee-* ]]
	then
		git checkout https://github.com/jonathanmccann/liferay-portal-ee/pull/$1
	elif [[ "$PWD" == liferay-plugins-ee-* ]]
	then
		git checkout https://github.com/jonathanmccann/liferay-plugins-ee/pull/$1
	fi

	# Get the current branch
	BRANCH=$(git rev-parse --abbrev-ref HEAD)

	# Get the LPS or SOS to populate the pull request title
	LPS=$(getLPSOrSOS $BRANCH)

	# Open the corresponding pull request and JIRA LPS/SOS in the browser
	firefox https://issues.liferay.com/browse/$LPS
	# firefox https://github.com/jonathanmccann/liferay-portal/pull/$1

	# JIRA search to open LPP
	# project = LPP and issue in LinkedIssues($LPS)
}

function gitprs() {
	# Get the current directory
	PWD=$(basename `pwd`)

	# Get the current branch
	BRANCH=$(git rev-parse --abbrev-ref HEAD)

	# Get the LPS or SOS to populate the pull request title
	LPS=$(getLPSOrSOS $BRANCH)

	# Get the pull request number
	PULLREQUESTNUMBER=$(getPullRequestNumber $BRANCH)

	if [[ "$PWD" == liferay-portal ]]
	then
		REMOTEBRANCH="master"
		REPO="liferay-portal"
	elif [[ "$PWD" == liferay-plugins ]]
	then
		REMOTEBRANCH="master"
		REPO="liferay-plugins"
	elif [[ "$PWD" == liferay-portal-ee-7.0.x ]]
	then
		REMOTEBRANCH="ee-7.0.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-portal-ee-6.2.x ]]
	then
		REMOTEBRANCH="ee-6.2.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-portal-ee-6.1.x ]]
	then
		REMOTEBRANCH="ee-6.1.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-portal-ee-6.0.x ]]
	then
		REMOTEBRANCH="ee-6.0.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-plugins-ee-7.0.x ]]
	then
		REMOTEBRANCH="ee-7.0.x"
		REPO="liferay-plugins-ee"
	elif [[ "$PWD" == liferay-plugins-ee-6.2.x ]]
	then
		REMOTEBRANCH="ee-6.2.x"
		REPO="liferay-plugins-ee"
	elif [[ "$PWD" == liferay-plugins-ee-6.1.x ]]
	then
		REMOTEBRANCH="ee-6.1.x"
		REPO="liferay-plugins-ee"
	elif [[ "$PWD" == liferay-plugins-ee-6.0.x ]]
	then
		REMOTEBRANCH="ee-6.0.x"
		REPO="liferay-plugins-ee"
	fi

	echo "GitHub Usernames: $GITHUB_USERNAMES"
	echo -n "Enter the reviewer and press [ENTER]: "
	read REVIEWER

	URL=$(git pull-request -m "$(getPullRequestTitleAndBody $LPS)" -b $REVIEWER:$REMOTEBRANCH -h jonathanmccann:$BRANCH)

	echo -n $URL | xclip -selection clipboard

	# Write a comment on the reviewed pull request
	gitprsubmitcomment $REVIEWER $URL $REPO $PULLREQUESTNUMBER

	# Close the reviewed pull request
	gitprclose $REPO $PULLREQUESTNUMBER

	# Push the LPS through the proper workflow
	pushLPSThroughWorkflow $REVIEWER $LPS $URL
}

function gitprsb() {
	# Get the current directory
	PWD=$(basename `pwd`)

	# Get the current branch
	BRANCH=$(git rev-parse --abbrev-ref HEAD)

	# Get the LPS or SOS to populate the pull request title
	LPS=$(getLPSOrSOS $BRANCH)

	# Get the pull request number
	PULLREQUESTNUMBER=$(getPullRequestNumber $BRANCH)

	if [[ "$PWD" == liferay-portal ]]
	then
		REMOTEBRANCH="master"
		REPO="liferay-portal"
	elif [[ "$PWD" == liferay-plugins ]]
	then
		REMOTEBRANCH="master"
		REPO="liferay-plugins"
	elif [[ "$PWD" == liferay-portal-ee-6.2.x ]]
	then
		REMOTEBRANCH="ee-6.2.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-portal-ee-6.1.x ]]
	then
		REMOTEBRANCH="ee-6.1.x"
		REPO="liferay-portal-ee"
	elif [[ "$PWD" == liferay-portal-ee-6.0.x ]]
	then
		REMOTEBRANCH="ee-6.0.x"
		REPO="liferay-portal-ee"
	fi

	git pull-request -m $LPS -b dustinryerson:$REMOTEBRANCH -h jonathanmccann:$BRANCH
}

function pushLPSThroughWorkflow() {
	#
	# $1 is the next reviewer
	# $2 is the LPS/SOS identifier
	# $3 is the next pull request
	#
	REVIEWERJIRANAME=$(getReviewerJIRAName $1)

	jira -a progressIssue --assignee $REVIEWERJIRANAME --issue $2 --step "Code Review Request" --field "customfield_10421" --values $3
}

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

#
# Custom git script. Abandonded in favor of using Hub.
#

#function gitpr() {
#	#
#	# NOTES
#	#
#	# 1. Get comments on a pull request:
#	#		curl -s https://api.github.com/repos/jonathanmccann/liferay-portal/issues/287/comments
#	#
#	# 2. Get pull request description/body:
#	#		curl -s https://api.github.com/repos/jonathanmccann/liferay-portal/pulls/287 | jq '.body'
#	#
#	# 3. Get open pull requests:
#	#		curl -s https://api.github.com/repos/jonathanmccann/liferay-plugins/pulls?state=open | jq '.[] | .number, .url, .title'
#	#
#
#	case "$1" in
#		"fetch") gitprfetch $2
#			;;
#		"view") gitprall
#			;;
#		"comments") gitprcomments $2
#			;;
#		"submit") gitprsubmit
#			;;
#		*) echo "Invalid choice"
#			;;
#	esac
#}
#
#function gitprfetch() {
#	# Get the current directory
#	PWD=$(basename `pwd`)
#
#	# Get pull request data from GitHub based on the current directory
#	if [[ "$PWD" == "liferay-portal" ]]
#	then
#		DATA=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-portal/pulls/$1 | jq '.title, .body, .user.login, .head.ref')
#	elif [[ "$PWD" == "liferay-plugins" ]]
#	then
#		DATA=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-plugins/pulls/$1 | jq '.title, .body, .user.login, .head.ref')
#	elif [[ "$PWD" == "liferay-portal-ee-6.2.x" ]]
#	then
#		DATA=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-portal-ee/pulls/$1 | jq '.title, .body, .user.login, .head.ref')
#	elif [[ "$PWD" == "liferay-plugins-ee" ]]
#	then
#		DATA=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-plugins-ee/pulls/$1 | jq '.title, .body, .user.login, .head.ref')
#	fi
#
#	INVALIDATA='null
#null
#null
#null'
#
#	# See if the pull request is valid
#	if [[ "$DATA" == "$INVALIDATA" ]]
#	then
#		echo "Invalid pull request. Please check the pull request number."
#	else
#		# Initialize counter and read over the data gleaned from GitHub
#		COUNTER=1
#		while read -r line;
#		do
#			case "$COUNTER" in
#			1) TITLE="$line"
#				;;
#			2) BODY="$line"
#				;;
#			3) SENDER="$line"
#				;;
#			4) LPS="$line"
#				;;
#			esac
#
#			COUNTER=$[$COUNTER + 1]
#		done <<< "$DATA"
#
#		# Strip out leading and trailing double quotes
#		TITLE="${TITLE%\"}"
#		TITLE="${TITLE#\"}"
#
#		BODY="${BODY%\"}"
#		BODY="${BODY#\"}"
#
#		SENDER="${SENDER%\"}"
#		SENDER="${SENDER#\"}"
#
#		LPS="${LPS%\"}"
#		LPS="${LPS#\"}"
#
#		# Get the LPS number
#		#LPS="$(echo "$TITLE" | awk '{print $1;}')"
#
#		# Provide information on the pull request to the user
#		echo "Title: $TITLE"
#		echo "Body: $BODY"
#		echo "Sender: $SENDER"
#		echo "Ticket: $LPS"
#
#		# Get the pull request's comments
#		gitprcomments $1
#
#		# Pull down the pull request into a local branch and check it out
#		git fetch origin pull/$1/head:pull-request-$1-$LPS
#		git checkout pull-request-$1-$LPS
#
#		firefox https://issues.liferay.com/browse/$LPS
#		firefox https://github.com/jonathanmccann/liferay-portal/pull/$1
#	fi
#}
#
#function gitprall() {
#	PORTAL=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-portal/pulls?state=open | jq '.[] | .number, .title')
#	PORTALEE=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-portal-ee/pulls?state=open | jq '.[] | .number, .title')
#	PLUGINS=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-plugins/pulls?state=open | jq '.[] | .number, .title')
#	PLUGINSEE=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-plugins-ee/pulls?state=open | jq '.[] | .number, .title')
#
#	echo -e "\033[32mLiferay Portal Pull Requests:\033[0m"
#
#	while read -r PULLREQUESTNUMBER
#	do
#		read -r PULLREQUESTTITLE
#
#		PULLREQUESTTITLE="${PULLREQUESTTITLE%\"}"
#		PULLREQUESTTITLE="${PULLREQUESTTITLE#\"}"
#
#		echo "Pull Request Number: $PULLREQUESTNUMBER"
#		echo -e "Pull Request Title: $PULLREQUESTTITLE\n"
#	done <<< "$PORTAL"
#
#	echo -e "\033[32mLiferay Portal EE Pull Requests:\033[0m"
#
#	while read -r PULLREQUESTNUMBER
#	do
#		read -r PULLREQUESTTITLE
#
#		PULLREQUESTTITLE="${PULLREQUESTTITLE%\"}"
#		PULLREQUESTTITLE="${PULLREQUESTTITLE#\"}"
#
#		echo "Pull Request Number: $PULLREQUESTNUMBER"
#		echo -e "Pull Request Title: $PULLREQUESTTITLE\n"
#	done <<< "$PORTALEE"
#
#	echo -e "\033[32mLiferay Plugins Pull Requests:\033[0m"
#
#	while read -r PULLREQUESTNUMBER
#	do
#		read -r PULLREQUESTTITLE
#
#		PULLREQUESTTITLE="${PULLREQUESTTITLE%\"}"
#		PULLREQUESTTITLE="${PULLREQUESTTITLE#\"}"
#
#		echo "Pull Request Number: $PULLREQUESTNUMBER"
#		echo -e "Pull Request Title: $PULLREQUESTTITLE\n"
#	done <<< "$PLUGINS"
#
#	echo -e "\033[32mLiferay Portal EE Pull Requests:\033[0m"
#
#	while read -r PULLREQUESTNUMBER
#	do
#		read -r PULLREQUESTTITLE
#
#		PULLREQUESTTITLE="${PULLREQUESTTITLE%\"}"
#		PULLREQUESTTITLE="${PULLREQUESTTITLE#\"}"
#
#		echo "Pull Request Number: $PULLREQUESTNUMBER"
#		echo -e "Pull Request Title: $PULLREQUESTTITLE\n"
#	done <<< "$PLUGINSEE"
#}
#
#function gitprcomments() {
#	# Get the current directory
#	PWD=$(basename `pwd`)
#
#	# Get pull request comments from GitHub based on the current directory
#	if [[ "$PWD" == "liferay-portal" ]]
#	then
#		COMMENTS=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-portal/issues/$1/comments | jq '.[] | .user.login, .body')
#	elif [[ "$PWD" == "liferay-plugins" ]]
#	then
#		COMMENTS=$(curl -s https://api.github.com/repos/jonathanmccann/liferay-plugins/issues/$1/comments | jq '.user.login, .body')
#	elif [[ "$PWD" == "liferay-portal-ee" ]]
#	then
#		COMMENTS=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-portal-ee/issues/$1/comments | jq '.user.login, .body')
#	elif [[ "$PWD" == "liferay-plugins-ee" ]]
#	then
#		COMMENTS=$(curl -s -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/jonathanmccann/liferay-plugins-ee/issues/$1/comments | jq '.user.login, .body')
#	fi
#
#	while read -r COMMENTER
#	do
#		read -r COMMENTBODY
#
#		COMMENTER="${COMMENTER%\"}"
#		COMMENTER="${COMMENTER#\"}"
#
#		COMMENTBODY="${COMMENTBODY%\"}"
#		COMMENTBODY="${COMMENTBODY#\"}"
#
#		echo "Commenter: $COMMENTER"
#		echo -e "Body: $COMMENTBODY\n"
#	done <<< "$COMMENTS"
#}
#
#function gitprsubmit() {
#	# Push the current branch up to Origin
#	gpf
#
#	# Get the current directory
#	PWD=$(basename `pwd`)
#
#	# Get the branch (head) name
#	HEAD=$(git rev-parse --abbrev-ref HEAD)
#
#	# Get the body from the user
#	read -p "Please enter in a body: " BODY
#
#	# Send the pull request to GitHub based on the current directory
#	case $PWD in
#		liferay-portal-ee-6.0.x)
#			echo -e "\n""\033[32mPull Request for 6.0.x\033[0m"
#			BASE="ee-6.0.x"
#			curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-portal-ee/pulls
#			;;
#		liferay-portal-ee-6.1.x)
#			echo -e "\n""\033[32mPull Request for 6.1.x\033[0m"
#			BASE="ee-6.1.x"
#			curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-portal-ee/pulls
#			;;
#		liferay-portal-ee-6.2.x)
#			echo -e "\n""\033[32mPull Request for 6.2.x\033[0m"
#			BASE="ee-6.2.x"
#			curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-portal-ee/pulls
#			;;	
#		liferay-portal)
#			echo -e "\n""\033[32mPull Request for Master\033[0m"
#			curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-portal/pulls
#			;;
#		#liferay-plugins-ee)
#		#	echo -e "\n""\033[32mPull Request for Plugins $1\033[0m"
#		#	curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-plugins-ee/pulls
#		#	;;
#		liferay-plugins)
#			echo -e "\n""\033[32mPull Request for Plugins Master\033[0m"
#			BASE="master"
#			curl -H "Content-Type: application/json" --data '{"title":"'"$HEAD"'","head":"jonathanmccann:'"$HEAD"'","base":"'"$BASE"'","body":"'"$BODY"'"}' -u $OAUTHTOKEN:x-oauth-basic https://api.github.com/repos/hhuijser/liferay-plugins/pulls
#			;;
#		*)
#	esac
#}
#
