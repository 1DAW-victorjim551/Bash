#!/bin/bash
nombrearchivo="$1"

if [ -e "$nombrearchivo" ]; then
    if [ -f "$nombrearchivo" ]; then
        echo "El archivo existe"
    fi
    if [ -d "$nombrearchivo" ]; then
        echo "Es un directorio"
    fi
else
    echo "El archivo no existe"
fi
