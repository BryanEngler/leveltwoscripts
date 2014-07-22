#!/bin/bash
REVIEWER="bryanengler dustinryerson hhhuijser holatuwol jonathanmccann other quit"
REPOSITORY="liferay-portal liferay-portal-ee liferay-plugins liferay-plugins-ee alloy-ui other quit"
BRANCH="master ee-6.1.x ee-6.2.x other quit"

LOCALBRANCH=$(git symbolic-ref --short -q HEAD)

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

####################################################################################################################################
# doBranch FUNCTION
####################################################################################################################################
function doBranch {
    echo
    echo -e $YELLOW"Select a branch: "$ENDCOLOR

    select branch in $BRANCH;
    do
        ############################################################################################################################
        # OTHER BRANCH
        ############################################################################################################################
        if [ "$branch" = "other" ]
            then
                echo -en $YELLOW"Name of branch: "$ENDCOLOR
                read newBranch

                echo

                ####################################################################################################################
                # USING SELECTED REVIEWER
                ####################################################################################################################
                if [ -z "$newReviewer" ]
                    then
                        echo -e $YELLOW"Opening pull request to"$ENDCOLOR $LIGHTPURPLE"$rev:$newBranch"$ENDCOLOR $YELLOW"from"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR$YELLOW"..."$ENDCOLOR
                        echo
                        echo -e $YELLOW"Please fill out pull request title/message"$ENDCOLOR
                        hub pull-request -b $rev:$newBranch -h iamgeorgechi:$LOCALBRANCH

                ####################################################################################################################
                # USING NEW REVIEWER
                ####################################################################################################################
                elif [ ! -z "$newReviewer" ]
                    then
                        echo -e $YELLOW"Opening pull request to"$ENDCOLOR $LIGHTPURPLE"$newReviewer:$newBranch"$ENDCOLOR $YELLOW"from"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR$YELLOW"..."$ENDCOLOR
                        echo
                        echo -e $YELLOW"Please fill out pull request title/message"$ENDCOLOR
                        hub pull-request -b $newReviewer:$newBranch -h iamgeorgechi:$LOCALBRANCH

                fi

        ############################################################################################################################
        # QUIT
        ############################################################################################################################
        elif [ "$branch" = "quit" ]
            then
                echo -e $YELLOW"Quitting..."$ENDCOLOR

        ############################################################################################################################
        # BRANCHES
        ############################################################################################################################
        else
            echo -e $YELLOW"You chose:"$ENDCOLOR $LIGHTCYAN"$branch"$ENDCOLOR
            echo

            ####################################################################################################################
            # USING SELECTED REVIEWER AND SELECTED REPOSITORY
            ####################################################################################################################
            if [ -z "$newReviewer" ]
                then
                    echo -e $YELLOW"Opening pull request to"$ENDCOLOR $LIGHTPURPLE"$rev:$branch"$ENDCOLOR $YELLOW"from"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR$YELLOW"..."$ENDCOLOR
                    echo
                    echo -e $YELLOW"Please fill out pull request title/message"$ENDCOLOR
                    hub pull-request -b $rev:$branch -h iamgeorgechi:$LOCALBRANCH

            ####################################################################################################################
            # USING NEW REVIEWER AND SELECTED REPOSITORY
            ####################################################################################################################
            elif [ ! -z "$newReviewer" ]
                then
                    echo -e $YELLOW"Opening pull request to"$ENDCOLOR $LIGHTPURPLE"$newReviewer:$branch"$ENDCOLOR $YELLOW"from"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR$YELLOW"..."$ENDCOLOR
                    echo
                    echo -e $YELLOW"Please fill out pull request title/message"$ENDCOLOR
                    hub pull-request -b $newReviewer:$branch -h iamgeorgechi:$LOCALBRANCH

            fi
        fi
        exit
    done
}

####################################################################################################################################
# BEGINNING MESSAGE
####################################################################################################################################
echo
echo -e $YELLOW"This script will open a pull request from your current local branch:"$ENDCOLOR $LIGHTCYAN"$LOCALBRANCH"$ENDCOLOR
echo -e $YELLOW"(The pull request will automatically match the repositories based on your current local branch)"$ENDCOLOR
echo

####################################################################################################################################
# SELECT A REVIEWER
####################################################################################################################################
echo -e $YELLOW"Select a reviewer: "$ENDCOLOR

select rev in $REVIEWER;
do
    ################################################################################################################################
    # OTHER REVIEWER
    ################################################################################################################################
    if [ "$rev" = "other" ]
        then
            echo -en $YELLOW"GitHub username of reviewer: "$ENDCOLOR
            read newReviewer

            doBranch

    ################################################################################################################################
    # QUIT
    ################################################################################################################################
    elif [ "$rev" = "quit" ]
        then
            echo -e $YELLOW"Quitting..."$ENDCOLOR

    ################################################################################################################################
    # REVIEWERS
    ################################################################################################################################
    else
        echo -e $YELLOW"You chose:"$ENDCOLOR $LIGHTCYAN"$rev"$ENDCOLOR

        doBranch
    
    fi
    exit
done