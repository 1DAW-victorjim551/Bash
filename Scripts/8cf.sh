#!/bin/bash

origen="$1"
destino="$2"


if [ ! -d "$origen" ]; then
    echo "Error: el directorio origen no existe."
    exit 1
fi

if [ ! -d "$destino" ]; then
    echo "Error: el directorio destino no existe."
    exit 1
fi


fecha=$(date +%Y-%m-%d)


for fichero in "$origen"/*.txt; do
    if [ ! -e "$fichero" ]; then
        echo "No se encontraron archivos .txt en la ruta $origen"
        exit 0
    fi

    nombre=$(basename "$fichero" .txt)
    nuevo_nombre="${nombre}_${fecha}.txt"
    cp "$fichero" "$destino/$nuevo_nombre"
done

echo "Backup realizado con éxito."

