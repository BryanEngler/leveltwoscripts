#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

START="<name>"
END="</name>"

echo -en $YELLOW"What is the LPE number?: "$ENDCOLOR
read LPENUMBER

grep -r --include "*.xml" --exclude "index.xml" "$LPENUMBER" /home/georgechi/fp-dev-tool/cache/6110/ > tmp1.txt
grep -r --include "*.xml" --exclude "index.xml" "$LPENUMBER" /home/georgechi/fp-dev-tool/cache/6120/ > tmp2.txt

while read line
do
	IFS=' ' read -r first string <<< "$line"

	echo "${first%?}" >> tmp3.txt
done < tmp1.txt

while read line
do
	IFS=' ' read -r first string <<< "$line"

	echo "${first%?}" >> tmp3.txt
done < tmp2.txt

while read line
do
	grep -o "$START.*$END" $line > tmp4.txt

	while read line
	do
		foo=${line#$START}
		foo=${foo%$END}
		echo "${foo}"
	done < tmp4.txt
done < tmp3.txt

rm -rf tmp1.txt
rm -rf tmp2.txt
rm -rf tmp3.txt
rm -rf tmp4.txt