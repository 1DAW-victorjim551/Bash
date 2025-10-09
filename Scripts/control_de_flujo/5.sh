#!/bin/bash

if [ -r "$1" ]; then
    echo "Tiene permiso de lectura"
fi

if [ -w "$1" ]; then
    echo "Tiene permiso de escritura"
fi

if [ -x "$1" ]; then
    echo "Tiene permiso de ejecución"
fi
