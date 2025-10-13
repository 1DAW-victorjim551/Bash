#!/bin/bash
# Script: comprobar_usuario.sh
# Pide un nombre de usuario y comprueba si existe en el sistema (/etc/passwd)

read -p "Introduce el nombre de usuario: " usuario

if grep -q "^${usuario}:" /etc/passwd; then
    echo "✅ El usuario '$usuario' existe en el sistema."
else
    echo "❌ El usuario '$usuario' NO existe en el sistema."
fi

