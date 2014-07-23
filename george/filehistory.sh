#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

if [ -z "$1" ]
	then
		echo -e $YELLOW"no arguments entered (i.e. '"$ENDCOLOR$LIGHTCYAN"fh REPOSITORY/BRANCH FILENAME.EXTENSION"$ENDCOLOR$YELLOW"')"$ENDCOLOR

elif [[ "$1" == *.* ]]
	then
		echo -e $YELLOW"Searching in current repository and current branch for"$ENDCOLOR $LIGHTCYAN"$(find . -iname $2)"$ENDCOLOR
		gitk $(find . -iname $2)

elif [ -z "$2" ]
	then
		echo -e $YELLOW"Searching in current repository and current branch for"$ENDCOLOR $LIGHTCYAN"$(find . -iname $1)"$ENDCOLOR
		gitk $(find . -iname $1)

else
	echo -e $YELLOW"Searching in $1 for"$ENDCOLOR $LIGHTCYAN"$(find . -iname $2)"$ENDCOLOR
	gitk $1 $(find . -iname $2)

fi