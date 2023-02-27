# récupération des scripts
git clone https://github.com/Alcyor-Lyon/Demo-DevOps.git

kubectl create ns namespace1
kubectl apply -f Demo-DevOps/mydemo.yaml -n namespace1

kubectl patch service nginx-service -n namespace1 --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":32111}]'

kubectl create namespace kubeinvaders

helm repo add kubeinvaders https://lucky-sideburn.github.io/helm-charts/
helm repo update
helm install kubeinvaders --set-string config.target_namespace="namespace1" -n kubeinvaders kubeinvaders/kubeinvaders --set service.type=NodePort --set ingress.enabled=false --set ingress.hostName=$URL --set deployment.image.tag=v1.9.6 --set route_host=$URL
kubectl patch service kubeinvaders -n kubeinvaders --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":32100}]'

while : ;  do kubectl get pod -n namespace1 -o wide | grep -v Completed | egrep  "|nginx.*1/1     Running|kube.*1/1     Running"; sleep 2; clear; echo; kubectl get node; echo ;done
