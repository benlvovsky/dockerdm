# from dockerdm directory for markowitz docker image build
gcloud container builds submit --tag gcr.io/expanded-run-177512/img_markowitz . --timeout 2h30m
gcloud projects list
gcloud container images list-tags gcr.io/expanded-run-177512/img_markowitz
gcloud container images list
gcloud docker -- pull gcr.io/expanded-run-177512/img_markowitz
kompose -f docker-compose.yml -f docker-guestbook.yml convert
kompose -f ../dockerdm/docker-compose-mark.yml up
kubectl expose deployment markowitz-cont --type="LoadBalancer"
