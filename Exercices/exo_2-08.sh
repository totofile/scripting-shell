#!/bin/bash

# Vérification des arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <répertoire_à_sauvegarder> <répertoire_de_stockage>"
    exit 1
fi

source_dir="$1"
backup_dir="$2"

# Vérification de l'existence des répertoires
if [ ! -d "$source_dir" ] || [ ! -d "$backup_dir" ]; then
    echo "Erreur: Les répertoires spécifiés n'existent pas."
    exit 1
fi

# Création du nom de fichier avec la date
backup_file="$(date +%d%m%y%H%M).tbz.enc"

read -s -p "Entrez le mot de passe pour le chiffrement: " password
echo

# Création de la sauvegarde chiffrée
tar -cj "$source_dir" | openssl enc -aes-256-cbc -pbkdf2 -pass pass:"$password" -out "$backup_dir/$backup_file"

if [ $? -eq 0 ]; then
    echo "Sauvegarde chiffrée créée avec succès: $backup_dir/$backup_file"
else
    echo "Erreur lors de la création de la sauvegarde chiffrée."
    exit 1
fi