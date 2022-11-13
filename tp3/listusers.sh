#!/bin/bash
# garder seulement la première colonne du fichier /etc/passwd
# et eliminer les commentaires
USERS=$(cut -d : -f 1 /etc/passwd | grep -v '#')
for user in $USERS ; do
    # récuperer la colonne correspondant au UID pour chaque ligne
    # afficher le nom d'utilisateur et le UID s'il est supérieur à 100
    if [ $(cat /etc/passwd | grep $user | cut -d : -f 3) -gt 100 ] ; then
        echo $(cat /etc/passwd | grep $user | cut -d : -f 1,3)
    fi
done