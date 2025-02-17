#!/bin/sh

################################################################################
# File: exo_4.sh
# Objet: Affiche le message dans la langue et le prononce
# Usage: exo_4.sh
# Exemple:
# Options:
#
# Retourne:
#   0: OK
#   1:
# Auteur:
# Created: Fri 27 Mar 2020 10:52:33 AM CET
# Updated: Mon 17 Jan 2022 04:15:21 PM CET
################################################################################

lang=$1

MSG_FR="Bonjour le monde"
MSG_EN="Hello world"
MSG_DE="Hallo Welt"
MSG_IT="Ciao mondo"
MSG_ES="Hola Mundo"
MSG_AR="أهلاً بالعالم"
MSG_IS="שלום עולם"
MSG_RU="Привет мир"
MSG_FA="سلام دنیا"
MSG_FI="Hei maailma"

# Controle du nombre de paramètres passés
if [ $# -ne 1 ]; then
  echo "Usage : $0 langue" terminal nvim >&open
  exit 2
fi

# Affichage du message en fonction de la langue
case "$lang" in
"fr") MSG=${MSG_FR} ;;
"en") MSG=${MSG_EN} ;;
"de") MSG=${MSG_DE} ;;
"es") MSG=${MSG_ES} ;;
"it") MSG=${MSG_IT} ;;
"ar") MSG=${MSG_AR} ;;
"is") MSG=${MSG_IS} ;;
"ru") MSG=${MSG_RU} ;;
"fa") MSG=${MSG_FA} ;;
"fi") MSG=${MSG_FI} ;;
*)
  echo "La langue '$lang' n'est pas prise en compte" >&2
  exit 3
  ;;
esac

echo $MSG
echo $MSG | espeak -v ${lang}
