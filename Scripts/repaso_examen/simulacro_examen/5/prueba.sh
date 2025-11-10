#!/bin/bash

opcion=0  # inicializamos la variable

while [[ $opcion != 4 ]]; do
    # Mostrar menú
    echo "----- MENÚ -----"
    echo "1) Opción 1"
    echo "2) Opción 2"
    echo "3) Opción 3"
    echo "4) Salir"
    echo "----------------"
    
    # Leer opción del usuario
    read -p "Elige una opción: " opcion
    
    # Evaluar opción
    case "$opcion" in
        1) echo "Elegiste la opción 1" ;;
        2) echo "Elegiste la opción 2" ;;
        3) echo "Elegiste la opción 3" ;;
        4) echo "Saliendo..." ;;
        *) echo "Opción inválida" ;;
    esac

    echo ""  # línea en blanco para separar iteraciones
done


tamanyo=$(du -b "prueba.sh" | awk {'print $1'})

echo ${tamanyo}

