#!/bin/bash

operacion=$1

case "$operacion" in
  fecha)
    echo "Fecha actual:"
    date
    ;;
  usuario)
    echo "Usuario actual:"
    whoami
    ;;
  ruta)
    echo "Directorio actual:"
    pwd
    ;;
  *)
    echo "Comando no existente"
    echo "Comandos: $0 fecha | usuario | ruta"
    ;;
esac
