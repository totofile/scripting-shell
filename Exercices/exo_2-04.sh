#!/bin/bash

#tant que séparateur : lire les champs username et shell dans /etc/passwd
while IFS=':' read -r username _ _ _ _ _ shell
do
    echo "Utilisateur: $username, Shell: $shell"
done < /etc/passwd