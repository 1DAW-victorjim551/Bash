#!/bin/bash

generar_archivo() {
  local archivo=$1
  if [ -f "$archivo" ]; then
    read -p "$archivo existe. ¿Sobrescribir? (s/n): " resp
    [ "$resp" != "s" ] && return
  fi
  echo "$2" > "$archivo"
  echo "$archivo generado."
}

while true; do
  echo "1) Generar README.md"
  echo "2) Generar .gitignore"
  echo "3) Generar deploy.sh"
  echo "4) Salir"
  read -p "Elige una opción: " op

  case $op in
    1) generar_archivo "README.md" "# Proyecto nuevo" ;;
    2) generar_archivo ".gitignore" "*.log\nnode_modules/\n*.tmp" ;;
    3) generar_archivo "deploy.sh" "#!/usr/bin/env bash\n\necho 'Desplegando...'" ;;
    4) exit 0 ;;
    *) echo "Opción no válida." ;;
  esac
done