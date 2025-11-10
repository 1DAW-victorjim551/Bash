#!/bin/bash
{
  date
  hostname
  df -h
  free -m
} | tee informe.txt

df -h | awk 'NR>1 {gsub(/%/, "", $5); print $5}' | while read -r linea; do
   if [[ $linea -gt 90 ]]; then
    echo "ALERTA DISCO" >> "informe.txt"
  fi
  done 



