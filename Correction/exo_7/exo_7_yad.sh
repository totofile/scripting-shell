#!/bin/sh

################################################################################
# File: exo_7_yad.sh
# Objet: Un frontend GUI pour la saisie de prenom, nom, domaine => adresse @
# Usage: exo_7_yad.sh
# Exemple: exo_7_yad.sh
# Options: 
#  
# Retourne:
#   0: OK
#   1: 
# Auteur:
# Created: Thu 03 Nov 2022 02:38:28 PM CET
# Updated: Tue 13 Dec 2022 05:05:27 PM CET
################################################################################

IFS='|'

line=$(yad --text="<b><big>Saisie pour générateur adresse e-mail</big></b>" \
--form --field="Prenom" --field="Nom" --field="Domaine")

adresse=$(echo $line | awk '{print $1 "\n" $2 "\n" $3 "\n"}' | ./exo_7.sh)

echo $adresse | yad --text-info --title="Adresse e-mail générée" --button=OK:0 --width=300
