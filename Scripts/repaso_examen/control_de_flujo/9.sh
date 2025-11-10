#!/bin/bash

echo "Escribe el usuario que quieres buscar"
read usuario

grep -q  "^${usuario}:" "/etc/passwd"

if [ $? -eq 0 ]; then
    echo "USUARIO ENCONTRADO"
    else
        echo "USUARIO NO ENCONTRADO"
fi