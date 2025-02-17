#!/bin/sh

# Vérifie si un chemin est passé en paramètre, sinon demande à l'utilisateur de le saisir
if [ -z "$1" ]; then
    read -p "Saisir le chemin du répertoire à créer : " chemin
else
    chemin="$1"
fi

# Vérifie si l'utilisateur a les droits d'accès pour créer le répertoire
if [ ! -w "$(dirname "$chemin")" ]; then
    echo "Vous n'avez pas les droits nécessaires pour créer ce répertoire."
    exit 1
fi

# Crée l'arborescence du chemin
mkdir -p "$chemin"
echo "Le répertoire '$chemin' et son arborescence ont été créés."

# Affiche l'arborescence du chemin créé
echo "Arborescence créée :"
IFS='/' read -r -a chemins <<< "$chemin"
current_path="/"
for dir in "${chemins[@]}"; do
    if [ -n "$dir" ]; then
        current_path="$current_path$dir/"
        echo "$current_path"
    fi
done

