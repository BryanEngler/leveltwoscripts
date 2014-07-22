#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

START="<fixed-issues>"
END="</fixed-issues>"

echo -en $YELLOW"What is the hotfix number?: "$ENDCOLOR
read HOTFIXNUMBER
echo -en $YELLOW"Which version of Liferay (i.e. 6110, 6120)?: "$ENDCOLOR
read VERSION

if [ -z "$VERSION" ] # if $VERSION is blank
	then
		echo -e $LIGHTCYAN"Found:"$ENDCOLOR

		grep --color=always "hotfix-$HOTFIXNUMBER" ~/fp-dev-tool/cache/hotfix-list.txt 
	else

		echo -en $YELLOW"Save list to text file? [y/n] "$ENDCOLOR
		read saveList

		echo -e $LIGHTCYAN"Found:"$ENDCOLOR

		grep --color=always "hotfix-$HOTFIXNUMBER-$VERSION" ~/fp-dev-tool/cache/hotfix-list.txt

		echo -e $LIGHTCYAN"Fixed issues:"$ENDCOLOR

		grep -o "$START.*$END" ~/fp-dev-tool/cache/$VERSION/fix-pack-hotfix-$HOTFIXNUMBER-$VERSION.xml > tmpfixedissues.txt # grep between strings $START and $END (inclusive) and save to tmp file

		while read line
		do
			foo=${line#$START}
			foo=${foo%$END}
			echo "${foo}" >> tmplistunsorted.txt
		done < tmpfixedissues.txt

		rm -rf tmpfixedissues.txt

		tr ',' '\n' < tmplistunsorted.txt > tmplistunsorted2.txt

		rm -rf tmplistunsorted.txt

		sort --version-sort -f tmplistunsorted2.txt > tmplistunsorted3.txt

		while read line
		do
			echo $line
		done < tmplistunsorted3.txt

		tr '\n' ',' < tmplistunsorted3.txt > tmplistunsorted4.txt

		sed 's/,$//' tmplistunsorted4.txt > tmphotfixfixedissues.txt

		if [[ $saveList =~ ^([yY][eE][sS]|[yY]|[1])$ ]] # if user wants to SAVE LIST OF FIXED ISSUES TO TEXT FILE
			then
				cp tmphotfixfixedissues.txt ./hotfixfixedissues.txt

				echo -e "hotfix-$HOTFIXNUMBER-$VERSION fixed issues:\n " | cat - hotfixfixedissues.txt > temp && mv temp hotfixfixedissues.txt

				sed -i -e '$a\' hotfixfixedissues.txt

				echo -e $YELLOW"A copy of this list has been added to"$ENDCOLOR $LIGHTCYAN"'hotfixfixedissues.txt'"$ENDCOLOR $YELLOW"which is located in your current working directory."$ENDCOLOR		
		fi

		rm -rf tmplistunsorted2.txt
		rm -rf tmplistunsorted3.txt
		rm -rf tmplistunsorted4.txt
		rm -rf tmphotfixfixedissues.txt
fi