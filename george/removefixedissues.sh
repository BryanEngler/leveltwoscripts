#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

if [ ! -f clientremainingfixes.txt ]
	then
		echo -e $YELLOW"The file"$ENDCOLOR $LIGHTCYAN"clientremainingfixes.txt"$ENDCOLOR $YELLOW"does not exist. Created file..."$ENDCOLOR

    	tail -n +2 clientfixedissues.txt > tmpcfi1.txt
		tail -n +2 tmpcfi1.txt > tmpcfi2.txt
		tail -n +2 tmpcfi2.txt > tmpcfi3.txt
		tail -n +2 tmpcfi3.txt > tmpcfi4.txt
		tail -n +2 tmpcfi4.txt > tmpcfi5.txt
		tr ',' '\n' < tmpcfi5.txt > clientremainingfixes.txt
fi

tail -n +2 hotfixfixedissues.txt > tmpcfi7.txt
tail -n +2 tmpcfi7.txt > tmpcfi8.txt
tr ',' '\n' < tmpcfi8.txt > tmpcfi9.txt

while read line
do
	IFS=' ' read -r first string <<< "$line"

	if ! grep -q "$first" tmpcfi9.txt
		then
			echo $line >> tmpremainingfixes.txt
	fi
done < clientremainingfixes.txt

rm -rf tmpcfi1.txt
rm -rf tmpcfi2.txt
rm -rf tmpcfi3.txt
rm -rf tmpcfi4.txt
rm -rf tmpcfi5.txt
rm -rf tmpcfi7.txt
rm -rf tmpcfi8.txt
rm -rf tmpcfi9.txt

cp tmpremainingfixes.txt ./clientremainingfixes.txt

rm -rf tmpremainingfixes.txt

echo -e $YELLOW"Displaying updated list of client's remaining fixes..."$ENDCOLOR

while read line
do
	echo $line
done < clientremainingfixes.txt

echo -e $YELLOW"The file"$ENDCOLOR $LIGHTCYAN"'clientremainingfixes.txt'"$ENDCOLOR $YELLOW"has been updated and saved. It is located in your current working directory."$ENDCOLOR