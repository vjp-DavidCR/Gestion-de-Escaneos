#!/bin/bash
#echo "Funciona"
if ! [ -d "SER" ]; then
mkdir SER
fi

nmap $1 > temp10
cat temp10 > $(echo 'SER/SER-'$(date '+%d-%m-%Y-%T'))

lista=$(
    for n in $(cat temp10); do
    echo $n"\n"
    done)
if [[ $2 -ne 1 ]]
then
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --title "Escaneo de SERVICIOS → $1" --textbox temp10 0 0
head -n -2 temp10 > temp.txt ; mv temp.txt temp10
top=$(($(wc -l temp10 | cut -f 1 -d " ") - $(cat -n temp10 | grep "PORT" | cut -f 1)))
cat temp10 | tail -$top > temp.txt
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --title "Resumen de SERVICIOS → $1" --textbox temp.txt 0 0
rm temp.txt
fi
rm temp10
