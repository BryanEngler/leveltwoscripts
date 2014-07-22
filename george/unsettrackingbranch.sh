#!/bin/bash
 
LOCALBRANCH=$(git symbolic-ref --short -q HEAD)
YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

git config --unset branch.$LOCALBRANCH.remote

echo -e $YELLOW"Local branch"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"is no longer tracking a remote branch"$ENDCOLOR