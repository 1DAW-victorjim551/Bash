#!/bin/bash

origen=$1
destino=$2

if [ $# -ne 2 ]; then
  echo "Uso: $0 <origen> <destino>"
  exit 1
fi

cp -r "$origen" "$destino" >backup.log 2>backup.err
codigo=$?

if [ $codigo -eq 0 ]; then
  echo "Backup OK"
  date >> status.log
else
  echo "Backup FAILED"
  exit 1
fi