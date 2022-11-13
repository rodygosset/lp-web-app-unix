#!/bin/bash

# Réponses au questions posées dans cet exo

# - comment quitter more ?
#   La touche 'q' le permet
# - comment avancer d’une ligne ?
#   La touche clavier représentant une flèche qui pointe vers le bas permet de le faire
# - comment avancer d'une page ?
#   Pour cela, il faut utiliser la touche ESPACE
# - comment remonter d'une page ?
#   Pour cela, il faut utiliser la touche 'b'
# - comment rechercher une chaîne de caractères ?
#   '/<chaîne de caractères>' permet de rechercher '<chaîne de caractères> dans le fichier, 
#   et la touche 'n' permet de passer à la prochaine occurence

# -- début du script --

# vérifier si la liste des paramètres 
# contient exactement un élément

if [ $# -ne 1 ] ; then  
    echo "Passez exactement 1 paramètre."
elif [ -f $1 ] ; then
    echo "$1 n'est pas un répertoire."
else
    # itérer à travers le retour de la commande 
    # qui utilise l'option -F de ls pour ajouter un '/'
    # au nom de répertoires
    # puis ne garder que les noms de fichiers grâce à grep
    YES_ANWERS="oui yes"
    NO_ANSWERS="non no"
    path_prefix=$(cd $1 && pwd)
    for node in $(/bin/ls -F $1 | grep -v /$) ; do
        file_path="$path_prefix/$node"
        # check whether the file is a text file
        if $(file $file_path | grep -q text$) ; then
            echo "Voulez-vous visualiser le fichier $node ? (oui ou non)"
            read ANSWER
            ANSWER=$(echo $ANSWER | tr "[:upper:]" "[:lower:]")
            if [ $ANSWER ==  "yes" ] || [ $ANSWER  == "oui" ] ; then
                more $file_path
            fi
        fi
    done

fi