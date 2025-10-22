#!/bin/bash

set -euo pipefail

archivo=$1

if [ ! -f "$archivo" ]; then
  echo "Archivo no encontrado." >&2
  exit 1
fi

trap 'echo "Error en el pipeline" >&2' ERR

cat "$archivo" | grep -oE '\w+' | sort | uniq > diccionario.txt
echo "Diccionario generado en diccionario.txt"