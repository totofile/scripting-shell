#!/bin/bash
DIALOG=${DIALOG=dialog}

$DIALOG --title " Mon premier dialog" --clear \
  --yesno "Bonjour, ceci est mon premier programme dialog" 10 30

case $? in
0) echo "Oui choisi. " ;;
1) echo "Non choisi. " ;;
255) echo "Appuyé sur Echap. " ;;
esac
