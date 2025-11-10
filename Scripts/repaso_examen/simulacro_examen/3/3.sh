# 🟣 Ejercicio 3 – Nivel Avanzado
# Procesador de inventarios con comparación y resumen
# Crea un script llamado comparar_inventarios.sh que:
# Reciba dos archivos de texto (A.txt y B.txt).


# Ordene ambos temporalmente.


# Genere tres archivos:


# solo_en_A.txt


# solo_en_B.txt


# en_ambos.txt


# Muestre por pantalla:

#  Equipos solo en A: <num>
# Equipos solo en B: <num>
# Equipos en ambos: <num>


# Si alguno de los archivos no existe o está vacío, escriba un error en stderr y termine con código 3.


sort "./list1.txt" > temp1.txt
sort "./list2.txt" > temp2.txt

comm -23 "./temp1.txt" "./temp2.txt" > "solo_en_A.txt"
comm -13 "./temp1.txt" "./temp2.txt" > "solo_en_B.txt"
comm -12 "./temp1.txt" "./temp2.txt" > "en_ambos.txt"

rm -R "temp1.txt" "temp2.txt"

if [[ $? -ne 0 ]]; then
    echo "ERROR EN EL COMANDO " >&2
    exit 3
fi

echo "ELEMENTOS LISTA SOLO EN A $(wc -l "solo_en_A.txt")"
echo "ELEMENTOS LISTA SOLO EN B $(wc -l "solo_en_B.txt")"
echo "ELEMENTOS LISTA EN AMBOS $(wc -l "en_ambos.txt")"
