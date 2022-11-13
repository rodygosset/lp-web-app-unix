#!/bin/bash

# vérifier qu'un paramètre a été passé
if [ $# -ne 1 ] ; then  
    echo "Passez seulement 1 paramètre."
# si l'utilisateur n'existe pas encore
elif [ -z $(./user-exists.sh $1) ] ; then
    # vérifier que l'utilisateur courant en root
    if ! [ "$USER" = "root" ] ; then
        echo "Seulement root peut crée d'autres utilisateurs."
    fi
    # vérifier que son répertoire home n'existe pas encore
    if ! [ -d /home/$1 ] ; then
        mkdir /home/$1
    fi
    echo "Choisissez un mot de passe:"
    read PASSWD
    echo "Entrez votre nom:"
    read NOM
    echo "Entrez votre prénom:"
    read PRENOM
    echo "Numéro de groupe:"
    read GID
    echo "Des commentaires ?"
    read COMMENTAIRES
    # vérifier si le UID entré par l'utilisateur existe
    if [ -w $(./user-exists.sh $UID) ] ; then
        echo "Impossible de créer l'utilisateur $1 car l'UID $UID existe déjà."
        exit
    fi
    # vérifier si le GID existe
    if [ -z $(cat /etc/group | cut -d : -f 3 | grep $GID) ] ; then
        echo "Impossible de créer l'utilisateur $1 car le GID $GID n'exite pas."
        exit
    fi
    useradd --comment "$NOM $PRENOM $COMMENTAIRES" -d /home/$1 --gid $GID -p $PASSWD -s /bin/bash --uid $UID $1
fi