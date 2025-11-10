#!/bin/bash

opcion=0

while [ "$opcion" != 4 ]
do
    echo "Elige una opción:"
    echo "1) Saludar"
    echo "2) Mostrar la fecha"
    echo "3) Mostrar el directorio actual"
    echo "4) Salir"
    read opcion

    case $opcion in
        1)
            echo "¡Hola! Espero que tengas un buen día."
            ;;
        2)
            echo "La fecha actual es: $(date)"
            ;;
        3)
            echo "Estás en el directorio: $(pwd)"
            ;;
        4)
            echo "Saliendo del programa..."
            ;;
        *)
            echo "Opción no válida. Intenta de nuevo."
            ;;
    esac
done
