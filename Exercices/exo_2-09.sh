#!/bin/bash

# Vérification des arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <réseau_IP> <adresse_début> <adresse_fin>"
    exit 1
fi

network="$1"
start_ip="$2"
end_ip="$3"

# Vérification de la validité des adresses IP
if ! ipcalc -c "$network" &>/dev/null || ! ipcalc -c "$start_ip" &>/dev/null || ! ipcalc -c "$end_ip" &>/dev/null; then
    echo "Erreur: Adresses IP invalides."
    exit 1
fi

# Conversion des adresses IP en nombres
start_num=$(echo "$start_ip" | awk -F. '{print ($1 * 256^3) + ($2 * 256^2) + ($3 * 256) + $4}')
end_num=$(echo "$end_ip" | awk -F. '{print ($1 * 256^3) + ($2 * 256^2) + ($3 * 256) + $4}')

# Boucle sur la plage d'adresses IP
for ((i=start_num; i<=end_num; i++)); do
    current_ip=$(printf "%d.%d.%d.%d" $(($i>>24&255)) $(($i>>16&255)) $(($i>>8&255)) $(($i&255)))

    if ping -c 3 -W 1 "$current_ip" &>/dev/null; then
        echo "$current_ip est en ligne"
    else
        echo "$current_ip est hors ligne"
    fi
done