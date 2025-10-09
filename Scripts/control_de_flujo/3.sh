#!/bin/bash

num1=$1
num2=$2
suma=$(($num1+$num2))
resta=$(($num1-$num2))
multiplicacion=$(($num1*$num2))
division=$(($num1/$num2))

echo "Suma de $num1 y $num2: $suma"
echo "Resta de $num1 y $num2: $resta"
echo "Multiplicacion de $num1 y $num2: $multiplicacion"
echo "Division de $num1 y $num2: $suma"