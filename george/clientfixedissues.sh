# we need user input for client and liferay version
# run clienthotfixes.sh to get list of all non-blacklisted hofixes for clienthotfixes
# trim lines so that the file is just a list of hotfix names (i.e. hotfix-1-6110) ; remove all hotfixes that do not match version
# loop through each hotfix and run hotfixinfosearch.sh code to print LPE list

#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

START="<fixed-issues>"
END="</fixed-issues>"

echo -en $YELLOW"Customer: "$ENDCOLOR
read CUSTOMER

echo -en $YELLOW"Which version of Liferay (i.e. 6110, 6120)?: "$ENDCOLOR
read VERSION

echo -en $YELLOW"Save list to text file? [y/n] "$ENDCOLOR
read saveList

####################################################################################################################################
# GET LIST OF ALL CLIENT HOTFIXES
####################################################################################################################################

grep "${CUSTOMER^^}" ~/fp-dev-tool/cache/hotfix-list.txt > tmpallfixes.txt

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

while read line
do
	IFS=' ' read -r first string <<< "$line"
	echo $first >> tmplistofallnonblacklistedfixes.txt
done < tmpallnonblacklistedfixes.txt

grep -E "$VERSION" tmplistofallnonblacklistedfixes.txt >> tmplistofallnonblacklistedfixeswithversion.txt

####################################################################################################################################
# LOOP THROUGH tmplistofallnonblacklistedfixeswithversion.txt TO GET LIST OF ALL FIXED ISSUES
####################################################################################################################################

while read line
do
	grep -o "$START.*$END" ~/fp-dev-tool/cache/$VERSION/fix-pack-$line.xml >> tmpfixedissues_unformatted.txt
done < tmplistofallnonblacklistedfixeswithversion.txt

while read line
do
	foo=${line#$START}
	foo=${foo%$END}
	echo "${foo}" >> tmpfixedissues_formatted.txt
done < tmpfixedissues_unformatted.txt

####################################################################################################################################
# FORMAT LIST (EACH LPE ON NEW LINE)
####################################################################################################################################

tr ',' '\n' < tmpfixedissues_formatted.txt > tmpallfixedissues.txt

####################################################################################################################################
# REMOVE DUPLICATES AND FORMAT LIST
####################################################################################################################################

sort -u tmpallfixedissues.txt > clientfixedissues_unformatted.txt
sort --version-sort -f clientfixedissues_unformatted.txt > clientfixedissues_unformatted2.txt

####################################################################################################################################
# DISPLAY LIST IN TERMINAL
####################################################################################################################################

echo -e $YELLOW"Removing blacklisted hotfixes and fixes..."$ENDCOLOR
echo -e $YELLOW"Removing duplicates..."$ENDCOLOR
echo -e $YELLOW"Sorting numerically..."$ENDCOLOR
echo -e $YELLOW"Displaying fixed issues..."$ENDCOLOR

while read line
do
	echo $line
done < clientfixedissues_unformatted2.txt

####################################################################################################################################
# FORMAT LIST
####################################################################################################################################

tr '\n' ',' < clientfixedissues_unformatted2.txt > tmpclientfixedissues.txt

sed 's/,$//' tmpclientfixedissues.txt > tmpfinalclientfixedissues.txt

####################################################################################################################################
# DELETE TMP FILES
####################################################################################################################################

if [[ $saveList =~ ^([yY][eE][sS]|[yY])$ ]] # if user wants to SAVE LIST OF FIXES TO TEXT FILE
	then
		cp tmpfinalclientfixedissues.txt ./clientfixedissues.txt

		echo -e "- Sorted numerically\n" | cat - clientfixedissues.txt > temp && mv temp clientfixedissues.txt
		echo -e "- Removed duplicates" | cat - clientfixedissues.txt > temp && mv temp clientfixedissues.txt
		echo -e "- Removed blacklisted hotfixes and fixes" | cat - clientfixedissues.txt > temp && mv temp clientfixedissues.txt
		echo -e "Listing all of ${CUSTOMER^^}-$VERSION's fixed issues:" | cat - clientfixedissues.txt > temp && mv temp clientfixedissues.txt

		sed -i -e '$a\' clientfixedissues.txt

		echo -e $YELLOW"A copy of this list has been added to"$ENDCOLOR $LIGHTCYAN"'clientfixedissues.txt'"$ENDCOLOR $YELLOW"which is located in your current working directory."$ENDCOLOR
fi

rm -rf tmpallfixes.txt
rm -rf tmpallnonblacklistedfixes.txt
rm -rf tmplistofallnonblacklistedfixes.txt
rm -rf tmplistofallnonblacklistedfixeswithversion.txt
rm -rf tmpfixedissues_unformatted.txt
rm -rf tmpallfixedissues.txt
rm -rf tmpfixedissues_formatted.txt
rm -rf clientfixedissues_unformatted.txt
rm -rf tmpclientfixedissues.txt
rm -rf clientfixedissues_unformatted2.txt
rm -rf tmpfinalclientfixedissues.txt