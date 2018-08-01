#!/bin/sh
#run as midadm
CONTAINER_NAME=swamda11
PORT_SERVICE=8080
PORT_AJP=8009

MSG_PREFIX="[SYSTEM]:"
MSG_PROMPT="$MSG_PREFIX Are you sure? [y/n]"

if [ "$1" = "" ] ; then
	CONTAINER_NAME=dswaws01
        echo "$MSG_PREFIX using default container name : $CONTAINER_NAME"
else
	CONTAINER_NAME=$1
fi

if [ "$2" = "" ] ; then
        echo "$MSG_PREFIX using default service port : $PORT_SERVICE"
else
        PORT_SERVICE=$2
fi


if [ "$3" = "" ] ; then
        echo "$MSG_PREFIX using default ajp port : $PORT_AJP"
else
        PORT_AJP=$3
fi

echo

export CONTAINER_NAME
export PORT_SERVICE
export PORT_AJP



#echo $CONTAINER_NAME
#echo $PORT_SERVICE
#echo $PORT_AJP


echo $MSG_PREFIX Create a container as $CONTAINER_NAME with port $PORT_SERVICE, $PORT_AJP

read -p "${MSG_PROMPT}" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Create container $CONTAINER_NAME with $PORT_SERVICE , $PORT_AJP ports
fi
