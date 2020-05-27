# MariaDB

## Introduction
Voici mon conteneur Mariadb, c'est un conteneur qui permet d'illustrer l'utilisation de Docker.

## Fonctionnement
Ce conteneur est basé sur Alpine Linux version 3.11 afin d'obtenir un conteneur minimal. 
Il s'agit d'une installation standard de MariaDb.
Lors du lancement du conteneur, le script *launch* est lancé via la commande CMD du Dockerfile. Cette commande peut en conséquence être neutralisée en lancant directement une autre commande.

### Launch (/usr/local/bin/launch)
Lors du lancement du script, le système vérifie la présence de la base *mysql* dans l'aborescence /var/lib/mysql. 
Si cette base n'est pas trouvée, cela signifie que le volume est vierge et qu'il faut créer la base. Un message est affiché demandant de lancer le script *installdb*.
Si le volume contient des données, le serveur Mysql est lancé

## Utilisation

Lancer l'image  :
> docker run -d -v VolDB:/var/lib/mysql easylinux/mariadb

Pour lancer le conteneur sans activer le script :
> docker run -it -v VolDB:/var/lib/mysql easylinux/mariadb /bin/sh
  
**NB:** 
* Pour des raisons de sécurité, il est déconseillé de publier le port *3306*, nous vous conseillons plutôt de dédier un réseau.
* Le paquet mariadb-client n'est pas présent dans le conteneur, seul le moteur de la base s'y trouve
