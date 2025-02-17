#!/bin/sh

check_error() {
  if [ $? -ne 0 ]; then
    echo "Erreur : $1" >&2
    exit 1
  fi
}

user_root="root"
user_current="$USER"

echo "==============================="
echo "Liste des processus pour root"
echo "==============================="
ps -u "$user_root"
check_error "Impossible de lister les processus de root."

echo "==============================="
echo "Liste des processus pour $user_current"
echo "==============================="
ps -u "$user_current"
check_error "Impossible de lister les processus de l'utilisateur $user_current."

echo "==============================="
echo "Filiation des processus pour root"
echo "==============================="
pstree -u "$user_root"
check_error "Impossible d'afficher la filiation des processus de root."

echo "==============================="
echo "Filiation des processus pour $user_current"
echo "==============================="
pstree -u "$user_current"
check_error "Impossible d'afficher la filiation des processus de l'utilisateur $user_current."

echo "Opération terminée avec succès."
