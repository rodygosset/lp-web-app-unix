#!/bin/bash

# vérifier si la liste des paramètres 
# contient exactement un élément

if [ $# -ne 1 ] ; then  
    echo "Passez seulement 1 paramètre."
elif [ -f $1 ] ; then
    echo "$1 n'est pas un répertoire."
else
    # itérer à travers le retour de la commande 
    # qui utilise l'option -F de ls pour ajouter un '/'
    # au nom de répertoires
    FILES=""
    # puis ne garder que les noms de fichiers grâce à grep
    for node in $(/bin/ls -F $1 | grep -v /$) ; do
            FILES="$FILES $node"
    done
    DIRS=""
    # puis ne garder que les noms de répertoire grâce à rep
    for node in $(/bin/ls -F $1 | grep /$) ; do
            DIRS="$DIRS $node"
    done
    echo "###### fichiers dans $1 ######"
    # récupérer le chemin complet vers le dossier indiqué
    path_prefix=$(cd $1 && pwd)
    for file in $FILES; do
        echo "$path_prefix/$file"
    done
    echo "###### répertoires dans $1 ######"
    for dir in $DIRS; do
        echo "$path_prefix/$dir"
    done
fi