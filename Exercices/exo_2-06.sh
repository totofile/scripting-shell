#!/bin/bash

# Vérification des arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <répertoire_à_sauvegarder> <répertoire_de_stockage>"
    exit 1
fi

source_dir="$1"
backup_dir="$2"

# Verification de l'existence des repertoires
if [ ! -d "$source_dir" ]; then
    echo "Erreur: Le répertoire source n'existe pas."
    exit 1
fi

if [ ! -d "$backup_dir" ]; then
    echo "Erreur: Le répertoire de stockage n'existe pas."
    exit 1
fi

# Créer le fichier daté
backup_file="$(date +%d%m%y%H%M).tbz"

# Création de la sauvegarde
tar -cjf "$backup_dir/$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"

if [ $? -eq 0 ]; then
    echo "Sauvegarde créée avec succès: $backup_dir/$backup_file"
else
    echo "Erreur lors de la création de la sauvegarde."
    exit 1
fi