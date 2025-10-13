#!/bin/bash
# Script: menu_interactivo.sh
# Muestra un menú con varias opciones y ejecuta la acción elegida

opcion=0

while [ "$opcion" != "4" ]; do
    echo "----------------------------"
    echo "       MENÚ PRINCIPAL"
    echo "----------------------------"
    echo "1. Mostrar fecha actual"
    echo "2. Mostrar directorio actual"
    echo "3. Listar archivos"
    echo "4. Salir"
    echo "----------------------------"
    read -p "Elige una opción (1-4): " opcion
    echo

    case $opcion in
        1)
            echo "📅 Fecha actual: $(date)"
            ;;
        2)
            echo "📁 Directorio actual: $(pwd)"
            ;;
        3)
            echo "📄 Archivos en el directorio actual:"
            ls -l
            ;;
        4)
            echo "👋 Saliendo del programa..."
            ;;
        *)
            echo "⚠️  Opción no válida, intenta de nuevo."
            ;;
    esac
    echo
done

