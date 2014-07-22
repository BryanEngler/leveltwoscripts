#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

echo -en $YELLOW"Customer: "$ENDCOLOR
read CUSTOMER

echo -en $YELLOW"Which version of Liferay (i.e. 6110, 6120)?: "$ENDCOLOR
read VERSION

echo -en $YELLOW"Save list to text file? [y/n] "$ENDCOLOR
read saveList

####################################################################################################################################
# GET LIST OF ALL CLIENT HOTFIXES
####################################################################################################################################

grep "${CUSTOMER^^}" ~/fp-dev-tool/cache/hotfix-list.txt > tmpallfixes.txt # force user input to UPPERCASE; save list of all fixes (including blacklisted hotfixes) to tmp file

####################################################################################################################################
# FILTER LIST TO GET ALL NON-BLACKLISTED HOTFIXES
####################################################################################################################################

while read line
do
	IFS=' ' read -r first string <<< "$line"

	if ! grep -q "$first" /home/georgechi/fp-dev-tool/cache/blacklist.txt # cross-match list all of fixes tmp file (line 31) against blacklist.txt line by line
		then
			echo $line >> tmpallnonblacklistedfixes.txt # if hotfix is not blacklisted, save to another tmp file
	fi
done < tmpallfixes.txt

####################################################################################################################################
# FILTER AND FORMAT LIST TO GET ALL NON-BLACKLISTED HOTFIXES WITH CORRECT VERSION
####################################################################################################################################

if [ -z "$VERSION" ] 
	then
		cp tmpallnonblacklistedfixes.txt tmpfinal.txt
	else
		while read line
		do
			IFS=' ' read -r first string <<< "$line"
			echo $first >> tmplistofallnonblacklistedfixes.txt
		done < tmpallnonblacklistedfixes.txt

		grep -E "$VERSION" tmpallnonblacklistedfixes.txt >> tmpfinal.txt
fi

####################################################################################################################################
# DISPLAY LIST IN TERMINAL
####################################################################################################################################

echo -e $YELLOW"Displaying hotfixes..."$ENDCOLOR

while read line
do
	echo $line
done < tmpfinal.txt

####################################################################################################################################
# SAVE FILE
####################################################################################################################################

if [[ $saveList =~ ^([yY][eE][sS]|[yY])$ ]] # if user wants to SAVE LIST OF FIXES TO TEXT FILE
	then
		cp tmpfinal.txt allnonblacklistedfixes.txt

		echo -e "Listing all of ${CUSTOMER^^}'s non-blacklisted fixes:\n " | cat - allnonblacklistedfixes.txt > temp && mv temp allnonblacklistedfixes.txt

		echo -e $YELLOW"A copy of this list has been added to"$ENDCOLOR $LIGHTCYAN"'allnonblacklistedfixes.txt'"$ENDCOLOR $YELLOW"which is located in your current working directory."$ENDCOLOR
fi

####################################################################################################################################
# DELETE TMP FILES
####################################################################################################################################

rm -rf tmpallfixes.txt
rm -rf tmpallnonblacklistedfixes.txt
rm -rf tmplistofallnonblacklistedfixes.txt
rm -rf tmpfinal.txt