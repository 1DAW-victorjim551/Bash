#!/bin/bash

usuario=$USER
num_procesos=$(ps aux | grep "$usuario" | grep -v "grep" | grep -v "$0" | wc -l)

if [ $num_procesos -gt 50 ]; then
  echo "Demasiados procesos ($num_procesos)" >&2
  exit 2
else
  fecha=$(date +%Y-%m-%d)
  echo "$num_procesos" > "procesos-$fecha.log"
fi