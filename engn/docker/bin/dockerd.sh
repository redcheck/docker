#!/bin/sh
#run as root

DOCKER_ENGN=/engn/docker
DOCKER_RUN=/sorc/docker/run
$DOCKER_ENGN/docker -d -g $DOCKER_RUN -p $DOCKER_RUN/docker.pid &
