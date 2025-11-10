# Ejercicio 17 – Monitor de espacio en disco por punto de 
# montaje 
# ● Crea un bucle que recorra salidas de df -h (excluye tmpfs y overlay). 
# ● Para cada punto de montaje, si uso ≥ 85%, añade línea ALERTA <mount> <uso> a 
# disco_alertas.txt. 
# ● Si hubo alertas, devuelve exit 8; si no, imprime OK.

#!/bin/bash

    df -h | grep -vE '^tmpfs|^overlay' | tail -n +2 | while read linea; do
    uso=$(echo "$linea" | awk '{gsub("%","",$6); print $6}')
    mount=$(echo "$linea" | awk '{print $7}')
    echo $uso
    if [ "${uso}" -gt 85 ]; then
        echo "ALERTA "$uso%" en ${mount}" >> "./salida.txt"
        exit 8
        else
            echo "OK"
    fi
done


