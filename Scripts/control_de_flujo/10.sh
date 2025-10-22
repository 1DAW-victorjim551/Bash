#!/bin/bash

opcion=0

while [ "$opcion" != "4" ]; do
    echo "_______MENÚ PRINCIPAL______"
    echo "1. Mostrar fecha actual"
    echo "2. Mostrar directorio actual"
    echo "3. Listar archivos"
    echo "4. Salir"
    echo "----------------------------"
    read -p "Elige una opción (1-4): " opcion
    echo

    case $opcion in
        1)
            echo "Fecha actual: $(date)"
            ;;
        2)
            echo "Directorio actual: $(pwd)"
            ;;
        3)
            echo "Archivos en el directorio actual:"
            ls -l
            ;;
        4)
            echo "Saliendo del programa..."
            ;;
        *)
            echo "Opción no válida, intenta de nuevo."
            ;;
    esac
done

