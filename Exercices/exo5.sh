#!/bin/sh


counter=1


while read -r produit; do
    echo "Produit : $produit - Numéro de produit : $counter"
    counter=$((counter + 1))
done < produits.txt

