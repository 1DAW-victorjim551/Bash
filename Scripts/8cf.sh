#!/bin/bash
# Script: backup_simple.sh
# Uso: ./backup_simple.sh origen destino
# Copia todos los .txt del directorio origen al destino añadiendo la fecha al nombre

# --- Comprobación de argumentos ---
if [ $# -ne 2 ]; then
    echo "Uso: $0 <directorio_origen> <directorio_destino>"
    exit 1
fi

origen="$1"
destino="$2"

# --- Comprobación de existencia de directorios ---
if [ ! -d "$origen" ]; then
    echo "Error: el directorio origen no existe."
    exit 1
fi

if [ ! -d "$destino" ]; then
    echo "Error: el directorio destino no existe."
    exit 1
fi

# --- Fecha actual ---
fecha=$(date +%Y-%m-%d)

# --- Copia de archivos .txt ---
for fichero in "$origen"/*.txt; do
    # Comprobar que hay al menos un archivo .txt
    if [ ! -e "$fichero" ]; then
        echo "No se encontraron archivos .txt en $origen"
        exit 0
    fi

    nombre=$(basename "$fichero" .txt)
    nuevo_nombre="${nombre}_${fecha}.txt"
    cp "$fichero" "$destino/$nuevo_nombre"
    echo "Copiado: $fichero → $destino/$nuevo_nombre"
done

echo "Backup completado correctamente."

