#!/bin/bash

if [ $# !~ ^[0-9]+$ ] then
    echo "Debes ingresar numeros"
else
    if [ $# -ne 2 ]; then
    echo "Necesito 2 parametros"
    exit 1;

else   
let suma=$1+$2 
echo “La suma de $1 y $2 es $suma”
fi
fi

