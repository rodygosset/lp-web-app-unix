#!/bin/bash

# vérifier qu'aucun paramètre a été passé
if [ $# -ge 1 ] ; then  
    echo "Ce script n'accepte pas de paramètres."
    exit
fi

# demander à l'utilisateur de choisir une note entre 0 et 20

echo "Choisissez une note entre 0 et 20:"
read NOTE


# expression régulière permettant de définir le format numérique entier positif
re='^[0-9]+$'
if ! [[ $NOTE =~ $re ]] ; then
    echo "$NOTE n'est pas un nombre ou ce n'est pas un nombre entier positif."
elif [ $NOTE -lt 0 ] || [ $NOTE -gt 20 ] ; then
    echo "$NOTE n'est pas compris entre 0 et 20"
elif [ $NOTE -lt 10 ] ; then
    echo "Insuffisant"
elif [ $NOTE -lt 12 ] ; then
    echo "Moyen"
elif [ $NOTE -lt 14 ] ; then
    echo "Assez bien"
elif [ $NOTE -lt 16 ] ; then
    echo "Bien"
else
    echo "Très Bien"
fi
