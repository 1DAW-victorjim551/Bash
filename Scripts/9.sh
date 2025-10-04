#!/bin/bash
num1=$1
operacion=$2
num2=$3
case "$operacion" in
  +)
    echo $((num1 + num2))
    ;;
  -)
    echo $((num1 - num2))
    ;;
  x)
    echo $((num1 * num2))
    ;;
  /)
    echo $((num1 / num2))
    ;;
esac