#!/bin/sh

################################################################################
# File: exo_3.sh
# Objet: 
# Usage: exo_3.sh
# Exemple: 
# Options: 
#  
# Retourne:
#   0: OK
#   1: 
# Auteur:
# Created: Fri 27 Mar 2020 10:45:47 AM CET
# Updated: Thu 05 Nov 2020 03:49:50 PM CET
################################################################################

lang=$1

MSG_FR="Bonjour le monde"
MSG_EN="Hello world"


# Controle du nombre de paramètres passés
if [ $# -ne 1 ]
then
  echo "Usage : $0 langue" >&2
  exit 2
fi

# Affichage du message en fonction de la langue
if [ "$lang" = "fr" ]
then
  echo $MSG_FR
else
  if  [ "$lang" = "en" ]
  then
    echo $MSG_EN
  else
    echo "La langue '$lang' n'est pas prise en compte" >&2
    exit 3
  fi
fi
