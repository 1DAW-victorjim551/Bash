#!/bin/bash
# Script: procesos_usuario.sh
# Muestra cada 5 segundos los procesos del usuario actual

# watch -n 5 "ps -u $(whoami)"

while true; do
    clear
    date
    ps
    # ps -u "$USER" --sort=pid
    sleep 5
done