#!/bin/bash

# Demander les trois mots à l'utilisateur
read -p "Veuillez entrer 3 mots (séparés par un espace) : " mot1 mot2 mot3

read -p "Veuillez entrer un nombre > 100 : " nombre

if [ "$nombre" -le 100 ]; then
  echo "Le nombre doit être supérieur à 100." >&2
  exit 1
fi

mot1_part=${mot1:0:2}
mot2_part=${mot2:0:2}
mot3_part=${mot3:0:2}

reste=$((RANDOM % nombre))

mot_de_passe="${mot1_part}${mot2_part}${mot3_part}${reste}"

echo "Le mot de passe généré est : $mot_de_passe"
