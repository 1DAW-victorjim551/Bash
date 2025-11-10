# 🔵 Ejercicio 2 – Nivel Avanzado
# Analizador de logs y alerta de seguridad
# Diseña un script llamado alerta_ssh.sh que:
# Lea los últimos 1000 registros del servicio SSH (desde journalctl -u sshd o /var/log/auth.log).


# Cuente el número de intentos fallidos y el número de accesos correctos.


# Si los fallidos superan 20, muestre:

#  ALERTA: más de 20 intentos fallidos
#  y guarde el conteo en ssh_alertas.log.


# Si el sistema no dispone de journalctl, muestre “No disponible” y finalice con código 0.

#!/bin/bash

log=$(journalctl -u ssh.service -n 1000)
exito=$(echo ${log} | grep -c "Accepted")
fracaso=$(echo ${log} | grep -c "Failed password")

    if [[ ${fracaso} -gt 20 ]]; then
        echo "ALERTA : más de 20 intentos fallidos"
        ${fracaso} >> "ssh_alertas.log"
    fi

    if ! command -v journalctl &> /dev/null; then
    echo "No disponible"
    exit 0
fi


