# Ejercicio 20 – Auditor de permisos peligrosos 
# ● Busca en la ruta dada ficheros con permisos 777 o con SUID/SGID activos. 
# ● Genera permisos_peligrosos.csv con columnas: tipo (777/SUID/SGID), ruta, 
# propietario, grupo. 
# ● Si encuentra algo bajo /usr/bin o /bin que no sea del propietario root, añade 
# CRÍTICO al registro. 
# ● Devuelve exit 10 si hubo hallazgos críticos. 

#!/bin/bash

ls -la  -R /home/usuario/Escritorio/ | grep -v "total" | while read linea; do
permisos=$(echo ${linea} | awk {'print $1'})
usuario=$(echo ${linea} | awk {'print $3'})
ruta=$(echo ${linea} | awk {'print $9'})
grupo=$(echo ${linea} | awk {'print $4'})
echo "$permisos $ruta $usuario" >> "./prueba.txt"

    if [[ ${permisos}=="drwxrwxrwx" && ${usuario} != "root" ]]; then
        echo "$permisos $usuario $grupo" >> "./hallazgos.csv"
        else 
            echo "OK"
    fi

done