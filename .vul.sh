#!/bin/bash
dialog --backtitle "Proyecto Shell Script" --infobox "Inicializando..." 0 0
git clone https://github.com/scipag/vulscan scipag_vulscan 2>/dev/null
sudo ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan
clear
#echo "Funciona"
dialog --backtitle "Proyecto Shell Script" --infobox "Realizando escaneo de Vulnerabilidades. Esta operación puede tardar un poco..." 0 0
nmap -sV --script=vulscan/vulscan.nse $1 > temp11
cat temp11 > $(echo 'VUL/VUL-'$(date '+%d-%m-%Y-%T'))
if [[ $2 -ne 1 ]]
then
dialog --backtitle "Proyecto Shell Script" --title "Escaneo de VULNERABILIDADES → $1" --textbox temp11 0 0
fi
rm temp11
