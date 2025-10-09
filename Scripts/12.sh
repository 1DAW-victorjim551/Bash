#!/bin/bash
date=$(date +"%d%m%Y");
#no sé como comprobar el tamaño de un archivo, no puedo continuar
LOG_FILE="ej12_files/app.log";
ROTATE_LOG=./"rotate.log";
MAX_SIZE="10";
TAR_FILE="./ej12_files/app-$date.tar.gz";
LOG_SIZE=$(ls -s $LOG_FILE | cut -c 1-2);

if [ $LOG_SIZE -gt $MAX_SIZE ]; then
    echo "El archivo es mayor de 10MB";
    tar -czvf "$TAR_FILE" "$LOG_FILE";
    echo "" > ej12_files/app.log;
else
    echo "El archivo es menor de 10 MB";
fi
