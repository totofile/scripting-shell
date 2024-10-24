#!/bin/bash

tmp="/tmp/photos-backup"
mkdir -p $tmp
dossPhoto="/home/toplu/Bureau/ESGI/B3/SHELL/photos"
mkdir -p $dossPhoto
touch /home/toplu/Bureau/ESGI/B3/SHELL/photos/{1..100}.jpg


# Boucle sur chaque fichier dans le dossier
for fichier in "$dossPhoto"/*; do
	if [ -f "$fichier" ]; then
		cp "$fichier" "$tmp"
	fi
done
