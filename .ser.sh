#!/bin/bash
#echo "Funciona"
nmap $1 > temp10
cat temp10 > $(echo 'SER/SER-'$(date '+%d-%m-%Y-%T'))

lista=$(
    for n in $(cat temp10); do
    echo $n"\n"
    done)
dialog --backtitle "Proyecto Shell Script" --title "Resultados del Escaneo" --textbox temp10 0 0

head -n -2 temp10 > temp.txt ; mv temp.txt temp10
top=$(($(wc -l temp10 | cut -f 1 -d " ") - $(cat -n temp10 | grep "PORT" | cut -f 1)))
cat temp10 | tail -$top > temp.txt
rm temp10

dialog --backtitle "Proyecto Shell Script" --title "Resumen de Servicios" --textbox temp.txt 0 0
rm temp.txt
