#!/bin/bash

# expression régulière permettant de définir le format numérique entier
re='^[0-9]+$'

# vérifier qu'un paramètre a été passé
if [ $# -ne 1 ] ; then  
    echo "Passez seulement 1 paramètre."
elif [[ $1 =~ $re ]] ; then
    # utiliser le script de l'exo précedent
    # pour récupérer la liste des utilisateurs
    USERS=$(./listusers.sh)
    # vérifier si $1 est dans la liste des UID
    for user in $USERS ; do
        # comparer $1 a la deuxième colonne de chaque ligne (UID)
        if [ "$(echo $user | cut -d : -f 2)" = "$1" ]; then
            echo $(echo $user | cut -d : -f 2)
        fi
    done
else 
    # vérifier si $1 est dans la liste des utisateurs
    USERS=$(./listusers.sh)
    for user in $USERS ; do
        # comparer $1 a la première colonne de chaque ligne (username)
        if [ "$(echo $user | cut -d : -f 1)" = "$1" ]; then
            # afficher le UID
            echo $(echo $user | cut -d : -f 2)
        fi
    done
fi