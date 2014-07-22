#!/bin/bash

YELLOW="\033[1;33m"
LIGHTCYAN="\033[1;36m"
LIGHTPURPLE="\033[1;35m"
ENDCOLOR="\033[0m"

START="<fixed-issues>"
END="</fixed-issues>"

echo -e $YELLOW"6110's alloy-ui.zip release commit:"$ENDCOLOR
unzip -z ~/repos/6110/portal-web/third-party/alloy-1.5.0.zip

echo -e $YELLOW"6120's alloy-ui.zip release commit:"$ENDCOLOR
unzip -z ~/repos/6120/portal-web/third-party/alloy-1.5.0.zip

echo -e $YELLOW"6130's alloy-ui.zip release commit:"$ENDCOLOR
unzip -z ~/repos/6130/portal-web/third-party/alloy-1.5.2.zip

echo -e $YELLOW"6210's alloy-ui.zip release commit:"$ENDCOLOR
unzip -z ~/repos/6210/portal-web/third-party/alloy-2.0.0.zip