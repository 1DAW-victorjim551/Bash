#!/bin/bash

if [ $# -ne 3 ]; then
echo "No estan los parámetros correctos, deben ser 3"
else
echo "$@" | tr ' ' '\n' | tr '[:lower:]' '[:upper:]'
fi