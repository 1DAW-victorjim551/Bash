#!/bin/bash

sort $1 > "temp1.txt"
sort $2 > "temp2.txt"

echo "Variables: $1 $2"

comm -23 "temp1.txt" "temp2.txt" > solo_en_A.txt
comm -13 "temp1.txt" "temp2.txt" > solo_en_B.txt
comm -12 "temp1.txt" "temp2.txt" > en_ambos.txt
rm -R temp1.txt temp2.txt