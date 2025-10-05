#!/bin/bash

origen=$1
destino=$2

if [ -e "$origen" ]; then
    if [ -e "$destino" ]; then
        echo "El archivo destino '$destino' ya existe. ¿Deseas sobrescribirlo? (s/n)"
        read respuesta
        if [ "$respuesta" != "s" ]; then
            echo "Copia cancelada."
            exit 0
        else
            cp "$origen" "$destino"
            echo "Archivo copiado correctamente."
        fi
    else
        cp "$origen" "$destino"
        echo "Archivo copiado correctamente."
    fi
else
    echo "Error: el archivo de la ruta de origen no existe."
fi
