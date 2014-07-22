#!/bin/bash

LIGHTCYAN="\033[1;36m"
YELLOW="\033[1;33m"
ENDCOLOR="\033[0m"

echo -e $YELLOW"Formatting line endings in file(s) from Windows to Unix."$ENDCOLOR
echo -en $YELLOW"Which file(s) do you want to format? "$ENDCOLOR
read FILENAME

dos2unix -k -o $FILENAME

echo -e $YELLOW"Finished formatting"$ENDCOLOR $LIGHTCYAN"$FILENAME"$ENDCOLOR