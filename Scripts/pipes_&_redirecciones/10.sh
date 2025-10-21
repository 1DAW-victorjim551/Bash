#!/bin/bash

cadena=$(cat <<EOF
Fecha y hora: $(date)
---------------------
Espacio en el disco:
$(df -h)
---------------------
Uso de memoria:
$(free -m)
---------------------
EOF
)

echo "$cadena" > informe.txt
