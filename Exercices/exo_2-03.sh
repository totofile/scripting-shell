#!/bin/bash

input_file=$1

if [ "$input_file" = "-" ]; then
    input_file="/dev/stdin"
fi

while IFS=':' read -r prenom nom
do
    # créer le login
    login=$(echo $prenom | tr '[:upper:]' '[:lower:]' | sed 's/-//g' | cut -c1)$(echo $nom | tr '[:upper:]' '[:lower:]' | cut -c1-3)

    # Mot de passe aléatoire
    password=$(openssl rand -base64 12)

    # Créer l'utilisateur
    sudo useradd -m -p $(openssl passwd -1 $password) $login

    # Afficher les infos
    echo "$prenom:$nom:$login:$password"
done < "$input_file"