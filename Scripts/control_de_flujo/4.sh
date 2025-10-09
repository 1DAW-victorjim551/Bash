#!/bin/bash

if [ -e "$1" ]; then
    if [ -f "$1" ]; then
        echo "Es un fichero normal"
    elif [ -d "$1" ]; then
        echo "Es un directorio"
    fi
else
    echo "No existe"
fi
