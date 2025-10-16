#!/bin/bash
usuario=$1
# read -p "Introduce el nombre de usuario: " usuario


if grep "${^usuario}" /etc/passwd; then
    echo " El usuario '$usuario' existe en el sistema."
else
    echo "El usuario '$usuario' NO existe en el sistema."
fi

