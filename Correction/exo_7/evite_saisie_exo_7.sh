#!/bin/sh

################################################################################
# File: evite_saisie_exo_7.sh
# Objet: 
# Usage: evite_saisie_exo_7.sh
# Exemple: 
# Options: 
#  
# Retourne:
#   0: OK
#   1: 
# Auteur:
# Created: Wed 02 Nov 2022 04:15:54 PM CET
# Updated: jeu. 24 oct. 2024 09:31:01
################################################################################
#
FICHIER_COMPTES=$1
IFS=","

if [ $# -ne 1 ]
then
  echo "Usage : $0 fichier" >&2
  exit 1
fi

if [ ! -r ${FICHIER_COMPTES} ]
then
  echo "${FICHIER_COMPTES} n'est pas accessible en lecture" >&2
  exit 3
else
  while read prenom nom domain
  do
    echo -e "${prenom}\n${nom}\n${domain}" | tr '[A-Z]' '[a-z]' | ./exo_7.sh
  done < ${FICHIER_COMPTES}
fi
