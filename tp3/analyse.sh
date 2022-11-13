#!/bin/bash

# la variable $# contient le nombre de paramètres
# la variable $0 contient le nom du script en cours d'exécution
# la variable $i pour i entre 1 et 9 contient le i-ème paramètre
# la variable $@ contient la liste des paramètres séparés par un espace 

echo "Bonjour, vous avez rentré $# paramètres."
echo "Le nom du script est $0"
echo "Le 3ème paramètre est $3"
echo "Voici la liste des paramètre: $@"
