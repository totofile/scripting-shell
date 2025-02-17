#!/bin/sh

################################################################################
# File: exo_6.sh
# Objet: 
# Usage: exo_6.sh
# Exemple: 
# Options: 
#  
# Retourne:
#   0: OK
#   1: Un problème est survenu
#   2: Le répertoire ${rep_source} n'est pas valide
# Auteur:
# Created: Thu 02 Apr 2020 01:15:51 PM CEST
# Updated: jeu. 24 oct. 2024 09:08:27
################################################################################

#rep_source=/home/stagiaire/photos
rep_source=/home/pmal/VELIC/Projets/IPI/2021-2022/photos
rep_dest=/tmp

LISTE=$*

if [ ! -d ${rep_source} ]
then
  echo "Le répertoire ${rep_source} n'est pas valide" >&2
  exit 2
fi

# Une variable pour gérer les éventuels problèmes
probleme=false

for F in ${LISTE}
do
  fichier=${rep_source}/${F}

  # On vérifie que le fichier existe
  if [ ! -e ${fichier} ]
  then
    echo "Le fichier ${fichier} n'existe pas" >&2
    probleme=true
  else
    cp -p ${fichier} ${rep_dest}
    code_retour=$?

    # On vérifie que la copie s'est bien passée
    if [ ${code_retour} -ne 0 ]
    then
      echo "Problème lors de la copie du fichier ${fichier} " >&2
      probleme=true
    fi
  fi
done

# Une fois le traitement terminé, on indique 
#  si il y a eu des erreurs par le code retour : 1
if [ ${probleme} = true ]
then
  exit 1
fi

