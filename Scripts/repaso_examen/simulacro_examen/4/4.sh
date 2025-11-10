# 🔴 Ejercicio 4 – Nivel Complejo
# Verificador de integridad y auditoría de permisos
# Crea un script llamado auditoria_integridad.sh que:
# Reciba un directorio como parámetro.


# Si no existe, escriba un error en stderr y termine con código 4.


# Calcule el sha256sum de todos los archivos y guarde el resultado en manifest.sha256.


# En una segunda ejecución, compare los hashes con el manifest previo:


# Si hay diferencias, genere integridad_ko.txt.


# Si todo coincide, genere integridad_ok.txt.


# Busque dentro del directorio archivos con permisos 777 o con bits SUID/SGID activos.


# Guarde los hallazgos en permisos_peligrosos.csv con las columnas: tipo, ruta, propietario y grupo.


# Si encuentra archivos peligrosos, muestre “CRÍTICO” y finalice con código 5.

#!/bin/bash

dir="$1"
manifest="manifest.sha256"
ko="integridad_ko.txt"
ok="integridad_ok.txt"
peligrosos="permisos_peligrosos.csv"

# 🧩 Validar directorio
if [[ ! -d "$dir" ]]; then
    echo "❌ ERROR: El directorio no existe" >&2
    exit 4
fi

# 🧠 Verificación de integridad
if [[ -f "$manifest" ]]; then
    # Segunda ejecución: comparar hashes
    sha256sum -c "$manifest" 2>/dev/null | grep -v ': OK' > "$ko"
    if [[ -s "$ko" ]]; then
        rm -f "$ok"
    else
        echo "Todo coincide" > "$ok"
        rm -f "$ko"
    fi
else
    # Primera ejecución: generar manifest
    find "$dir" -type f -exec sha256sum {} \; > "$manifest"
fi

# 🔐 Auditoría de permisos peligrosos
> "$peligrosos"  # Limpiar archivo

while IFS= read -r archivo; do
    permisos=$(stat -c "%a" "$archivo")
    propietario=$(stat -c "%U" "$archivo")
    grupo=$(stat -c "%G" "$archivo")
    modo=$(stat -c "%A" "$archivo")

    tipo=""

    if [[ "$permisos" == "777" ]]; then
        tipo="PERMISO_777"
    fi

    if [[ "$modo" == *s* ]]; then
        tipo="${tipo:+$tipo|}SUID_SGID"
    fi

    if [[ -n "$tipo" ]]; then
        echo "$tipo,$archivo,$propietario,$grupo" >> "$peligrosos"
    fi
done < <(find "$dir" -type f)

# 🚨 Evaluar hallazgos
if [[ -s "$peligrosos" ]]; then
    echo "CRÍTICO"
    exit 5
fi


