#!/bin/bash

>admins.txt
>usuarios.txt
>malformadas.txt

while IFS=, read -r user email role; do
  if [ -z "$user" ] || [ -z "$email" ] || [ -z "$role" ]; then
    echo "$user,$email,$role" >> malformadas.txt
  elif [ "$role" = "admin" ]; then
    echo "$user,$email,$role" >> admins.txt
  else
    echo "$user,$email,$role" >> usuarios.txt
  fi
done < usuarios.csv