#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONFIG_DIR=/config/hadaemon
<<<<<<< HEAD
#EXTRA_CMD=""
#EXTRA_CMD2=""

=======
>>>>>>> bc1ba46905f4dd4a454b3d83cbeaebc09037e0da

DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)
COMMTYPE=$(jq --raw-output ".commtype" $CONFIG_PATH)
DEBUGGING=$(jq --raw-output ".debugging" $CONFIG_PATH)

if [ ! -d $CONFIG_DIR ]; then
	mkdir -p $CONFIG_DIR
	cp /etc/appdaemon-example.yaml $CONFIG_DIR/appdaemon.yaml
	cp /etc/apps-example.yaml $CONFIG_DIR/apps.yaml
fi

<<<<<<< HEAD
if [ "$DEBUGGING" = "DEBUG" ]; then
	EXTRA_CMD = "-D DEBUG"
	else
  	  EXTRA_CMD = " "
fi

if [ "$COMMTYPE" = "SSE" ]; then
	EXTRA_CMD2 = "--commtype:SSE "
	else
  	  EXTRA2_CMD = " "
=======
if [ $DEBUGGING = "DEBUG" ]; then
  EXTRA_CMD="-D DEBUG"
else
  EXTRA_CMD=" "
fi

if [ $COMMTYPE == "SSE" ]; then
  EXTRA_CMD2="--commtype:SSE "
else
  EXTRA_CMD2=" "
>>>>>>> bc1ba46905f4dd4a454b3d83cbeaebc09037e0da
fi
echo 0.0.0.0 $DOMAIN >> /etc/hosts

appdaemon -c $CONFIG_DIR $EXTRA_CMD $EXTRA_CMD2


