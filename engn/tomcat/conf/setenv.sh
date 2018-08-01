#!/bin/bash
SERVER_NAME=$INSTANCE_NAME
SERVER_TYPE=$SERVER_PROFILE
export SERVER_NAME SERVER_TYPE
DATE=`date +%Y%m%d%H%M`

export CATALINA_OPTS="$CATALINA_OPTS -Dfile.encodig=UTF8 -Duser.timezone=GMT+9"
export CATALINA_OPTS="$CATALINA_OPTS -DWEBSQUARE_HOME=/usr/local/tomcat/webapps/ROOT/WEB-INF/websquare_home"
export CATALINA_OPTS="$CATALINA_OPTS -Denv=$SERVER_TYPE"
export CATALINA_OPTS="$CATALINA_OPTS -Duser.language=ko"
export CATALINA_OPTS="$CATALINA_OPTS -Dlogback.configurationFile=/sorc/applications/swam/WEB-INF/classes/logback.xml"
export CATALINA_OPTS="$CATALINA_OPTS -Djava.awt.headless=true"
#export CATALINA_OPTS="$CATALINA_OPTS -DjvmRoute=$INSTANCE_NAME"
export CATALINA_OPTS="$CATALINA_OPTS -DjvmRoute=waffulap01"

#file permission setting 
export UMASK="022"
# tomcat Native library setting
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/engn/tomcat/nativelib/lib
export LD_LIBRARY_PATH
DATE=`date +%Y%m%d%H%M`
#JAVA_HOME=/engn/jdk1.8.0_112
CATALINA_OPTS="$CATALINA_OPTS -D$SERVER_NAME -server -d64"
CATALINA_OPTS="$CATALINA_OPTS -Xms2048m -Xmx2048m -XX:NewSize=512m -XX:MaxNewSize=512m"
CATALINA_OPTS="$CATALINA_OPTS -XX:SurvivorRatio=8"
CATALINA_OPTS="$CATALINA_OPTS -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m"
CATALINA_OPTS="$CATALINA_OPTS -verbose:gc -Xloggc:/logs/tomcat/$INSTANCE_NAME/gclog/$SERVER_NAME-gc.log" #if JDK is SUN JDK
###############################
# GC Type config
###############################
#ParallelGC Type Config
#CATALINA_OPTS="$CATALINA_OPTS -XX:+UseParallelGC"
#CATALINA_OPTS="$CATALINA_OPTS -XX:InitiatingHeapOccupancyPercent=90 -XX:ParallelGCThreads=20 -XX:MaxGCPauseMillis=200"

#ParallelOldGC Type Config
#CATALINA_OPTS="$CATALINA_OPTS -XX:+UseParallelOldGC"
#CATALINA_OPTS="$CATALINA_OPTS -XX:InitiatingHeapOccupancyPercent=90 -XX:ParallelGCThreads=20 -XX:MaxGCPauseMillis=200"

#G1GC Type1 Config
#CATALINA_OPTS="$CATALINA_OPTS -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions"
#CATALINA_OPTS="$CATALINA_OPTS -XX:InitiatingHeapOccupancyPercent=90 -XX:ParallelGCThreads=20 -XX:MaxGCPauseMillis=200"
#CATALINA_OPTS="$CATALINA_OPTS -XX:G1ReservePercent=10 -XX:G1HeapRegionSize=32m"

#G1GC Type2 Config
#CATALINA_OPTS="$CATALINA_OPTS -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+G1SummarizeConcMark"
#CATALINA_OPTS="$CATALINA_OPTS -XX:InitiatingHeapOccupancyPercent=90 -XX:ParallelGCThreads=20 -XX:MaxGCPauseMillis=200"
#CATALINA_OPTS="$CATALINA_OPTS -XX:G1ReservePercent=10 -XX:G1HeapRegionSize=32m"

#CMSGC Type Config
CATALINA_OPTS="$CATALINA_OPTS -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+UseCMSInitiatingOccupancyOnly"
CATALINA_OPTS="$CATALINA_OPTS -XX:CMSInitiatingOccupancyFraction=90 -XX:ConcGCThreads=20 -XX:MaxGCPauseMillis=200"
################################################
CATALINA_OPTS="$CATALINA_OPTS -XX:+PrintGCDetails"
CATALINA_OPTS="$CATALINA_OPTS -XX:+PrintGCTimeStamps"
CATALINA_OPTS="$CATALINA_OPTS -XX:+PrintHeapAtGC"
CATALINA_OPTS="$CATALINA_OPTS -XX:+PrintGCDateStamps"
CATALINA_OPTS="$CATALINA_OPTS -XX:+DisableExplicitGC -XX:MaxDirectMemorySize=512m"
CATALINA_OPTS="$CATALINA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
CATALINA_OPTS="$CATALINA_OPTS -XX:HeapDumpPath=/logs/tomcat/$INSTANCE_NAME/gclog/$SERVER_NAME-pid.hprof_$DATE"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote=false"
export CATALINA_OPTS
##########################################################
