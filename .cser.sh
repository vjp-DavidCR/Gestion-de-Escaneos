#!/bin/bash

counter=1
lista=$(
for n in $(ls SER)
do
echo -n " "$n" "$counter
counter=$(($counter + 1))
done
)
#echo $lista

break=0
while (( break == 0 )); do
dialog --backtitle "Proyecto Shell Script" --title "Listar Escaneos de Servicios" --menu "Elige un registro" 0 0 0 $lista 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    dialog --backtitle "Proyecto Shell Script" --title "Listar Escaneos de Servicios" --textbox "SER/$Eleccion" 0 0
  else
    dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
    break=1
fi
done
