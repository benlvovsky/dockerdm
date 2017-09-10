# from dockerdm directory for markowitz docker image build
gcloud container builds submit --tag gcr.io/expanded-run-177512/img_markowitz ~/dev/markowitz --timeout 2h

#for chart docker from dev folder
gcloud container builds submit --tag gcr.io/expanded-run-177512/img_markochart ~/dev/marko-chart --timeout 2h

gcloud projects list
gcloud container images list

gcloud container images list-tags gcr.io/expanded-run-177512/img_markowitz

kompose -f ~/dev/dockerdm/docker-compose-mark-gcloud.yml up
kubectl expose deployment markowitz-cont --type="LoadBalancer"
