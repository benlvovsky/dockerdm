#!/bin/bash
#example: ./gkompose up
export MARKOWITZ_IMAGE=gcr.io/expanded-run-177512/img_markowitz:sit
export MARKO_CHART_IMAGE=gcr.io/expanded-run-177512/img_markochart:sit
kompose -f ~/dev/dockerdm/docker-compose-mark-gcloud.yml $1
