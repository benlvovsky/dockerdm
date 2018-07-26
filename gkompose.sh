#!/bin/bash
#example: ./gkompose up
export MARKOWITZ_IMAGE=gcr.io/financial-portfolio-analysis/img_markowitz:latest
export MARKO_CHART_IMAGE=gcr.io/financial-portfolio-analysis/img_markochart:latest
kompose -f ~/dev/dockerdm/docker-compose-mark-gcloud.yml $1
