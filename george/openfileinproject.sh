#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

subl ~/repos/$1 ; subl -w $(find ~/repos/$1 -iname $2)