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


2.1 Image Docker vs conteneur Docker
        docker ps : Affiche la liste des conteneurs Docker actuellement en cours d'exécution sur votre machine.
        docker ps -a : Affiche la liste de tous les conteneurs Docker, actifs ou arrêtés, sur votre machine.
        docker images : Affiche la liste de toutes les images Docker téléchargées sur votre machine.

Ces commandes sont utiles pour surveiller les conteneurs en cours d'exécution, voir tous les conteneurs présents sur la machine, ainsi que pour afficher toutes les images Docker disponibles localement.

2.2 Images les plus populaires
Ce passage indique aux utilisateurs où trouver les images Docker les plus populaires et mentionne quelques exemples d'images couramment utilisées, telles que Alpine et HTTPD
En utilisant Docker Hub, vous pouvez rechercher des images prêtes à l'emploi pour vos projets Docker, ce qui vous permet de gagner du temps et de vous assurer que vous utilisez des solutions déjà éprouvées par la communauté Docker.

3. Interactions avec les conteneurs docker
Dans cette section, nous avons exploré les interactions avec les conteneurs Docker, en utilisant les images Alpine et HTTPD comme exemples.

3.1 Conteneur en mode interactif
Pour lancer un conteneur Alpine en mode interactif, nous utilisons la commande docker run -it alpine.
L'option -it permet une interaction en mode terminal avec le conteneur.
Nous pouvons vérifier que nous sommes bien à l'intérieur du conteneur en exécutant des commandes telles que cat /etc/os-release pour afficher les informations sur la distribution Alpine.

'docker' exec pour interagir avec un conteneur en cours d'exécution 
En ouvrant une nouvelle console dans le système d'exploitation, nous pouvons afficher tous les conteneurs actifs avec la commande docker ps.
En utilisant le code de hachage du conteneur ou son nom généré, nous pouvons interagir avec le conteneur en cours d'exécution à l'aide de la commande docker exec -it <CONTAINER_ID ou NOM_DU_CONTENEUR> /bin/sh.
Cette commande nous permet de lancer un terminal shell interactif à l'intérieur du conteneur.
Ces interactions nous permettent d'explorer et de travailler à l'intérieur des conteneurs Docker de manière interactive, ce qui est utile pour le développement, le débogage et le test d'applications.

3.2 Ports, volumes et copie de fichiers
Dans cette section, nous avons exploré comment interagir avec les conteneurs Docker en ce qui concerne les ports, les volumes et la copie de fichiers

Pour exposer le port 80 d'un conteneur HTTPD sur un port spécifique de la machine hôte, on utilise l'option -p avec le format -p <port_hote>:80 lors de l'exécution du conteneur. En s'assurant de spécifier un port disponible sur la machine hôte.
Paramètres de la commande docker run pour l'exposition des ports :
    --name <nom> : Permet de nommer le conteneur avec le nom de votre choix.
    -d : Exécute le conteneur en arrière-plan.
    -p <port_hote>:80 : Mappe un port de l'hôte avec le port 80 du conteneur.
Une fois le conteneur HTTPD lancé avec le port exposé, ouvrons un navigateur et accédez à <machine>:<port> où <machine> fait référence à l'adresse de votre machine hôte et <port> est le port spécifié lors de l'exposition.

3.2.2. Copier des fichiers dans un conteneur en cours d’exécution
Pour copier le fichier index.html sur la machine hôte vers le conteneur en cours d'exécution. il faut que le conteneur HTTPD soit en cours d'exécution. une fois déjà lancé le conteneur dans la section précédente, on utilise le même conteneur. Sinon, on lance un nouveau conteneur en spécifiant le nom avec l'option --name et en exposant le port 80 vers un port de votre machine hôte avec l'option -p.

Sur la machine hôte, on crée un fichier nommé index.html avec le contenu souhaité. nous utilisons un éditeur de texte pour cela. Assurons nous que le fichier index.html est dans le même répertoire à partir duquel on exécute la commande docker cp.
la commande 'docker cp' pour copier le fichier index.html depuis machine hôte vers le conteneur en cours d'exécution
    Après avoir copié le fichier, actualise la page dans le navigateur pour voir le nouveau contenu de index.html, Enfin, arrêtons le conteneur à l'aide de la commande docker stop <nom_du_conteneur>.

3.2.3 Volumes
Pour créer des volumes entre la machine hôte et le conteneur en utilisant l'image HTTPD. On doit sure que conteneurs HTTPD sont arrêtés avec la commande docker stop <nom_du_conteneur>. si on a déjà lancé un conteneur HTTPD dans une étape précédente, on s'assure de l'arrêter avant de continuer.

En second lieu on choisi un dossier sur la  machine hôte où on souhaite créer le volume. nous pouvons le faire en utilisant la commande mkdir <nom_dossier> pour créer un nouveau dossier et cd <nom_dossier> pour y accéder.
À l'intérieur de ce dossier nouvellement créé, on crée un fichier index.html avec le contenu de choix en utilisant un éditeur de texte.
Et on execute la commande docker run --name httpd-<votre_nom> -d -p <port_hôte>:80 -v $(pwd):/usr/local/apache2/htdocs httpd dans le dossier où vous avez créé le fichier index.html
dans le markdown :
- on remplace `<votre_nom>` par le nom de choix pour le conteneur.
- Remplace `<port_hôte>` par le port de choix sur la machine hôte, par exemple, 8080.
- L'option `-v $(pwd):/usr/local/apache2/htdocs` crée un volume entre le dossier actuel sur la machine hôte (obtenu avec `$(pwd)`) et le répertoire `/usr/local/apache2/htdocs` dans le conteneur HTTPD. Cela signifie que tout ce qui est contenu dans le dossier local sera accessible dans le conteneur.
En suivant ces étapes, on a créer un volume entre la machine hôte et un conteneur Docker HTTPD, ce qui nous permit de partager des fichiers et des dossiers entre les deux.





   


