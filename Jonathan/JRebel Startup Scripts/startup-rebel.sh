#!/bin/sh

JAVA_OPTS="-javaagent:C:\Program Files\JRebel\jrebel.jar $JAVA_OPTS"
exec catalina.sh start "$@"