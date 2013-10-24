#!/bin/bash
export JAVA_OPTS="-javaagent:'C:\Program Files\JRebel\jrebel.jar' $JAVA_OPTS"
`dirname $0`/catalina.sh $@