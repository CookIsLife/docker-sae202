# docker-sae203

TP1 - Introduction a docker

Pour commencer il nous faut installer docker sur notre machine personnel.

Ensuite une fois que l'application est installé il nous faut ouvrir un terminal sur notre machine personnel et vérifier si docker est bien installé en utilisant la commande doker --version
celle-ci affichera le résultat suivant -> "Docker version 25.0.3, build 4debf41"

Après avoir vu que docker était installé sur notre machine il nous faut tester une commande appelé conteneur avec la commande suivante docker run hello-world
cette commande affichera -> 
"Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c1ec31eb5944: Pull complete
Digest: sha256:03b30c6a3c320ff172b52bd68eddffde6ded08ce47e650fe52de861c5e9df46d
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

La phrase 1 signifie que le client docker est entrer en contacte avec le deamon docker.

La phrase 2 signifie que le deamon docker a extrait l'image "hello-world" du docker hub.

La phrase 3 signifie que le deamon docker crée un nouveau conteneur a partir de l'image "hello-world" qui produit le résultat qu'on voit sur le terminal.

La phrase 4 signifie que que le deamon docker a envoyer au client le résultat.


