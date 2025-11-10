# 🟠 Ejercicio 1 – Nivel Medio
# Gestor de copias con comprobación de tamaño y logs

# Crea un script llamado backup_verificado.sh que:

# Reciba dos parámetros: directorio origen y directorio destino.

# Compruebe que ambos existen; si alguno no existe, escriba un error en stderr y termine con código 1.

# Copie todos los archivos modificados en las últimas 24 horas del origen al destino.

# Verifique el tamaño total en bytes del contenido del origen y destino.

# Si coinciden, registre en backup_status.log:

#!/bin/bash

if [[ ! -d $1 || ! -d $2 ]]; then
    echo "ERROR" >&2
    exit 1
    else 
        find "$1" -type f -mtime -1 -exec cp {} "$2" \;
        
        pesoOrigen=$(du -sb $1 | awk {'print $1'}) 
        pesoDestino=$(du -sb $2 | awk {'print $1'}) 
        echo "${pesoOrigen}"
        echo "${pesoDestino}"

        if [[ ${pesoOrigen} -eq ${pesoDestino} ]]; then
            echo "$(date '+%F %T') Copia correcta ($pesoOrigen bytes)" >> "backup_status.log"
        fi
fi
