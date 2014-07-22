#!/bin/bash
 
LOCALBRANCH=$(git symbolic-ref --short -q HEAD)
REMOTETRACKEDBRANCH=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD) origin/mainline)
YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
LIGHTRED="\033[1;31m"
ENDCOLOR="\033[0m"
MASTER="master"
UPSTREAMMASTER="upstream/master"
CURRENTDIRECTORY=${PWD##*/}
PLUGINSEE="pluginsee"
 
if [ -z "$REMOTETRACKEDBRANCH" ] 
    then
        echo -e $LIGHTRED"$LOCALBRANCH is not tracking a remote branch"$ENDCOLOR
        echo -e $YELLOW"Pushing"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"to origin"$ENDCOLOR
        git push origin $LOCALBRANCH
    else
        echo -e  $YELLOW"Local branch"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"is tracking remote branch"$ENDCOLOR $LIGHTPURPLE"$REMOTETRACKEDBRANCH"$ENDCOLOR

        if [ "$LOCALBRANCH" = "$MASTER" ]
            then
                echo -e $YELLOW"Fetching and merging changes to"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR
                git pull
            else
                echo -e $YELLOW"Fetching and rebasing changes to"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR
                git fetch upstream
                git rebase $REMOTETRACKEDBRANCH
        fi  

        echo -e $YELLOW"Pushing"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"to origin"$ENDCOLOR
        git push origin $LOCALBRANCH

        if [ "$REMOTETRACKEDBRANCH" = "$UPSTREAMMASTER" ] && [ "$CURRENTDIRECTORY" != "$PLUGINSEE" ]
            then
                echo -e $YELLOW"Pushing"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR $YELLOW"to portal"$ENDCOLOR
                git push portal $LOCALBRANCH
        fi
fi