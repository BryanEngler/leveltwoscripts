#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"What is the LPP number?: "$ENDCOLOR
read LPPNUMBER
echo -en $YELLOW"Which version of Liferay (i.e. 6110, 6120, 6130, 6210)?:"$ENDCOLOR
read BASEBRANCHVERSION

git checkout -b fix-pack-LPP-$LPPNUMBER fix-pack-base-$BASEBRANCHVERSION
 
echo -e $YELLOW"You are now on branch"$ENDCOLOR $LIGHTCYAN"$(git symbolic-ref --short -q HEAD)"$ENDCOLOR
echo -e $YELLOW"Running git status"$ENDCOLOR

git status