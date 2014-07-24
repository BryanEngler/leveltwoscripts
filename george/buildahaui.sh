#!/bin/bash

ENDCOLOR="\033[0m"
LIGHTCYAN="\033[1;36m"
YELLOW="\033[1;33m"

echo -e $YELLOW"Building aui src files..."$ENDCOLOR
echo

echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-base"$ENDCOLOR
cd src/aui-base ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-calendar"$ENDCOLOR
cd ../aui-calendar ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-datepicker"$ENDCOLOR
cd ../aui-datepicker ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-dialog"$ENDCOLOR
cd ../aui-dialog ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-image-cropper"$ENDCOLOR
cd ../aui-image-cropper ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-node"$ENDCOLOR
cd ../aui-node ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-overlay"$ENDCOLOR
cd ../aui-overlay ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-paginator"$ENDCOLOR
cd ../aui-paginator ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-portal-layout"$ENDCOLOR
cd ../aui-portal-layout ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-skin-base"$ENDCOLOR
cd ../aui-skin-base ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-toggler"$ENDCOLOR
cd ../aui-toggler ; ant all

echo
echo -e $YELLOW"Building"$ENDCOLOR $LIGHTCYAN"aui-tree"$ENDCOLOR
cd ../aui-tree ; ant all

cd ../..

echo
echo -e $YELLOW"Building modules"$ENDCOLOR
ant build-modules

echo
echo -e $YELLOW"Finished building aui src files"$ENDCOLOR

echo
git status