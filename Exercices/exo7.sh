#!/bin/sh


read -p "Saisir un prénom : " prenom

read -p "Saisir un nom : " nom

read -p "Saisir le nom de domaine de la société (sans @) : " domaine

email="${prenom}.${nom}@${domaine}"

echo "L'adresse e-mail proposée est : $email"

