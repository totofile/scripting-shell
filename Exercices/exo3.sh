#!/bin/sh

fr="Bonjour Monde !"
en="Hello World !"

if [ $# -ne 1 ]; then
    echo "nb d'arguments invalide"
else
    if [ "$1" = "fr" ]; then
        echo $fr
    elif [ "$1" = "en" ]; then
        echo $en
    else
        echo "Langue non reconnue"
    fi
fi

