#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONFIG_DIR=/config/hadaemon


DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)

if [ ! -d $CONFIG_DIR ]; then
	mkdir -p $CONFIG_DIR
	cp /etc/appdaemon-example.yaml $CONFIG_DIR/appdaemon.yaml
fi

echo 0.0.0.0 $DOMAIN >> /etc/hosts
echo "Starting my appdaemon test for HA-addons"
echo "Config: " $CONFIG_DIR
echo "Extra: " $EXTRA_CMD
echo "Domain: " $DOMAIN
pwd
ls -l
ls /config/hadaemon
appdaemon -c $CONFIG_DIR $EXTRA_CMD

