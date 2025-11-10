# ⚫ Ejercicio 5 – Nivel Complejo
# Sistema de descarga concurrente con control de errores
# Crea un script llamado descarga_paralela.sh que:
# Lea un archivo urls.txt con una lista de direcciones web.


# Cree dos carpetas: ok/ y err/.


# Descargue todas las URLs en paralelo.


# Si la descarga es correcta (HTTP 200), guarde el contenido en ok/<host>.html.


# Si falla, guarde el log en err/<host>.log.


# Implemente reintentos exponenciales (1s, 2s, 4s) si la descarga no es exitosa.


# Al finalizar, genere un archivo report.csv con:

#  OK,<número_correctas>
# KO,<número_fallidas>

if [[ ! -d "./ok" || ! -d "./err" ]]; then
    mkdir -p "./ok/"
    mkdir -p "./err/"
fi


#!/bin/bash

archivo="./urls.txt"

while IFS= read -r url; do
    if [[ -n "$url" ]]; then
        echo "Descargando: $url"
        for ((i = 1; i <= 3; i++)); do
            wget "$url" &
            if [[ $? -eq 0 ]]; then
                echo "Descarga exitosa en intento $i"
                echo $url >> "./ok/ok.html"
                break
            else
                echo "Falló intento $i para $url"
                echo "FALLÓ :  ${url}" >> "./err/err.log"
            fi
        done
    fi
done < "$archivo"

echo " $(wc -l ./ok/ok.html) , $(wc -l ./err/err.log)" >> "./report.csv"


