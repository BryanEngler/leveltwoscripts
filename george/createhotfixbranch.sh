#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"What is the hotfix number?: "$ENDCOLOR
read HOTFIXNUMBER

echo -en $YELLOW"Which version of Liferay (i.e. 6110, 6120)?: "$ENDCOLOR
read VERSION

echo -e $YELLOW"Fetching branch from repository... "$ENDCOLOR
git fetch git@github.com:zsoltbalogh/liferay-portal-ee.git fix-pack-hotfix-$HOTFIXNUMBER-$VERSION:hotfix-$HOTFIXNUMBER-$VERSION

echo -e $YELLOW"Checking out branch..."$ENDCOLOR
git checkout hotfix-$HOTFIXNUMBER-$VERSION
git status

echo -e $YELLOW"You are now on"$ENDCOLOR $LIGHTCYAN"hotfix-$HOTFIXNUMBER-$VERSION"$ENDCOLOR