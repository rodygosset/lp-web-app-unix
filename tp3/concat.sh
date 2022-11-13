#!/bin/bash


# on commence par vérifier que le nombre de paramètres
# est égale à 2

if [ $# -ne 2 ] ; then
    # si ce n'est pas le cas
    echo "Please enter exactly 2 parameters."
else
    # si c'est le cas
    CONCAT="$1$2"
    # concatener les 2 paramètres 
    # et les stocker dans une variable
    echo $CONCAT
    # afficher le résultat à l'écran
fi