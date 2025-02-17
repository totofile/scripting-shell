#!/bin/bash

# Vérifier  de la présence de yad
if ! command -v yad &> /dev/null; then
    echo "Erreur: yad n'est pas installé. Veuillez l'installer pour utiliser ce script."
    exit 1
fi

# Interface graphique yad pour saisir les paramètres
result=$(yad --form --title="Sauvegarde" \
    --field="Répertoire à sauvegarder:DIR" \
    --field="Répertoire de stockage:DIR")

# Vérification si l'utilisateur a annulé
if [ $? -ne 0 ]; then
    echo "Opération annulée par l'utilisateur."
    exit 0
fi

# Extraire les valeurs
IFS='|' read -r source_dir backup_dir <<< "$result"

# Appel du script de sauvegarde
./backup_script.sh "$source_dir" "$backup_dir"