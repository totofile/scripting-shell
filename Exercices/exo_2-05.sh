#!/bin/bash

prefix=$1
directory=$2
# Vérification des arguments
if [ -z "$prefix" ] || [ -z "$directory" ]; then
    echo "Usage: $0 <prefix> <directory>"
    exit 1
fi

cd "$directory" || exit 1

count=1
for file in *.jpg

do
    new_name=$(printf "${prefix}_%08d.jpg" $count)
    mv "$file" "$new_name"
    ((count++))
done