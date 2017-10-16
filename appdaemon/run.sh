#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONFIG_DIR=/config/hadaemon

DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)
DOMAIN_SSL=$(jq --raw-output ".domain_ssl" $CONFIG_PATH)
EXTRA_CMD=$(jq --raw-output ".arguments" $CONFIG_PATH)

if [ ! -d $CONFIG_DIR ]; then
	mkdir -p $CONFIG_DIR
	cp /etc/appdaemon-example.yaml $CONFIG_DIR/appdaemon.yaml
	cp /etc/apps-example.yaml $CONFIG_DIR/apps.yaml
fi

echo 0.0.0.0 $DOMAIN_SSL >> /etc/hosts

appdaemon -c $CONFIG_DIR $EXTRA_CMD

