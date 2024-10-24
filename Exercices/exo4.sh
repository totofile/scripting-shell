#!/bin/sh

fr="Bonjour Monde !"
en="Hello World !"
ch="chin chong!"
af="mmh poulet!"

if [ $# -ne 1 ]; then
       echo "nb d'arguments invalide"
fi

case $1 in 
	"fr") echo $fr;;
	"en") echo $en;;
	"ch") echo $ch;;
	"af") echo $af;;
	*)echo "choisissez une langue";;
esac
