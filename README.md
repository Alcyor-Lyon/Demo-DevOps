# Demo-DevOps
procédure et fichiers utiles à une démonstration sur les principes DevOps et Kubernetes
s'appuyant sur des playgrounds de KillerCoda

- se connecter sur killercoda.com
- cliquer sur "Playgrounds" puis "Kubernetes 1.xx" afin de lancer un environnement Kubernetes bac-à-sable
- aller dans le menu à trois barres horizontales, tout en haut à droite, et selectionner "Traffic / Ports"
- dans la nouvelle fenêtre, sasir "32111" dans un des champs "Custom Ports" et cliquer sur le "Access" accolé
- faire un "copier" de l'entrée DNS obtenue, sans la partie "https://"
- coller le résultat dans la variable indiquée ci-dessous et appliquer la procédure

```

export URL=7bab38f1-beb3-4972-9f98-393faae4105a-10-244-27-30-32111.spch.r.killercoda.com 
curl https://raw.githubusercontent.com/Alcyor-Lyon/Demo-DevOps/main/01-installationAppliDemo.ksh | bash

```

la fin du shell précédent vous remonte un état des pods applicatifs rafraichit toutes les 2s
et quand le pod est en "1/1" l"applicatif est disponible via l'URL

- depuis une autre fenêtre, retourner sur killercoda.com
- cliquer sur "Playgrounds" puis "Ubuntu" afin de lancer un environnement Linux bac-à-sable

```

export URL=7bab38f1-beb3-4972-9f98-393faae4105a-10-244-27-30-32111.spch.r.killercoda.com 
while : 
do 
  curl --connect-timeout 3 https://$URL 2>/dev/null | grep -v title | grep -i ALCYOR  || echo "incident, appli inaccessible" 
  sleep 1
done

```
