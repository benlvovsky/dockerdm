#!/bin/bash
export MARKOWITZ_IMAGE=gcr.io/expanded-run-177512/img_markowitz:latest
export MARKO_CHART_IMAGE=gcr.io/expanded-run-177512/img_markochart:latest
kompose -f ~/dev/dockerdm/docker-compose-mark-gcloud.yml $1
