To update image on server at the moment only scaling down and then up:

kubectl scale --replicas=0 deploy/frontend
kubectl scale --replicas=1 deploy/frontend

To ssh to frontend pod:
kubectl exec -it frontend-309144318-v3kf7 -- /bin/bash

To get pod name for frontend:
kubectl get pod | grep front | cut -d " " -f1

To exec into the above:
kubectl exec -it $(kubectl get pod | grep front | cut -d " " -f1) -- /bin/bash
