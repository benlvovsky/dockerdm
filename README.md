To update image on server at the moment only scaling down and then up:

`kubectl scale --replicas=0 deploy/frontend`
`kubectl scale --replicas=1 deploy/frontend`

To ssh to frontend pod:
`kubectl exec -it frontend-309144318-v3kf7 -- /bin/bash`

To get pod name for frontend:
`kubectl get pod | grep front | cut -d " " -f1`

To exec into the above:
`kubectl exec -it $(kubectl get pod | grep front | cut -d " " -f1) -- /bin/bash`

required built images:
from markowitzpy directory run:
`docker build -t img_markowitz .`

from marko-chart directory run:
`docker build -t img_markochart .`

run docker images into containers:
`docker-compose -f docker-compose-mark-local.yml up`

access to bash on markowitz-cont container:
`docker exec -it markowitz-cont bash`

access to bash on markochart-cont container:
`docker exec -it markochart-cont bash`

using envionment variables like:
`export MARKO_CHART_CODE=~/dev/marko-chart
export MARKO_CHART_IMAGE=img_markochart:latest
export MARKOWITZ_CODE=~/dev/markowitzpy
export MARKOWITZ_IMAGE=img_markowitz:latest
`

to call markowitz python container with markochart-cont use endpoint: _`http://markowitz-cont:5000/ef`_
for manual test:
1) from the host:                    `docker exec -it markochart-cont bash`
2) once inside marcochart-cont use:  `curl http://markowitz-cont:5000/ef`

gcloud container clusters get-credentials sit --zone us-central1-a --project expanded-run-177512
