#!/bin/bash

fecha=$(date +"%d-%m-%Y")

echo "Escribe un nombre de archivo para guardar la copia de seguridad"
read archivo
archivo="${archivo}_${fecha}"

if [ ! -e "${archivo}.tar.gz" ]; then
    # mkdir "$archivo"
    # cp *.txt  "./$archivo/"
    tar -czvf "${archivo}.tar.gz" *.txt
    # rm -R "${archivo}"
    else 
        echo "EL ARCHIVO YA EXISTE"
fi