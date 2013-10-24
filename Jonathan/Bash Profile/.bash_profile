# Reload .bash_profile
alias bp='. ~/.bash_profile'

# Reload scripts
alias cps='cp C:/Users/liferay/Scripts/* "C:/Program Files (x86)/Git/bin"'

# Ant commands
alias ad='ant deploy'
alias fs='ant format-source'

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
alias gpum='git pull upstream master'
alias gpom='git push origin master'
alias grm='git rebase master'
alias gs='git status'

# Git directories
alias r6010='cd /e/Repositories/6010'
alias r6011='cd /e/Repositories/6011'
alias r6012='cd /e/Repositories/liferay-portal-ee-6.0.12'
alias r60x='cd /e/Repositories/liferay-portal-ee-6.0.x'
alias r6110='cd /e/Repositories/liferay-portal-ee-6.1.10'
alias r6120='cd /e/Repositories/liferay-portal-ee-6.1.20'
alias r6130='cd /e/Repositories/liferay-portal-ee-6.1.30'
alias r61x='cd /e/Repositories/liferay-portal-ee-6.1.x'
alias rpl='cd /e/Repositories/liferay-plugins'
alias rple='cd /e/Repositories/liferay-plugins-ee'
alias rt='cd /e/Repositories/liferay-portal'

# Change Directory
alias cu='cd ..'
alias im='cd portal-impl'
alias sr='cd portal-service'
alias wb='cd portal-web'

#Git Pull Request
alias gitpr='/c/Users/Liferay/Scripts/git-pull-request-git-bash.py'

# Git functions
function gls() {
	git ls-files | grep -i $1 | xargs "/c/Program Files/Sublime Text 2/sublime_text.exe"&
}

function glsv() {
	vim `git ls-files | grep -i $1`
}

function glog() {
	git ls-files | grep -i $1 | xargs gitk&
}

function gp() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin $BRANCH
}

function gpf() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin $BRANCH --force
}

# Portal Properties
alias pp='"/c/Program Files/Sublime Text 2/sublime_text.exe" /e/Repositories/liferay-portal/portal-impl/src/portal.properties'

# Program commands
alias firefox='"/c/Program Files (x86)/Mozilla Firefox/firefox.exe"'
alias sub='"/c/Program Files/Sublime Text 2/sublime_text.exe"&'
alias subreq='"/c/Program Files/Sublime Text 2/sublime_text.exe" fix-pack-requirements.txt&'