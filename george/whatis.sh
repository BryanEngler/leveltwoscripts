#!/bin/bash

if [ "$1" = "gpr" ]
	then
		echo "git pull-request -b REVIEWER/REPOSITORY:BRANCH -h YOU/YOUR_REPOSITORY:YOUR_BRANCH"
elif [ "$1" = "sn" ] || [ "$1" = "sortnumerically" ]
	then
		echo "sort --version-sort"

elif [ -z "$1" ]
	then
		echo "whatis will display the generic command that is associated with argument alias"
fi