@echo off
set JAVA_OPTS=-javaagent:"C:\Program Files\JRebel\jrebel.jar" %JAVA_OPTS%
call "%~dp0\startup.bat" %*