## Hass.io plugins

[![Build Status](https://travis-ci.org/sparck75/HA-addons.svg?branch=master)](https://travis-ci.org/sparck75/HA-addons)

## Pre-built images

## Just code

These add-ons are being built by Travis CI.   

## [AppDaemon](https://github.com/home-assistant/appdaemon)

Beta-version of AppDaemon with HaDashobard v2.

## Configuration to work with SSL

Configuration options are:
        "domain":  "0.0.0.0":  I use my internal IP (192.168.x.x)
        "commtype":    "sse":  2 choices:  websockets, sse
        "debugging":  "info":  (debug, info, warning, error, critical, none)
		
- Ensure you have move all the apps definition from appdaemon.yaml to a file called the apps.yaml in your /config/hadaemon folder.
- Works only with port 5050.

appdaemon.yaml
  
