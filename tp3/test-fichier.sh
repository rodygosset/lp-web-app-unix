#!/bin/bash

# vérifier si la liste des paramètres 
# contient exactement un élément

if [ $# -ne 1 ] ; then  
    echo "Passez seulement 1 paramètre."
else
    # si c'est le cas
    # si le fichier est répertoire (test -d)
    if [ -d $1 ] ; then
        echo "Le fichier $1 est un répertoire."
    # si le fichier est n'est pas vide (test -S)
    elif [ -S $1 ] ; then
        echo "Le fichier $1 est un fichier ordinaire qui n'est pas vide."
    else 
        echo "Le fichier $1 est un ficher ordinaire vide."
    fi
    # stocker la liste de permissions sur le fichier
    # dans une chaîne de caractères
    PERMISSIONS=""
    if [ -r $1 ] ; then
        PERMISSIONS="$PERMISSIONS lecture"
    fi
    if [ -w $1 ] ; then
        PERMISSIONS="$PERMISSIONS écriture"
    fi
    if [ -x $1 ] ; then
        PERMISSIONS="$PERMISSIONS exécution"
    fi
    echo "\"$0\" est accessible par $USER en$PERMISSIONS"
fi