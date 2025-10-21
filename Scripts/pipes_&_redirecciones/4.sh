#!/bin/bash
ls  "./prueba" 1>> "./ok.txt";
ls  "./directorio_prueba" 2>> "./error_4.txt";

#CORRECCION
ls /etc /directorio_inventado >> ok.txt 2> fallos.txt