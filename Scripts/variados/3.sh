#!/bin/bash

log=$1
max_lineas=$2

if [ ! -f "$log" ]; then
  echo "Error: el fichero no existe." >&2
  exit 3
fi

sed -E 's/[[:alnum:]\._%+-]+@[[:alnum:]\.-]+\.[[:alpha:]]{2,}/<EMAIL>/g;
        s/[0-9]{3,}-?[0-9]{6,}/<PHONE>/g' "$log" > temp.log

num_lineas=$(wc -l < temp.log)

if [ "$num_lineas" -gt "$max_lineas" ]; then
  tail -n 500 temp.log > sanitized.log
else
  mv temp.log sanitized.log
fi

rm -f temp.log