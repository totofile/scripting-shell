#!/bin/sh

################################################################################
# File: exo_7.sh
# Objet: 
# Usage: exo_7.sh
# Exemple: 
# Options: 
#  
# Retourne:
#   0: OK
#   1: 
# Auteur:
# Created: Fri 03 Apr 2020 11:25:20 AM CEST
# Updated: Wed 02 Nov 2022 04:33:44 PM CET
################################################################################

prenom=""
nom=""
domaine=""

# On va boucler tant que tous les champs ne sont pas remplis
while [ "${prenom}" = "" -o "${nom}" = "" -o "${domaine}" = "" ]
do
  # On demandera la saisie uniquement pour les champs nom remplis
  if [ "${prenom}" = "" ]
  then
    read -p "Entrer un prénom : " prenom
  fi
  if [ "${nom}" = "" ]
  then
    read -p "Entrer un nom : " nom
  fi
  if [ "${domaine}" = "" ]
  then
    read -p "Entrer un domaine : " domaine
  fi
done

# Affichage du résultat
adresse="${prenom}.${nom}@${domaine}"
echo "Votre adresse sera : ${adresse}"
