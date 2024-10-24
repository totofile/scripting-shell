#!/bin/sh

# Demander à l'utilisateur de saisir son prénom
read -p "Saisir un prénom : " prenom

# Demander à l'utilisateur de saisir son nom
read -p "Saisir un nom : " nom

# Demander à l'utilisateur de saisir le nom de domaine de la société
read -p "Saisir le nom de domaine de la société (sans @) : " domaine

# Construire l'adresse e-mail en minuscule
email="${prenom}.${nom}@${domaine}"

# Afficher l'adresse e-mail générée
echo "L'adresse e-mail proposée est : $email"

