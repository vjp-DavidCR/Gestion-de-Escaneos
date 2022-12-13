#!/bin/bash
if ! [ -d "VUL" ]; then
mkdir VUL
fi
clear
#echo "Funciona"
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --infobox "Realizando escaneo de Vulnerabilidades. Esta operación puede tardar un poco..." 0 0
nmap -p- --script=vuln $1 > temp11
cat temp11 > $(echo 'VUL/VUL-'$(date '+%d-%m-%Y-%T'))
if [[ $2 -ne 1 ]]
then
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --title "Escaneo de VULNERABILIDADES → $1" --textbox temp11 0 0
fi
rm temp11
