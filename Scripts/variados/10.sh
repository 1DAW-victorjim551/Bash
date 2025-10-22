#!/bin/bash

mkdir -p ok err
ok=0
fail=0

while read -r url; do
  host=$(echo "$url" | awk -F/ '{print $3}')
  intento=1
  exito=0

  while [ $intento -le 3 ]; do
    codigo=$(curl -s -o "ok/${host}.html" -w "%{http_code}" "$url" 2>"err/${host}.log")
    if [ "$codigo" -eq 200 ]; then
      exito=1
      ((ok++))
      break
    else
      sleep $((2 ** (intento - 1)))
      ((intento++))
    fi
  done

  if [ $exito -eq 0 ]; then
    ((fail++))
  fi
done < urls.txt

echo "Correctas: $ok, Fallidas: $fail" > report.csv