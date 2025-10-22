#!/bin/bash
{
  date
  hostname
  df -h
  free -m
} | tee informe.txt

if df -h | awk '{print $5}' | grep -E '9[0-9]%'; then
  echo "ALERTA DISCO" >> informe.txt
fi