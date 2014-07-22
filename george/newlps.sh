#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
LIGHTRED="\033[1;31m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"What is the LPS number?: "$ENDCOLOR
read LPSNUMBER
echo -en $YELLOW"Which version of Liferay (i.e. ee-6.1.x, ee-6.2.x, master)?: "$ENDCOLOR
read DEVBRANCHVERSION

if [ -z "$DEVBRANCHVERSION" ] || [ "$DEVBRANCHVERSION" == "master" ]
	then
		echo -en $LIGHTRED"No version entered; using "$ENDCOLOR $LIGHTPURPLE"upstream/master"$ENDCOLOR $LIGHTRED"as default \n"$ENDCOLOR
		git checkout -b LPS-$LPSNUMBER upstream/master
	else
		git checkout -b LPS-$LPSNUMBER-$DEVBRANCHVERSION upstream/$DEVBRANCHVERSION
fi
 
echo -e $YELLOW"You are now on branch"$ENDCOLOR $LIGHTCYAN"$(git symbolic-ref --short -q HEAD)"$ENDCOLOR
echo -e $YELLOW"Running git status"$ENDCOLOR

git status