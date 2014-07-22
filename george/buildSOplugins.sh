#!/bin/bash

ENDCOLOR="\033[0m"
LIGHTCYAN="\033[1;36m"
YELLOW="\033[1;33m"

T="$(date +%s%N)"

echo -e $YELLOW"Building SO plugins"$ENDCOLOR

echo -e $YELLOW"\nBuilding portal-compat-shared jar"$ENDCOLOR
cd shared/portal-compat-shared/ ; ant all
echo -e $YELLOW"\nBuilding calendar-portlet"$ENDCOLOR
cd ../../portlets/calendar-portlet/ ; ant war
echo -e $YELLOW"\nBuilding chat-portlet"$ENDCOLOR
cd ../chat-portlet/ ; ant war
echo -e $YELLOW"\nBuilding contacts-portlet"$ENDCOLOR
cd ../contacts-portlet/ ; ant war
echo -e $YELLOW"\nBuilding events-display-portlet"$ENDCOLOR
cd ../events-display-portlet/ ; ant war
echo -e $YELLOW"\nBuilding microblogs-portlet"$ENDCOLOR
cd ../microblogs-portlet/ ; ant war
echo -e $YELLOW"\nBuilding notifications-portlet"$ENDCOLOR
cd ../notifications-portlet/ ; ant war
echo -e $YELLOW"\nBuilding private-messaging-portlet"$ENDCOLOR
cd ../private-messaging-portlet/ ; ant war
echo -e $YELLOW"\nBuilding so-announcements-portlet"$ENDCOLOR
cd ../so-announcements-portlet/ ; ant war
echo -e $YELLOW"\nBuilding so-configurations-portlet"$ENDCOLOR
cd ../so-configurations-portlet/ ; ant war
echo -e $YELLOW"\nBuilding so-portlet"$ENDCOLOR
cd ../so-portlet/ ; ant war
echo -e $YELLOW"\nBuilding tasks-portlet"$ENDCOLOR
cd ../tasks-portlet/ ; ant war
echo -e $YELLOW"\nBuilding wysiwyg-portlet"$ENDCOLOR
cd ../wysiwyg-portlet/ ; ant war
echo -e $YELLOW"\nBuilding so-theme"$ENDCOLOR
cd ../../themes/so-theme/ ; ant war
echo -e $YELLOW"\nBuilding so-hook"$ENDCOLOR
cd ../../hooks/so-hook/ ; ant war
echo -e $YELLOW"\nBuilding so-activities-hook"$ENDCOLOR
cd ../so-activities-hook/ ; ant war
echo -e $YELLOW"\nBuilding sharepoint-hook"$ENDCOLOR
cd ../sharepoint-hook/ ; ant war
echo -e $YELLOW"\nBuilding portal-compat-hook"$ENDCOLOR
cd ../portal-compat-hook/ ; ant war
echo -e $YELLOW"\nBuilding documentum-hook"$ENDCOLOR
cd ../documentum-hook/ ; ant war
echo -e $YELLOW"\nBuilding deploy-listener-hook"$ENDCOLOR
cd ../deploy-listener-hook/ ; ant war
cd ../../

T="$(($(date +%s%N)-T))"
SECONDS="$((T/1000000000))"
MINUTES="$((SECONDS/60%60))"

echo -e $YELLOW"\nFinished building SO plugins"$ENDCOLOR
echo -en $YELLOW"Total time:"$ENDCOLOR 

if [ "$MINUTES" -le "1" ]
	then
		echo -en $LIGHTCYAN"$MINUTES minute "$ENDCOLOR
	else
		echo -en $LIGHTCYAN"$MINUTES minutes "$ENDCOLOR
fi

echo -e $YELLOW"and"$ENDCOLOR $LIGHTCYAN"$((SECONDS%60)) seconds"$ENDCOLOR