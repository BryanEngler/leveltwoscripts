#!/bin/bash
 
LOCALBRANCH=$(git symbolic-ref --short -q HEAD)
YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"Set local branch"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"to track remote branch"$ENDCOLOR $LIGHTPURPLE"upstream/"$ENDCOLOR
read TARGETBRANCH

git branch --set-upstream-to=upstream/$TARGETBRANCH $LOCALBRANCH

echo -e $YELLOW"Local branch"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"is now set up track remote branch"$ENDCOLOR $LIGHTPURPLE"upstream/$TARGETBRANCH"$ENDCOLOR