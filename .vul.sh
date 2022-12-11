#!/bin/bash
dialog --backtitle "Proyecto Shell Script" --infobox "Inicializando..." 0 0
git clone https://github.com/scipag/vulscan scipag_vulscan 2>/dev/null
sudo ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan
clear
#echo "Funciona"
dialog --backtitle "Proyecto Shell Script" --infobox "Realizando escaneo de Vulnerabilidades. Esta operación puede tardar un poco..." 0 0
nmap -sV --script=vulscan/vulscan.nse $1 > temp11
cat temp11 > $(echo 'VUL/VUL-'$(date '+%d-%m-%Y-%T'))
dialog --backtitle "Proyecto Shell Script" --title "Listar Escaneos de Vulnerabilidades" --textbox temp11 0 0
rm temp11
