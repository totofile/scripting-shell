#!/bin/sh

while true; do
    echo "Vérification des systèmes de fichiers..."
#Création de la synthaxe pour la commande df
    df -h | grep -v '^Filesystem' | awk '{print $5 " " $6}' | while read output; do
        usage=$(echo $output | awk '{print $1}' | sed 's/%//')
        filesystem=$(echo $output | awk '{print $2}')
        
        if [ "$usage" -ge 80 ]; then
            echo "Seuil dépassé : $filesystem est occupé à $usage% !"
        else
            echo "Pas de pb : $filesystem est à $usage% d'occupation."
        fi
    done
    echo "Pour quitter, appuyez sur CTRL+C."
    
    sleep 10
done
