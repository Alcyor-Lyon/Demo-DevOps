kubectl create ns namespace1

kubectl apply -f mydemo.yaml -n namespace1

echo 'merci de copier/coller l URL d acces sur le port 1234 du bac à sable'
read URL
#URL=bef6fab1-ef6d-4b4a-9a6f-a8291b20db4e-10-244-29-133-31750.spch.r.killercoda.com

kubectl create namespace kubeinvaders

helm repo add kubeinvaders https://lucky-sideburn.github.io/helm-charts/
helm repo update
helm install kubeinvaders --set-string config.target_namespace="namespace1" -n kubeinvaders kubeinvaders/kubeinvaders --set service.type=NodePort --set ingress.enabled=false --set ingress.hostName=$URL --set deployment.image.tag=v1.9.6 --set route_host=$URL
