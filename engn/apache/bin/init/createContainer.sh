#!/bin/sh
#run as midadm
SERVICE_NAME=swam
CONTAINER_NAME=swamdw01
PORT_SERVICE=80

PATH_LOG=/logs/apache/$CONTAINER_NAME

#PORT_AJP=8009

MSG_PREFIX="[SYSTEM]:"
MSG_PROMPT="$MSG_PREFIX Are you sure? [y/n]"

if [ "$1" = "" ] ; then
        echo "$MSG_PREFIX using default service code : $SERVICE_NAME"
else
	SERVICE_NAME=$1
        echo "$MSG_PREFIX using service code : $SERVICE_NAME"
fi

if [ "$2" = "" ] ; then
        echo "$MSG_PREFIX using default container name : $CONTAINER_NAME"
else
	CONTAINER_NAME=$2
        echo "$MSG_PREFIX using container name : $CONTAINER_NAME"
fi

if [ "$3" = "" ] ; then
        echo "$MSG_PREFIX using default service port : $PORT_SERVICE"
else
        PORT_SERVICE=$3
fi


export SERVICE_NAME
export CONTAINER_NAME
export PORT_SERVICE
#export PORT_AJP


CREATE_CMD="/engn/docker/docker run -d"
CREATE_CMD="$CREATE_CMD --name $CONTAINER_NAME "
CREATE_CMD="$CREATE_CMD -u 3001:3000 "
CREATE_CMD="$CREATE_CMD -p $PORT_SERVICE:8000 "
CREATE_CMD="$CREATE_CMD -v /sorc/webdocs/${SERVICE_NAME}web:/usr/local/apache2/htdocs "
CREATE_CMD="$CREATE_CMD -v $PATH_LOG:/usr/local/apache2/logs "
CREATE_CMD="$CREATE_CMD -v /engn/apache/conf/httpd.conf:/usr/local/apache2/conf/httpd.conf "
CREATE_CMD="$CREATE_CMD -v /engn/apache/conf/httpd-jk.conf:/usr/local/apache2/conf/extra/httpd-jk.conf "
CREATE_CMD="$CREATE_CMD -v /engn/apache/conf/workers.properties:/usr/local/apache2/conf/extra/workers.properties "
CREATE_CMD="$CREATE_CMD -v /engn/apache/conf/uriworkermap.properties:/usr/local/apache2/conf/extra/uriworkermap.properties "
CREATE_CMD="$CREATE_CMD -v /engn/apache/conf/mod_jk.so:/usr/local/apache2/modules/mod_jk.so "
CREATE_CMD="$CREATE_CMD httpd:2.4.29"



echo $MSG_PREFIX Create a container as $CONTAINER_NAME with port $PORT_SERVICE, $PORT_AJP
echo $MSG_PREFIX $CREATE_CMD


read -p "${MSG_PROMPT}" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Create container $CONTAINER_NAME with $PORT_SERVICE , $PORT_AJP ports
	mkdir -p $PATH_LOG
	mkdir -p $PATH_LOG/access
	mkdir -p $PATH_LOG/error
	mkdir -p $PATH_LOG/jk
	$CREATE_CMD

	echo Creating container $CONTAINER_NAME has been completed.
fi
