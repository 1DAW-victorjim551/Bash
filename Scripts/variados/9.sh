#!/bin/bash

diff <(sort lista1.txt) <(sort lista2.txt) > diff.txt

if [ ! -s diff.txt ]; then
  echo "Sin cambios"
else
  echo "Cambios detectados"
  cat diff.txt
fi