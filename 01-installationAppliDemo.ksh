# récupération des scripts
git clone https://github.com/Alcyor-Lyon/Demo-DevOps.git

kubectl create ns namespace1
kubectl apply -f Demo-DevOps/mydemo.yaml -n namespace1

kubectl create namespace kubeinvaders

helm repo add kubeinvaders https://lucky-sideburn.github.io/helm-charts/
helm repo update
helm install kubeinvaders --set-string config.target_namespace="namespace1" -n kubeinvaders kubeinvaders/kubeinvaders --set service.type=NodePort --set ingress.enabled=false --set ingress.hostName=$URL --set deployment.image.tag=v1.9.6 --set route_host=$URL
kubectl patch service kubeinvaders -n kubeinvaders --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":1234}]'

