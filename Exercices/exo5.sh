#!/bin/sh

# Initialisation du compteur
counter=1

# Lecture du fichier de produits
while read -r produit; do
    echo "Produit : $produit - Numéro de produit : $counter"
    counter=$((counter + 1))
done < produits.txt

