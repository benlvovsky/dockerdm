#!/bin/bash
#parameter should be 'up' or 'down'
docker-compose -f ~/dev/dockerdm/docker-compose-mark-local.yml $1
