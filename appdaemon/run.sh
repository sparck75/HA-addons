#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONFIG_DIR=/config/hadaemon
CERTS_PATH=/ssl

EXTRA_CMD="-D DEBUG --commtype=SSE"

DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)

if [ ! -d $CONFIG_DIR ]; then
	mkdir -p $CONFIG_DIR
	cp /etc/appdaemon-example.yaml $CONFIG_DIR/appdaemon.yaml
	cp /etc/apps-example.yaml $CONFIG_DIR/apps.yaml
fi

echo 0.0.0.0 $DOMAIN >> /etc/hosts

appdaemon -c $CONFIG_DIR:/conf -v $CERTS_PATH:/certs $EXTRA_CMD

