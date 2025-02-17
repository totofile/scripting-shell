#!/bin/sh

################################################################################
# File: exo_5.sh
# Objet: 
# Usage: exo_5.sh
# Exemple: 
# Options: 
#  
# Retourne:
#   0: OK
#   1: 
# Auteur:
# Created: Fri 27 Mar 2020 11:17:27 AM CET
# Updated: Fri 13 Jan 2023 11:58:42 AM CET
################################################################################

fichier=$1

# Controle du nombre de paramètres passés
if [ $# -ne 1 ]
then
  echo "Usage : $0 fichier" >&2
  exit 2
fi

# Vérification de l'existence et l'accès en lecture du fichier de 
# Existence : opérateur -e
# Négation : !
if [ ! -e $fichier ]
then
  echo "Le fichier '$fichier' n'existe pas" >&2
  exit 3
fi

if [ ! -r $fichier ]
then
  echo "Le fichier '$fichier' n'est pas accessible en lecture" >&2
  exit 4
fi

# On défini une variable de type entier (-i comme integer)
#  sur laquelle on pourra faire des opérations (+1 par exemple)
typeset -i numero=1

# Pour afficher un entête
# On utilise la tabulation (\t) pour bien formater (présenter le résultat)
echo -e "N°         | Libellé produit"
echo -e "-----------|------------------------------"

# On boucle sur toutes les lignes du fichier passé en paramètre
# Quand il n'y a plus de lignes la boucle s'arrête
cat $fichier | grep -v '^$' | \
  while read prod
  do
    printf "%010d\t%s\n" "$numero" "$prod"

    # Incrémentation pour le produit suivant
    numero=$numero+1
  done
