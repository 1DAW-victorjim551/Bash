# Ejercicio 15 – Scanner de configuración insegura 
# ● Recorre /etc buscando archivos *.conf. 
# ● Filtra líneas que contengan permitRootLogin yes, PasswordAuthentication 
# yes o AllowEmptyPasswords yes (ignorando may/min). 
# ● Genera hallazgos.csv con columnas: ruta, coincidencia, línea. 
# ● Si no hay coincidencias, imprime Sin hallazgos. Si las hay, exit 7.

#!/bin/bash

salida="./hallazgos.csv"
# find /etc -type f -name "*.conf" > "./conf_files.txt"

grep -RinEi "permitRootLogin yes | PasswordAuthentication yes | AllowEmptyPasswords yes"  /etc --include "*.conf" >> ${salida}

if [ $(wc -l < "${salida}") -gt 1 ]; then

echo "HAY INSEGURIDADES, REVISA $salida"

else
echo "NO HAY INSEGURIDADES"
fi 