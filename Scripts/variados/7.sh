#!/bin/bash

fecha=$(date +%Y%m%d)
logs=$(find . -name "*.log" -type f -mtime +7)

if [ -z "$logs" ]; then
  echo "Nada que comprimir"
  exit 0
fi

tar -czf "logs-$fecha.tar.gz" $logs || { echo "Error al comprimir"; exit 4; }

echo "Logs comprimidos en logs-$fecha.tar.gz"