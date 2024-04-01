#!/usr/bin/env bash

doctl registry login
docker build -f ./Dockerfile -t registry.digitalocean.com/medvedik/dumb_api ../dumb_api/
docker push registry.digitalocean.com/medvedik/dumb_api
