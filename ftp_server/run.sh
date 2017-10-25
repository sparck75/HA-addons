#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONFIG_DIR=/config/hadaemon

DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)
COMMTYPE=$(jq --raw-output ".commtype" $CONFIG_PATH)
DEBUGGING=$(jq --raw-output ".debugging" $CONFIG_PATH)

#if [ ! -d $CONFIG_DIR ]; then
#	mkdir -p $CONFIG_DIR
#	cp /etc/appdaemon-example.yaml $CONFIG_DIR/appdaemon.yaml
#	cp /etc/apps-example.yaml $CONFIG_DIR/apps.yaml
#fi

#if [ ! -d $CONFIG_DIR/compiled ]; then
#	mkdir -p $CONFIG_DIR/compiled
#fi
#if [ ! -d $CONFIG_DIR/compiled/css ]; then
#	mkdir -p $CONFIG_DIR/compiled/css
#fi
#if [ ! -d $CONFIG_DIR/compiled/javascript ]; then
#	mkdir -p $CONFIG_DIR/compiled/javascript#
#fi
#if [ ! -d $CONFIG_DIR/compiled/html ]; then
#	mkdir -p $CONFIG_DIR/compiled/html
#fi

if [ $COMMTYPE == "sse" ]; then
  EXTRA_CMD2="--commtype=SSE "
elif [ $COMMTYPE == "websockets" ]; then
  EXTRA_CMD2="--commtype=WEBSOCKETS "  
else
  echo "Invalid commtype option in config.json. Valid value are: (websockets or sse)"
  EXTRA_CMD2=" "
fi
echo 0.0.0.0 $DOMAIN >> /etc/hosts

echo ls -l /etc
vsftpd start
#appdaemon -c $CONFIG_DIR $EXTR_CMD $EXTRA_CMD2


