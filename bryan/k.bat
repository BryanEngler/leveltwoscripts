@echo off
rem backs up one directory. or X directories if you supply an argument


IF "%1"=="" GOTO NO_ARGS
IF "%2"=="" GOTO 1_ARG
GOTO END

:NO_ARGS
cd ..
GOTO END

:1_ARG
SET /a i=0

:loop
IF %i%==%1 GOTO END
cd ..
SET /a i=%i%+1
GOTO LOOP

:end
