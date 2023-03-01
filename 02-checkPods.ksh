#while : ;  do kubectl get pod -n namespace1 -o wide | grep -v Completed | egrep  "|nginx.*1/1     Running|kube.*1/1     Running"; sleep 2; clear; echo; kubectl get node; echo ;done

watch 'kubectl  get pod -n namespace1 -o custom-columns=NAME:metadata.name,STATUS:status.containerStatuses[].ready,STATUS:status.phase,NODE:.spec.nodeName '
