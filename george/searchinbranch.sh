#!/bin/bash

LOCALBRANCH=$(git symbolic-ref --short -q HEAD)
YELLOW="\033[1;33m"
LIGHTRED="\033[1;31m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"Enter the JIRA ticket: "$ENDCOLOR
read JIRATICKET
echo -en $YELLOW"Search in upstream/"$ENDCOLOR
read TARGETBRANCH

if [ -z "$TARGETBRANCH" ] 
	then
		echo -en $LIGHTRED"No remote branch entered. \n"$ENDCOLOR
		echo -e $YELLOW"Searching for"$ENDCOLOR $LIGHTCYAN"$JIRATICKET"$ENDCOLOR $YELLOW"in local branch"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR
		gitk --grep=${JIRATICKET^^}
	else
		echo -e $YELLOW"Searching for"$ENDCOLOR $LIGHTCYAN"$JIRATICKET"$ENDCOLOR $YELLOW"in"$ENDCOLOR $LIGHTPURPLE"upstream/$TARGETBRANCH"$ENDCOLOR
		gitk --grep=${JIRATICKET^^} upstream/$TARGETBRANCH
fi